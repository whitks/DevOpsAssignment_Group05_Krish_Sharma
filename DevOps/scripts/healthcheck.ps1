# healthcheck.ps1 - verify an HTTP service responds (PowerShell equivalent of healthcheck.sh).
#
# Usage:
#   .\healthcheck.ps1 -Url http://localhost:3000/health -ExpectedCode 200 -TimeoutSeconds 10

param(
    [string]$Url = "http://localhost:3000/health",
    [int]$ExpectedCode = 200,
    [int]$TimeoutSeconds = 10
)

Write-Host "[healthcheck] Checking $Url (expect HTTP $ExpectedCode, timeout ${TimeoutSeconds}s)" -ForegroundColor Cyan

$code = 0
try {
    $resp = Invoke-WebRequest -Uri $Url -TimeoutSec $TimeoutSeconds -UseBasicParsing
    $code = [int]$resp.StatusCode
}
catch {
    if ($_.Exception.Response) {
        $code = [int]$_.Exception.Response.StatusCode
    }
}

if ($code -eq $ExpectedCode) {
    Write-Host "[healthcheck] OK - got HTTP $code" -ForegroundColor Green
    exit 0
}
else {
    Write-Host "[healthcheck] FAIL - got HTTP $code, expected $ExpectedCode" -ForegroundColor Red
    exit 1
}