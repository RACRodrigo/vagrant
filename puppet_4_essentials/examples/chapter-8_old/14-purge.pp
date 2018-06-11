resources { "sshkey": purge => true }

user {  'rcmd':
  ensure         => present,
  uid            => '2082',
  purge_ssh_keys => true,
}
