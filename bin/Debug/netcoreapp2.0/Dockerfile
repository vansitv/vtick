FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM base AS final
WORKDIR /app
COPY . /app

RUN apt-get -qq update && apt-get install build-essential -y && apt-get install -my wget gnupg && apt-get -qq -y install bzip2 
RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash - 
RUN node -v

ENTRYPOINT ["dotnet", "ReportingAngularApplicationDocumentViewer.dll"]