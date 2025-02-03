local exchangeRate = 100 -- $1 = 100 in-game coins

-- Function to send data to Discord
function sendToDiscord(playerName, amount)
    local discordWebhook = 'YOUR_DISCORD_WEBHOOK_URL' -- Replace with your Discord webhook URL
    local message = string.format('Player **%s** redeemed **%d** in-game coins.', playerName, amount)

    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({
        content = message
    }), { ['Content-Type'] = 'application/json' })
end

-- Handle redemption request
RegisterServerEvent('redeem-currency:redeem')
AddEventHandler('redeem-currency:redeem', function(amount)
    local playerId = source
    local playerName = GetPlayerName(playerId)
    local playerMoney = exports['es_extended']:getAccount(playerId, 'money').money -- Adjust for your framework

    -- Check if the player has enough money
    if playerMoney >= amount then
        -- Deduct money
        exports['es_extended']:removeAccountMoney(playerId, 'money', amount) -- Adjust for your framework

        -- Calculate redeemed coins
        local redeemedCoins = amount * exchangeRate

        -- Add coins to the player (adjust for your framework)
        exports['es_extended']:addInventoryItem(playerId, 'coins', redeemedCoins) -- Adjust for your framework

        -- Send data to Discord
        sendToDiscord(playerName, amount)

        -- Notify the player
        TriggerClientEvent('redeem-currency:notify', playerId, 'Redemption successful! Please contact transaction staff on Discord.')
    else
        TriggerClientEvent('redeem-currency:notify', playerId, 'You do not have enough money to redeem this amount.')
    end
end)