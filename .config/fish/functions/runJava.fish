function runJava
    if test -z "$argv[1]"
        echo "Usage: runJava <filename>"
    else
        javac $argv[1].java; and java $argv[1]
    end
end
