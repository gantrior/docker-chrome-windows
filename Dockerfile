FROM mcr.microsoft.com/windows/servercore:ltsc2019

MAINTAINER Tomas Panik

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# install chocolatey
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# install chrome
# Fonts are needed for Chrome to work properly, ltsc2019 and higher do not have fonts built-in
ADD Files/FontsToAdd.tar /Fonts/
WORKDIR /Fonts/
RUN .\Add-Font.ps1 Fonts
WORKDIR /

RUN choco install googlechrome -y

COPY Start.ps1 /scripts/start.ps1

CMD c:\scripts\start.ps1
