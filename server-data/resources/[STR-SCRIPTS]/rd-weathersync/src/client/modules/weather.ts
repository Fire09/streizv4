import { wait } from "../functions"
import { includesRain, includesSnow, overrideTime, temperatureRanges, windDirections } from "../../common/weather";
import { Weather, WeatherProgression } from "../../common/types"
import { getRandomInt } from "fivem-js";
import { vehicleTemp, vehicleCleaning } from "./car";

let weatherFrozen = false

export let currentWeather: WeatherProgression = {
    weather: "EXTRASUNNY",
    windSpeed: 0,
    windDir: 0,
    rainLevel: 0,
    temperature: 0
}

onNet("insideShell", (inside: boolean) => {
    if (inside === true) {
        weatherFrozen = true;
        SetWeatherTypeOvertimePersist("CLEAR", 0);
        ClearOverrideWeather();
        ClearWeatherTypePersist();
        SetWeatherTypePersist("CLEAR");
        SetWeatherTypeNow("CLEAR");
        SetWeatherTypeNowPersist("CLEAR");
        SetForceVehicleTrails(false);
        SetForcePedFootstepsTracks(false);
        SetRainFxIntensity(-1);
        SetWindSpeed(0);
        SetWindDirection(0);
    } else {
        weatherFrozen = false;
        emitNet("rd-weathersync:client:weather:request");
    }
})

onNet("insideSpawn", (inside: boolean) => {
    if (inside === true) {
        weatherFrozen = true;
        SetWeatherTypeOvertimePersist("CLEAR", 0);
        ClearOverrideWeather();
        ClearWeatherTypePersist();
        SetWeatherTypePersist("CLEAR");
        SetWeatherTypeNow("CLEAR");
        SetWeatherTypeNowPersist("CLEAR");
        SetForceVehicleTrails(false);
        SetForcePedFootstepsTracks(false);
        SetRainFxIntensity(-1);
        SetWindSpeed(0);
        SetWindDirection(0);
    } else {
        weatherFrozen = false;
        emitNet("rd-weathersync:client:weather:request");
    }
})

setImmediate(() => {
    emitNet("rd-weathersync:client:weather:request")
})

const setWeather = async (weather: WeatherProgression, skipFreeze = false): Promise<void> => {
    if (weatherFrozen && !skipFreeze) {
        return
    }

    if (currentWeather.weather !== weather.weather) {
        // emit("rd-weathersync:currentWeather", weather.weather)
        SetWeatherTypeOvertimePersist(weather.weather, overrideTime)
        await wait(overrideTime * 1000)
        currentWeather = weather
    }

    ClearOverrideWeather()
    ClearWeatherTypePersist()

    SetWeatherTypePersist(currentWeather.weather)
    SetWeatherTypeNow(currentWeather.weather)
    SetWeatherTypeNowPersist(currentWeather.weather)
    SetForceVehicleTrails(includesSnow.includes(currentWeather.weather))
    SetForcePedFootstepsTracks(includesSnow.includes(currentWeather.weather))

    if (includesRain.includes(currentWeather.weather)) {
        SetRainFxIntensity(weather.rainLevel)
    } else {
        SetRainFxIntensity(-1);
    }

    SetWindSpeed(weather.windSpeed)
    SetWindDirection(weather.windDir)
}

onNet("rd-weathersync:client:weather", async (weather: WeatherProgression) => {
    setWeather(weather, false)
})

setInterval(() => {
    vehicleCleaning(currentWeather)
    vehicleTemp(currentWeather)
}, 30000)

global.exports("FreezeWeather", (freeze: boolean, freezeAt?: Weather) => {
    weatherFrozen = freeze
    if (weatherFrozen && freezeAt) {
        const temperature = temperatureRanges[freezeAt] ?? [80, 100]

        setWeather({
            weather: freezeAt,
            windDir: 0,
            windSpeed: 0,
            rainLevel: -1,
            temperature: getRandomInt(temperature[0], temperature[1])
        }, true)

        return
    }

    if (!weatherFrozen) {
        emitNet("rd-weathersync:client:weather:request")
    }
})
