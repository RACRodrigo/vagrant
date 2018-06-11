include firewall
include loadbalancing

Class['firewall'] -> Class['loadbalancing']
