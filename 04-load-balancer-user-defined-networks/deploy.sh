docker network create mybridge

docker run -d --rm --net=mybridge -e INSTANCE=myapp1 --name myapp1 myapp
docker run -d --rm --net=mybridge -e INSTANCE=myapp2 --name myapp2 myapp
docker run -d --rm --net=mybridge -e INSTANCE=myapp3 --name myapp3 myapp

docker run -d --rm --net=mybridge -p 80:80 --name mylb myloadbalancer 
