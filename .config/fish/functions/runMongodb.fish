function runMongodb
    if test -z "$argv[1]" -o -z "$argv[2]"
        echo "Usage: run_mongodb <username> <password>"
        return 1
    end

    docker run -d -p 27017:27017 \
        --name mongodb \
        -e MONGO_INITDB_ROOT_USERNAME="$argv[1]" \
        -e MONGO_INITDB_ROOT_PASSWORD="$argv[2]" \
        mongo

    echo "MongoDB container started. Root username: $argv[1], password: $argv[2]"
end
