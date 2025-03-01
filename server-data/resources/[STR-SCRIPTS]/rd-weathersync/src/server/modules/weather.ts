import { windDirections, includesRain } from "./../../common/weather";
import { weightedElement, randomArrElement } from "../helpers"
import { activeWeathers, preproducedTransitions, rainLevels, timePerWeather, transitions, windSpeeds, temperatureRanges } from "../../common/weather";
import { Weather, WeatherProgression } from "../../common/types"
import { getRandomInt } from "fivem-js";

let weatherProgression:WeatherProgression[] = []

setImmediate(async () => {
    for (let i=0; i<preproducedTransitions; i++) {
        await setNextProgression()
    }
})

setInterval(() => {
    weatherProgression.shift()

    setNextProgression()

    const currentWeather = weatherProgression[0]

    // console.log(`^2[WEATHER] ${currentWeather.weather} at ${currentWeather.temperature}°F with ${(currentWeather.windSpeed * 2.236936).toFixed(2)}mph ${windDirections[Math.round(currentWeather.windDir)].long} ${includesRain.includes(currentWeather.weather) ? `with ${Math.round(currentWeather.rainLevel * 100)}% Rain` : ""}`)

    emitNet("rd-weathersync:client:weather", -1, currentWeather)
    emitNet("rd-weathersync:currentWeather", -1, currentWeather.weather)
}, timePerWeather * 1000)

onNet("rd-weathersync:client:weather:request", () => {
    emitNet("rd-weathersync:client:weather", global.source, weatherProgression[0])
    emitNet("rd-weathersync:currentWeather", global.source, weatherProgression[0].weather)
})

onNet("rd-weathersync:setWeather", (source: string, param: string) => {
    const weather = param as Weather
    if (!activeWeathers.includes(weather)) {
        return emitNet("DoLongHudText", source, "Format: /weather [type]", 2)
    }

    const temperature = temperatureRanges[weather] ?? [80, 100]

    weatherProgression = [{
        weather,
        windSpeed: Math.random() * windSpeeds[weather],
        windDir: Math.random() * 7,
        rainLevel: rainLevels[weather] ?? 0,
        temperature: getRandomInt(temperature[0], temperature[1])
    }]

    for (let i=0; i<preproducedTransitions-1; i++) {
        setNextProgression()
    }

    emitNet("rd-weathersync:client:weather", -1, weatherProgression[0])
    emitNet("rd-weathersync:currentWeather", -1, weatherProgression[0].weather)
})

const setNextProgression = (): void => {
    const lastWeather = weatherProgression[weatherProgression.length - 1]

    if (!lastWeather) {
        const firstElement = randomArrElement(activeWeathers)
        const temperature = temperatureRanges[firstElement] ?? [80, 100]
        weatherProgression.push({
            weather: firstElement,
            windSpeed: Math.random() * windSpeeds[firstElement],
            windDir: Math.random() * 7,
            rainLevel: rainLevels[firstElement] ?? 0,
            temperature: getRandomInt(temperature[0], temperature[1])
        })
    } else {
        const transition = getNextTransition(lastWeather.weather)
        const temperature = temperatureRanges[transition] ?? [80, 100]
        weatherProgression.push({
            weather: transition,
            windSpeed: Math.random() * windSpeeds[transition],
            windDir: Math.random() * 7,
            rainLevel: rainLevels[transition] ?? 0,
            temperature: getRandomInt(temperature[0], temperature[1])
        })
    }
}

const getNextTransition = (weather: Weather): Weather => {
    const weatherTransitions = transitions[weather]

    const nextTransition = weightedElement(weatherTransitions)

    if (!activeWeathers.includes(nextTransition.to)) {
        return getNextTransition(weather)
    }
    return nextTransition.to
}

global.exports("currentWeather", () => weatherProgression[0])
global.exports("getProgression", () => weatherProgression)