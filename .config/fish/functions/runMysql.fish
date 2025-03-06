function runMysql
    if test -z "$argv[1]"
        set password password
    else
        set password $argv[1]
    end

    docker run -d -p 3306:3306 \
        --name mysql \
        -e MYSQL_ROOT_PASSWORD="$password" \
        mysql

    echo "MySQL container started. Username: root, Password: $password"
end
