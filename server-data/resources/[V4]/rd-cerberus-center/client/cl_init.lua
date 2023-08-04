Citizen.CreateThread(function()
  exports["rd-polytarget"]:AddBoxZone("cbc_entrance", vector3(-127.28, -583.59, 35.07), 0.4, 0.4, {
    heading=340,
    minZ=35.07,
    maxZ=35.47,
  })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_entrance", {{
    id =  'cbc_entrance',
    label =  'Elevator (Preview Offices)',
    icon =  'fas fa-circle',
    event = "rd-cbc:showElevatorOptions",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })

  exports["rd-polytarget"]:AddBoxZone("cbc_business_elevators", vector3(-129.82, -582.65, 35.07), 0.4, 0.4, {
    heading=340,
    minZ=35.12,
    maxZ=35.52,
  })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_business_elevators", {{
    id =  'cbc_business_elevators',
    label =  'Elevator',
    icon =  'fas fa-circle',
    event = "rd-cbc:showBusinessElevatorOptions",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })

  exports["rd-polytarget"]:AddBoxZone("cbc_office_exit", vector3(-141.63, -621.85, 168.82), 0.4, 0.4, {
    heading=8,
    minZ=168.87,
    maxZ=169.27,
  })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_office_exit", {{
    id =  'cbc_office_exit',
    label =  'Exit',
    icon =  'fas fa-circle',
    event = "rd-cbc:officeLeave",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_office_exit", {{
    id =  'cbc_business_elevators_exit',
    label =  'Elevator',
    icon =  'fas fa-circle',
    event = "rd-cbc:showBusinessElevatorOptions",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })

  exports["rd-polytarget"]:AddBoxZone("cbc_office_config", vector3(-123.89, -591.72, 35.07), 0.4, 0.4, {
    heading=354,
    minZ=34.67,
    maxZ=35.07,
  })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_office_config", {{
    id =  'cbc_office_config_add',
    label =  'Add Business',
    icon =  'fas fa-user-plus',
    event = "rd-cbc:addBusiness",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })
  exports["rd-interact"]:AddPeekEntryByPolyTarget("cbc_office_config", {{
    id =  'cbc_office_config_del',
    label =  'Delete Business',
    icon =  'fas fa-user-minus',
    event = "rd-cbc:deleteBusiness",
    parameters =  {},
  }}, { distance = { radius = 1.5 } })
end)
