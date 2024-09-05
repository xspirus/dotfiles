randpwd() {
  tr -cd '[:alnum:]' < /dev/urandom | fold -w${1:-32} | head -n1
}
