# Inicia o backend SEM alterar as configurações permanentes do Windows.
# Se Maven não existir, baixa uma cópia LOCAL com SHA-256 verificado.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
$raiz = (Get-Location).Path

if (-not (Get-Command java -ErrorAction SilentlyContinue) -or
    -not (Get-Command javac -ErrorAction SilentlyContinue)) {
    Write-Host 'JDK nao encontrado. Instale JDK 17 ou superior.' -ForegroundColor Red
    exit 1
}
$textoJava = (& javac -version 2>&1 | Out-String).Trim()
Write-Host ('JDK encontrado: ' + $textoJava) -ForegroundColor Green
if ($textoJava -notmatch 'javac ([0-9]+)' -or [int]$Matches[1] -lt 17) {
    Write-Host 'Use um JDK 17 ou superior e reabra o terminal.' -ForegroundColor Red
    exit 1
}

$mvn = Get-Command mvn -ErrorAction SilentlyContinue
if ($mvn) {
    Write-Host 'Maven encontrado. Preparando a Loja Escola...'
    & mvn spring-boot:run
    exit $LASTEXITCODE
}

$versao = '3.9.12'
$url = "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/$versao/apache-maven-$versao-bin.zip"
$shaEsperado = '305773a68d6ddfd413df58c82b3f8050e89778e777f3a745c8e5b8cbea4018ef'
$pastaLocal = Join-Path $raiz '.ferramentas'
$mvnLocal = Join-Path $pastaLocal "apache-maven-$versao\bin\mvn.cmd"

if (-not (Test-Path $mvnLocal)) {
    Write-Host 'Maven nao encontrado. Tentando baixar uma copia LOCAL...'
    New-Item -ItemType Directory -Path $pastaLocal -Force | Out-Null
    $arquivoZip = Join-Path $pastaLocal 'maven.zip'
    try {
        Invoke-WebRequest -Uri $url -OutFile $arquivoZip -UseBasicParsing
        $hash = (Get-FileHash -Path $arquivoZip -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($hash -ne $shaEsperado) {
            throw 'O arquivo Maven recebido falhou na verificacao SHA-256.'
        }
        Expand-Archive -Path $arquivoZip -DestinationPath $pastaLocal -Force
    } catch {
        Write-Host 'Nao foi possivel baixar ou verificar o Maven.' -ForegroundColor Red
        Write-Host 'Confira a internet e as restricoes da escola. Alternativa: instalar Maven ou usar o Plano B HTML.'
        Write-Host $_.Exception.Message
        exit 1
    } finally {
        if (Test-Path $arquivoZip) { Remove-Item $arquivoZip -Force }
    }
}

if (-not (Test-Path $mvnLocal)) {
    Write-Host 'Maven local ausente. Consulte o professor.' -ForegroundColor Red
    exit 1
}
Write-Host 'Iniciando a Loja Escola... A primeira execucao requer internet para as dependencias.'
& $mvnLocal spring-boot:run
exit $LASTEXITCODE
