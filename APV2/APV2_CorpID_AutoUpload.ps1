# Webhook URL
$webhook = "WEBHOOK URL GOES HERE"

# Get the computer system and BIOS information
$computerSystem = Get-WmiObject -Class Win32_ComputerSystem
$bios = Get-WmiObject -Class Win32_BIOS

# Create the JSON payload
$webhookData = @{
    manufacturer = $computerSystem.Manufacturer
    model = $computerSystem.Model
    serialNumber = $bios.SerialNumber
} | ConvertTo-Json

# Upload the device identity
Invoke-WebRequest -Method POST -Uri $webhook -Body $webhookData -UseBasicParsing