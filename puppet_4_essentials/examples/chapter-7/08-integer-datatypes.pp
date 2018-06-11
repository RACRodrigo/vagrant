class ssh (
  Boolean $server = true,
  Enum['des', '3des', 'blowfish'] $cipher = 'des',
  Optional[Array[String]] $allowed_users = undef,
  Integer[1,1023] $sshd_port,
) {
  if $server {
    include ssh::server
  }
}
