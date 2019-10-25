FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y wget sudo software-properties-common

RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    add-apt-repository universe && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y aspnetcore-runtime-2.2

WORKDIR /app
COPY /app .
ENTRYPOINT ["dotnet", "CloudRiches.Azure.Monitor.CustomMetrics.Nvidia.dll"]
