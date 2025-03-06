function runCpp
    if test -z "$argv[1]"
        echo "Usage: runCpp <filename.cpp>"
    else
        # Get the filename without the .cpp extension
        set name (basename $argv[1] .cpp)
        g++ -o $name $argv[1]; and ./$name
    end
end
