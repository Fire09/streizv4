-- 711.3755,-969.5569,30.39

CreateThread(function()


    exports["rd-polytarget"]:AddBoxZone(
        "pastels_shop_repair_table",
        vector3(710.66, -969.48, 30.4), 2.25, 0.95,
        {
          minZ = 30.0,
          maxZ = 30.45
        }
      );

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "pastels_shop_repair_table",
      {
        {
          event = "rd-business:repairItem",
          id = "pastels_shop_repair",
          icon = "book",
          label = "Repair Item to 80% - (Slot 1)"
        }
      },
      {
        distance = { radius = 1.0 },
        isEnabled = function ()
          return IsEmployedAt('ottos_pastels') and HasPermission("ottos_pastels", "craft_access")
        end
      }
    )
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "pastels_shop_repair_table",
        {
          {
            event = "rd-business:examineItem",
            id = "pastels_shop_examine",
            icon = "book",
            label = "Examine Repair Costs - (Slot 1)"
          }
        },
      {
        distance = { radius = 1.0 },
        isEnabled = function ()
          return IsEmployedAt('ottos_pastels') and HasPermission("ottos_pastels", "craft_access")
        end
      }
    )

end)
