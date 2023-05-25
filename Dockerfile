﻿# syntax=docker/dockerfile:1

FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env
WORKDIR /src
COPY . /src/
RUN ls /src
RUN dotnet restore Tranga-API/Tranga-API.csproj
RUN dotnet publish -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime
WORKDIR /publish
COPY --from=build-env /publish .
RUN ls /publish
EXPOSE 80
ENTRYPOINT ["dotnet", "/publish/Tranga-API.dll"]
