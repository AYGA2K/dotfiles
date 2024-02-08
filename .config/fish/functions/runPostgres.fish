function runPostgres
    if test -z "$argv[1]"
        echo "Usage: run_postgres <password>"
        return 1
    end

    docker run -d -p 5432:5432 \
        --name postgres \
        -e POSTGRES_PASSWORD="$argv[1]" \
        postgres

    echo "PostgreSQL container started. Username: postgres, Password: $argv[1]"
end
