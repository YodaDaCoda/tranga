{ pkgs, ... }:

{
  packages = [
    pkgs.dotnet-sdk_8
    pkgs.git
  ];

  env = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };

  scripts.restore = {
    description = "Restore NuGet packages for the .NET project";
    exec = "dotnet restore Tranga/Tranga.csproj";
  };
  scripts.build = {
    description = "Build the .NET project";
    exec = "dotnet build Tranga/Tranga.csproj";
  };
  scripts.run = {
    description = "Run the .NET project";
    exec = "dotnet run --project Tranga/Tranga.csproj";
  };
  scripts.clean = {
    description = "Clean the .NET project";
    exec = "dotnet clean Tranga/Tranga.csproj";
  };
}
