$servers = 'config-server', 'game-server', 'gateway-server', 'hotpatch-server', 'login-server'

Set-Location -Path servers

foreach ($server in $servers) {
    $processOptions = @{
        FilePath               = ".\$server"
        NoNewWindow            = $true
        RedirectStandardOutput = "$server.log"
    }

    Start-Process @processOptions
}

$gameLocation = 'D:\wuwa-dev\Wuthering Waves Game'
$gameOptions = @{
    FilePath     = "$gameLocation\Client\Binaries\Win64\Client-Win64-Shipping.exe"
    ArgumentList = '-dx12'
    Verb         = 'RunAs'
    Wait         = $true
}

Start-Process @gameOptions
