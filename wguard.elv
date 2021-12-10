fn keys:generate {
  # umask
  wg genkey | tee privatekey | wg pubkey > publickey
}