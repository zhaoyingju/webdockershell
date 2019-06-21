FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 as runtime
WORKDIR /app
COPY /. ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "webshell.dll"]

