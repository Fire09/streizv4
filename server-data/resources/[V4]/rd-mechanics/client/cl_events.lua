AddEventHandler('rd-mechanics:setWorkHours', function(pParameters, pEntity, pContext)
    local biz = pContext.zones['mechanic_sign_on'].biz

    local times = {}
    for i=0,24 do
        local label = ''
        if i < 10 then
            label = '0' .. i .. ':00'
        else
            label = i .. ':00'
        end

        times[#times+1] = {
            id = i,
            name = label,
        }
    end

    local prompt = exports['rd-ui']:OpenInputMenu({
        {
            label = 'Opening Time',
            name = 'open',
            icon = 'clock',
            _type = 'select',
            options = times,
        },
        {
            label = 'Closing Time',
            name = 'close',
            icon = 'clock',
            _type = 'select',
            options = times,
        },
    }, function(values)
        return values.open and values.close and values.open < values.close
    end)

    if not prompt then
        return
    end

    STR.execute('rd-mechanics:setWorkHours', biz, prompt.open, prompt.close)
end)

AddEventHandler('rd-mechanics:viewWorkHours', function(pParameters, pEntity, pContext)
    local biz = pContext.zones['mechanic_sign_on'].biz
    local context = STR.execute('rd-mechanics:getWorkHours', biz)
    exports['rd-ui']:showContextMenu(context)
end)
