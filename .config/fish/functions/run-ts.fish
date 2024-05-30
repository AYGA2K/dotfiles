function rts
    if test -z $argv
        echo "Usage: rts <typescript_file>"
        return 1
    end

    set ts_file $argv[1]

    tsc $ts_file && node (string replace ".ts" ".js" $ts_file)
end
