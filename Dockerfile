FROM microsoft/dotnet:2.2
COPY . /app
RUN dotnet restore
RUN dotnet Build
EXPOSE 5001
ENV ASPNETCORE_URLS http://*:5001
ENTRYPOINT ["dotnet","run"]