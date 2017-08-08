echo "Docker stop"
docker stop railstest

echo "Remove old images"
docker rm railstest
docker rmi dmitry4luhanin/railstest

echo "pulling latest version of the code"
docker pull dmitry4luhanin/railstest:latest

echo "starting the new version"
docker run --name railstest -d -p 80:3000 dmitry4luhanin/railstest:latest

echo "success!"

exit 0
