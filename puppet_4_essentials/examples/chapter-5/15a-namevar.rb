Puppet::Type.newtype(:cacti_device) do
  @doc = <<-EOD
    Manages Cacti devices.
    EOD

  # newparam(:ip) do ... end

  # newparam(:ping_method) do ... end

  newparam(:name) do
    desc "The name of the device."
    #isnamevar # -> commented because automatically assumed
  end

end
