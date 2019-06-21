FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 as runtime
WORKDIR /app
COPY /. ./
ENTRYPOINT ["dotnet", "webshell.dll"]

