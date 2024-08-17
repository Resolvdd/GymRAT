param (
    [string]$webhookUrl,
    [string]$message
)

$body = @{ content = $message } | ConvertTo-Json
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType 'application/json'
