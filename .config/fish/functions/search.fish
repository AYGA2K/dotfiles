function search
    if test -z "$argv[1]"
        echo "Usage: search <name>"
    else
        sudo find / -name "$argv[1]" 2>/dev/null
    end
end
