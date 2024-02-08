function runMysql
    if test -z "$argv[1]"
        echo "Usage: run_mysql <password>"
        return 1
    end

    docker run -d -p 3306:3306 \
        --name mysql \
        -e MYSQL_ROOT_PASSWORD="$argv[1]" \
        mysql

    echo "MySQL container started. Username: root, Password: $argv[1]"
end
