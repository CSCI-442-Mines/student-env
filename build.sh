# Downloads the Quartz tooling from GitHub, copies the configurations,
# and installs through npm
install_tooling () {
    git clone https://github.com/jackyzha0/quartz.git
    cp quartz.config.ts quartz/quartz.config.ts
    cd quartz
    npm i
    cd ../
}

# Removes tooling
clean_tooling () {
    rm -rf quartz
}

# Renders markdown to html, places in docs-html directory
render () {
    mkdir docs-html
    cd quartz
    npx quartz build -d ../docs/ -o ../docs-html
    cd ../
}

# Removes rendered files
clean_render () {
    rm -rf docs-html
}

publish () {
    git clone --branch website https://github.com/CSCI-442-Mines/student-env website-branch
    cp -r docs-html/* website-branch/
    cd website-branch
    git commit -a -m "Updated rendered website"
    git push
    cd ../
    rm -rf website-branch
}