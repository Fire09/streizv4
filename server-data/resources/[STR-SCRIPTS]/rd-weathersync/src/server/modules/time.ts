import { secondsPerDay, secondsPerMinute } from "../../common/time"

let time = 0

// makes sure time is consistent by real time on script start
setImmediate(() => {
    const date = new Date()
    const seconds = (date.getUTCHours() * 3600 + date.getUTCMinutes() * 60 + date.getUTCSeconds()) % secondsPerDay

    const progression = seconds / secondsPerDay

    time = Math.floor(progression * (24 * 60))

    emitNet("rd-weathersync:client:time", -1, time)
})

setInterval(() => {
    time++
    if (time >= 24 * 60) {
        time = 0
    }

    emit("rd-weathersync:server:time", time)
    emitNet("rd-weathersync:currentTime", -1, Math.floor(time / 60), time % 60)
}, secondsPerMinute * 1000)

onNet("rd-weathersync:setTime", (source: string, param: string) => {
    const _time = parseInt(param) * 60

    if (_time < 0 || _time > 1440) {
        return emitNet("DoLongHudText", source, "Format: /time [0-24]", 2)
    }

    time = _time
    emit("rd-weathersync:server:time", time)
    emitNet("rd-weathersync:client:time", -1, time)
    emitNet("rd-weathersync:currentTime", -1, Math.floor(time / 60), time % 60)
})

onNet("rd-weathersync:client:time:request", () => {
    emitNet("rd-weathersync:client:time", global.source, time)
})

export const currentTime = (): number => {
    return time
}
export const currentHour = (): number => {
    return Math.floor(time / 60)
}
export const currentMinute = (): number => {
    return time % 60
}
export const currentTimeFormatted = (): string => {
    return `${currentHour().toString().padStart(2, "0")}:${currentMinute().toString().padStart(2, "0")}`
}

global.exports("currentTime", currentTime)
global.exports("currentHour", currentHour)
global.exports("currentMinute", currentMinute)
global.exports("currentTimeFormatted", currentTimeFormatted)