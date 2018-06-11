case Facter.value(:osfamily)
when "Solaris"
  fstab = "/etc/vfstab"
else
  fstab = "/etc/fstab"
end
