if [ ! -d ${HOME}/opt/rust ]; then
    return 0
fi

export RUSTUP_HOME=${HOME}/opt/rust
export CARGO_HOME=${HOME}/opt/cargo

prepend_path "${HOME}/opt/cargo/bin"
