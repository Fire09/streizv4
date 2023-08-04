import { secondsPerMinute } from "../../common/time"

let timeFrozen = false
let currentTime = 0

onNet("insideShell", (inside: boolean) => {
    if (inside === true) {
        timeFrozen = true;
        currentTime = 1380;
        setIngameTime();
    } else {
        timeFrozen = false;
        emitNet("rd-weathersync:client:time:request");
    }
})

onNet("insideSpawn", (inside: boolean) => {
    if (inside === true) {
        timeFrozen = true;
        currentTime = 720;
        setIngameTime();
    } else {
        timeFrozen = false;
        emitNet("rd-weathersync:client:time:request");
    }
})

setImmediate(() => {
    emitNet("rd-weathersync:client:time:request")
})

onNet("rd-weathersync:client:time", (time: number) => {
    if (timeFrozen) {
        return
    }
    currentTime = time
})

setInterval(() => {
    if (!timeFrozen) {
        currentTime++
        if (currentTime >= 1440) {
            currentTime = 0
        }

        setIngameTime()
    }
}, secondsPerMinute * 1000)

const setIngameTime = (): void => {
    const hour = Math.floor(currentTime / 60)
    const minute = currentTime % 60

    NetworkOverrideClockTime(hour, minute, 0)
}

global.exports("FreezeTime", (freeze: boolean, freezeAt ? : number) => {
    timeFrozen = freeze
    if (timeFrozen && freezeAt) {
        currentTime = freezeAt
        setIngameTime()
        return
    }
    if (!timeFrozen) {
        emitNet("rd-weathersync:client:time:request")
    }
})