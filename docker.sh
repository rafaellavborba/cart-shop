#docker build -t cart:0.0.1 .
docker run --name cart --rm -it -d -p 8080:8080 cart:0.0.1