docker run --name mongo \
    -e MONGO_INITDB_DATABASE=wishlistdb \
    -p 27017:27017 -d mongo
