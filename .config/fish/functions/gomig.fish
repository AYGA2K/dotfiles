# function to init a go project with my github username
# AYGA2K

function gomig
    # Check if an argument is passed, otherwise use current directory name
    if test (count $argv) -lt 1
        set project_name (basename $PWD)
    else
        set project_name $argv[1]
    end

    set github_username AYGA2K
    set project_path "github.com/$github_username/$project_name"

    go mod init $project_path
end
