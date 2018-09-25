FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY DXWebApplication2.sln ./
RUN dotnet restore -nowarn:msb3202,nu1503
COPY . .
WORKDIR "/src/Reporting Angular Application Document Viewer"
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ReportingAngularApplicationDocumentViewer.dll"]
