if [ ! -d ${HOME}/opt/poetry ]; then
    return 0
fi

export POETRY_HOME=${HOME}/opt/poetry

prepend_path "${HOME}/opt/poetry/bin"

poetry config virtualenvs.create false
poetry config system-git-client false
