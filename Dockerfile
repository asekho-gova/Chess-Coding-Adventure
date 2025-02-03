# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore "Chess-Coding-Adventure/Chess-Coding-Adventure.csproj"
RUN dotnet publish "Chess-Coding-Adventure/Chess-Coding-Adventure.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/runtime:6.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Chess-Coding-Adventure.dll"]
