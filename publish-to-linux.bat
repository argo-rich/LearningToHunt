REM Run the dotnet publish command and create publish.tar.bz2
cd LearningToHunt
dotnet clean
rmdir publish -Recurse
dotnet publish -o publish --os linux
cd publish
tar cjvf ..\publish.tar.bz2 .

REM scp publish.tar.bz2 to the server
cd ..
scp -i "%L2H_KEY%" .\publish.tar.bz2 %L2H_USER%@%L2H_SERVER%:~/learning-to-hunt
del .\publish.tar.bz2

REM run the deploy script on the server
ssh -i "%L2H_KEY%" %L2H_USER%@%L2H_SERVER% "source /home/%L2H_USER%/.bash_profile && /home/%L2H_USER%/scripts/deploy-publish-file.sh"
