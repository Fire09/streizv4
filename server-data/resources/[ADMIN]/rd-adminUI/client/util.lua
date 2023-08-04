function getJsonDataFromAdminBans()
    local imDoneNow = STR.execute("rd-adminUI:getRecentBans")
    return imDoneNow
  end
  
  exports('getJsonDataFromAdminBans',getJsonDataFromAdminBans)
  