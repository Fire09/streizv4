
MenuData = {
  apartment_check = {
    {
      title = _L("apartments-ui-apartment", "Apartment"),
      description = _L("apartments-judge-foreclose", "Forclose Apartment"),
      key = "judge",
      children = {
          { title = _L("apartments-ui-yes", "Yes"), action = "rd-apartments:handler", key = { forclose = true} },
          { title = _L("apartments-ui-no", "No"), action = "rd-apartments:handler", key = { forclose = false } },
      }
    }
  }
}
