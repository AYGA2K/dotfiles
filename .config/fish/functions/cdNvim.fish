function cdNvim
    if test -z $argv
        echo "Usage: cdNvim <directory or file>"
        return 1
    end

    set target_path (dirname $argv[1])

    if test -e $argv[1]
        if test -d $argv[1]
            cd $argv[1]
        else
            cd $target_path
        end
    else
        nvim $argv[1]
        return 0
    end

    nvim .
end
