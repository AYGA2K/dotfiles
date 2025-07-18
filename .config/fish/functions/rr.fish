function rr
    if test -z "$argv[1]"
        echo "Usage: rr <filename.rs>"
    else
        rustc $argv[1]
        if test $status -ne 0
            echo "Compilation failed."
            return 1
        end

        set filename (basename $argv[1] .rs)
        chmod +x $filename
        ./$filename
    end
end
