### 0xx are files that contain all the initialization in order for the shell to work properly

function append_path() {
    local path_to_add="$1"

    if [ -z ${PATH} ]; then
        export PATH="${path_to_add}"
        return
    fi

    PATH=$(echo $PATH | tr ':' '\n' | grep -v "^${path_to_add}$" | tr '\n' ':' | sed 's/:$//')

    export PATH="${PATH}:${path_to_add}"
}

function prepend_path() {
    local path_to_add="$1"

    if [ -z ${PATH} ]; then
        export PATH="${path_to_add}"
        return
    fi

    PATH=$(echo $PATH | tr ':' '\n' | grep -v "^${path_to_add}$" | tr '\n' ':' | sed 's/:$//')

    export PATH="${path_to_add}:${PATH}"
}
