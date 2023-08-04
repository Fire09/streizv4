local registered = {}

function RegisterUICallback(name, cb)
  local function interceptCb(data, innerCb)
    cb(data, function(result)
      if result.meta.ok then
        result.meta.message = "done"
      end
      innerCb(result)
    end)
  end
  AddEventHandler(('_stx_uiReq:%s'):format(name), interceptCb)

  if (GetResourceState("rd-ui") == "started") then 
    exports["rd-ui"]:RegisterUIEvent(name) 
  end

  registered[#registered + 1] = name
end

function SendUIMessage(data)
  exports["rd-ui"]:SendUIMessage(data)
end

function SetUIFocus(hasFocus, hasCursor)
  exports["rd-ui"]:SetUIFocus(hasFocus, hasCursor)
end

function GetUIFocus()
  return exports["rd-ui"]:GetUIFocus()
end

AddEventHandler("_stx_uiReady", function()
  for _, eventName in ipairs(registered) do
    exports["rd-ui"]:RegisterUIEvent(eventName)
  end
end)