function GetCharacterType()
    local GetCharacterType = RPC.execute("rd-character:GetCharacterType")
    print("GetCharacterType",GetCharacterType)
    return GetCharacterType
end

function AddHCScore(pValue)
    local AddHCScore = RPC.execute("rd-character:AddHCScore", pValue)
    print("AddHCScore",AddHCScore)
    return AddHCScore
end

function RollICU()
    local RollICU = RPC.execute("rd-character:RollICU")
    print("RollICU",RollICU)
    return RollICU
end

exports("GetCharacterType", GetCharacterType)
exports("AddHCScore", AddHCScore)
exports("RollICU", RollICU)