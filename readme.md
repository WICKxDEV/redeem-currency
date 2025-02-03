# In-Game Currency Redemption Script for FiveM

This script allows players to redeem in-game currency, deducts the redeemed amount from their balance, and sends transaction details to a Discord server. It also includes a user-friendly UI for currency redemption and displays the exchange rate.

---

## Features
- **Currency Redemption**: Players can redeem in-game currency through an easy-to-use UI.
- **Discord Integration**: Sends transaction details to a Discord server.
- **Customizable Exchange Rate**: Easily modify the in-game currency exchange rate.
- **UI Customization**: Customize the redemption UI to fit your server’s style.

---

## Setup Instructions

Follow these steps to set up the script on your FiveM server.

### 1. **Download the Script**

1. Download the script files and place them in a folder named `redeem-currency` inside your `resources` directory.

### 2. **Configure the Script**

#### Discord Webhook

1. Go to your **Discord server settings**.
2. Navigate to **Integrations > Webhooks** and create a new webhook.
3. Copy the webhook URL.
4. Open `server.lua` and replace `YOUR_DISCORD_WEBHOOK_URL` with your actual Discord webhook URL:
   ```lua
   local discordWebhook = 'YOUR_DISCORD_WEBHOOK_URL'

## Framework Adjustments
The script is designed for the es_extended framework. If you're using a different framework (e.g., QBCore, vRP), update the following lines in server.lua:

#### Replace exports['es_extended']:getAccount(playerId, 'money').money with your framework's money retrieval function.

#### Replace exports['es_extended']:removeAccountMoney(playerId, 'money', amount) with your framework's money deduction function.

#### Replace exports['es_extended']:addInventoryItem(playerId, 'coins', redeemedCoins) with your framework's inventory addition function.


#### 3. Add the Script to Your Server
Open your server.cfg file.

Add the following line to start the script:
start redeem-currency

#### 4. Restart Your Server
Restart your FiveM server to load the script.

#### 5. Test the Script
Join your server.

Use the /redeem command to open the redemption UI.

Enter the amount you want to redeem and confirm.

Check your Discord server for the transaction notification.

## Customization
Exchange Rate: To change the exchange rate, modify the exchangeRate variable in server.lua:
local exchangeRate = 100 -- $1 = 100 in-game coins
UI Styling: Customize the UI by editing the ui.html and ui.js files.

### Support
If you encounter any issues or need further assistance, feel free to reach out or open an issue on the GitHub repository.

#### Enjoy using the In-Game Currency Redemption Script! 🎮