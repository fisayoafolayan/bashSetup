# ------------------------------------------------------------
# Loop through a shell command
# ------------------------------------------------------------
 
function loopy {
    if [[ -z $1 || -z $2 ]]; then echo "Usage: loopy \"command to loop\" seconds"; exit 1; fi
    while true; do eval $1; sleep ${2}; done
}
 
 
# ------------------------------------------------------------
# Commit all the current changes with a message
# ------------------------------------------------------------
 
function commit {
  git add --all
 
  if (($# > 1)); then
    params=''
    for i in $*;
    do
        params=" $params $i"
    done
 
    git commit -m "$params"
  else
    git commit -m "$1"
  fi
}
 
 
# ------------------------------------------------------------
# Commit the current changes and push to the current branch
# ------------------------------------------------------------
 
function pushme {
  br=`git branch | grep "*"`
 
  git add --all
 
  if (($# > 1)); then
 
    params=''
    for i in $*;
    do
        params=" $params $i"
    done
 
    git commit -m "$params"
  else
    git commit -m "$1"
  fi
 
  git push origin ${br/* /}
}
 
 
# ------------------------------------------------------------
# SSH into a Docker container
# ------------------------------------------------------------
 
function dockerSshIn {
    docker exec -it $1 bash
}
 
 
# ------------------------------------------------------------
# Remove a docker images
# ------------------------------------------------------------
 
function drmip {
    docker images | grep "${1}" | awk '{print $1}' | xargs docker rmi
}
 
 
# ------------------------------------------------------------
# Quickly backup file or directory
# ------------------------------------------------------------
 
function bak() {
    if [[ -z ${1} ]]
    then
        echo "Usage: bak /path/to/file.extension </path/to/save>"
        exit 1
    fi
 
    FILENAME=$(basename ${1})
 
    [[ -z ${2} ]] && SAVEBAKPATH="${1}.bak" || SAVEBAKPATH="${2}/${FILENAME}.bak"
 
    cp -R "${1}" "${SAVEBAKPATH}"
}
 
 
# ------------------------------------------------------------
# Quickly install WordPress
# ------------------------------------------------------------
 
function wp_install {
    mkdir "$1"
    cd "$1"
    wget "http://wordpress.org/latest.zip"
    unzip latest.zip
    rm -rf __MACOSX latest.zip
    cp -rf ./wordpress/* ./
    rm -rf ./wordpress/ ./wp-content/plugins/hello.php ./readme.html
    mkdir ./wp-content/uploads/
    mv wp-config-sample.php wp-config.php
    touch htaccess.txt robots.txt
    nano wp-config.php
    open https://api.wordpress.org/secret-key/1.1/salt/
}
 
 
# ------------------------------------------------------------
# Create a new laravel mix project
# ------------------------------------------------------------
 
function mix() {
  if [[ ${1} == "new" ]];
  then
    if [[ ! -z ${2} ]]; then mkdir -p $2 && cd $2; fi
    if [[ ! -f "package.json" ]]; then npm init -y; fi
    npm install laravel-mix browser-sync browser-sync browser-sync-webpack-plugin --save-dev
    npm install bootstrap-sass jquery --save
    cp -r node_modules/laravel-mix/setup/webpack.mix.js ./
 
    if [[ ! -d "src" ]]; then mkdir -p src; fi
    if [[ ! -f "src/app.scss" ]]; then touch src/app.scss; fi
    if [[ ! -f "src/app.js" ]]; then touch src/app.js; fi
 
    echo ""
    echo "Installation complete. Add this to the scripts section of your package.json:"
    echo ""
    echo "\"scripts\": {"
    echo "    \"dev\": \"NODE_ENV=development webpack --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js\","
    echo "    \"watch\": \"NODE_ENV=development webpack --watch --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js\","
    echo "    \"hot\": \"NODE_ENV=development webpack-dev-server --inline --hot --config=node_modules/laravel-mix/setup/webpack.config.js\","
    echo "    \"production\": \"NODE_ENV=production webpack --progress --hide-modules --config=node_modules/laravel-mix/setup/webpack.config.js\""
    echo "}"
  fi
}
 
function mkcd() {
    mkdir $1
    cd $_
}
