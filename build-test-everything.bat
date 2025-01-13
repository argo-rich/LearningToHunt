REM Builds the solution and runs unit tests
dotnet test
cd .\LearningToHunt\ClientApp\
ng.cmd test --no-watch --no-progress --browsers=ChromeHeadless