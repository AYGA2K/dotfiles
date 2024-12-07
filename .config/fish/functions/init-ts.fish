function init-ts
    if test (count $argv) -ne 1
        echo "Usage: init-ts <project-name>"
        return 1
    end

    set project_name $argv[1]

    mkdir $project_name
    cd $project_name

    echo "Initializing npm..."
    npm init -y

    echo "Installing TypeScript and ts-node..."
    npm install typescript ts-node --save-dev

    # Update package.json with run and build scripts
    echo "Adding scripts to package.json..."
    jq '.scripts += {
        "start": "ts-node src/main.ts",
        "build": "tsc"
    }' package.json >package.temp.json && mv package.temp.json package.json

    # Create tsconfig.json
    echo "Creating tsconfig.json..."
    echo '{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "outDir": "dist",
    "strict": true,
    "esModuleInterop": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}' >tsconfig.json

    # Create src directory with main.ts
    mkdir src
    echo "Creating src/main.ts..."
    echo 'function main(): void {
  console.log("Hello, TypeScript!");
}

main();' >src/main.ts

    # Initialize Git repository
    echo "Initializing Git repository..."
    git init

    # Create .gitignore
    echo "Creating .gitignore..."
    echo 'node_modules/
dist/
*.log
.env
.DS_Store
' >.gitignore

    # Perform initial Git commit
    git add .
    git commit -m "Initial commit: Setup TypeScript project"

    echo "TypeScript project '$project_name' initialized successfully."
    echo "Run 'npm start' to execute the main function or 'npm run build' to compile the project."
    echo "Git repository initialized with a .gitignore file."
end
