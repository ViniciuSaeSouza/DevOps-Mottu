FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "Api.csproj"
RUN dotnet publish "Api.csproj" -c Release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
EXPOSE 8080
EXPOSE 80
ENTRYPOINT [ "dotnet", "APIMottu.dll" ]