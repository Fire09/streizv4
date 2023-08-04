local radarStatus = {}

STR.register("rd-atc:setRadarStatus", function(pHasRadarEnabled)
    radarStatus = pHasRadarEnabled
    return radarStatus
end)