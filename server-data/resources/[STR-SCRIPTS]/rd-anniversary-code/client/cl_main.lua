local sounds = {
    ["screech2"] = {
        sound = "screech2",
        bank = "EVENTS_ANNIVERSARY"
    },
    ["heptapod"] = {
        sound = "heptapod",
        bank = "EVENTS_ANNIVERSARY"
    },
    ["monster"] = {
        sound = "monster_sound",
        bank = "EVENTS_ANNIVERSARY",
    },
    ["screech"] = {
        sound = "screech",
        bank = "EVENTS_ANNIVERSARY",
    },
    ["clock"] = {
        sound = "clock_effect",
        bank = "EVENTS_ANNIVERSARY_01",
    },
    ["tripod"] = {
        sound = "war_of_the_worlds_tripod",
        bank = "EVENTS_ANNIVERSARY_01",
    },
    ["muto"] = {
        sound = "muto_1",
        bank = "EVENTS_ANNIVERSARY_01",
    },
    ["muto2"] = {
        sound = "muto_2",
        bank = "EVENTS_ANNIVERSARY_02",
    },
    ["muto3"] = {
        sound = "muto_3",
        bank = "EVENTS_ANNIVERSARY_02",
    },
    ["muto4"] = {
        sound = "muto_4",
        bank = "EVENTS_ANNIVERSARY_02",
    },
    ["muto5"] = {
        sound = "muto_steps",
        bank = "EVENTS_ANNIVERSARY_02",
    },
    ["muto6"] = {
        sound = "muto_steps_2",
        bank = "EVENTS_ANNIVERSARY_03",
    }
}

STX.Events.onNet('anniversary:playSound', function (pCoords, pSound)
    local soundId = GetSoundId()

    local soundToPlay = sounds["monster"]

    if pSound ~= nil and sounds[pSound] ~= nil then soundToPlay = sounds[pSound] end

    while not RequestScriptAudioBank("DLC_NIKEZ_EVENTS\\".. soundToPlay.bank, false) do
        Wait(0)
    end

    local interiorAtCoords = GetInteriorAtCoords(pCoords.x, pCoords.y, pCoords.z)

    PlaySoundFromCoord(soundId, soundToPlay.sound, pCoords.x, pCoords.y, pCoords.z, 'DLC_NIKEZ_EVENTS', false, 1, interiorAtCoords == 0 and true or false)

    SetTimeout(25000, function()
        if not HasSoundFinished(soundId) then
            StopSound(soundId)
            ReleaseSoundId(soundId)
            ReleaseScriptAudioBank()
        end
    end)
end)