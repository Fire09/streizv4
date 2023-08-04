local DroppedEvidences = {}

function GetRandomString(lenght)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomString, stringLenght = '', lenght or 10
    local charTable = {}

    for char in chars:gmatch"." do
        table.insert(charTable, char)
    end

    for i = 1, stringLenght do
        randomString = randomString .. charTable[math.random(1, #charTable)]
    end
    return randomString
end

local function generateDNA()
    for i = 1, 10 do
        local dna = GetRandomString(7)

        local exist = MySQL.scalar.await([[
            SELECT dna
            FROM characters
            WHERE dna = ?
        ]],
        { dna })

        if not exist then
            return dna
        end

        Citizen.Wait(500)
    end
end

RPC.register("rd-evidence:getDNA", function(src)
    local cid = exports["rd-base"]:getChar(src, "id")
    if not cid then
        return "ERROR"
    end

    local dna = MySQL.scalar.await([[
        SELECT dna
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    if not dna then
        dna = generateDNA()

        MySQL.update.await([[
            UPDATE characters
            SET dna = ?
            WHERE id = ?
        ]],
        { dna, cid })
    end

    return dna
end)

RPC.register("rd-evidence:fetchEvidence", function(src)
    return true, DroppedEvidences
end)

RPC.register("rd-evidence:addEvidence", function(src, pDropped)
    for k, v in pairs(pDropped) do
        DroppedEvidences[k] = v
    end

    return true
end)

RPC.register("rd-evidence:clearEvidence", function(src, pCoords, pEvidence)
    for i, v in ipairs(pEvidence) do
        if DroppedEvidences[v] then
            DroppedEvidences[v] = nil
        end
    end

    local players = GetPlayers()
    for i, v in ipairs(players) do
        local coords = GetEntityCoords(GetPlayerPed(v))

        if #(pCoords - coords) < 50.0 then
            TriggerClientEvent("rd-evidence:clearCache", v)
        end
    end

    return true
end)