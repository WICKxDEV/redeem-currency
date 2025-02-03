-- Open the UI
RegisterCommand('redeem', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'open' })
end, false)

-- Close the UI
RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Handle redemption request
RegisterNUICallback('redeem', function(data, cb)
    local amount = tonumber(data.amount)
    if amount and amount > 0 then
        TriggerServerEvent('redeem-currency:redeem', amount)
        cb({ success = true })
    else
        cb({ success = false, message = 'Invalid amount.' })
    end
end)

-- Notify the player
RegisterNetEvent('redeem-currency:notify')
AddEventHandler('redeem-currency:notify', function(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end)