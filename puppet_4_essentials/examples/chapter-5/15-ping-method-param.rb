Puppet::Type.newtype(:cacti_device) do
  @doc = <<-EOD
    Manages Cacti devices.
    EOD

  # newparam(:ip) do ... end

  newparam(:ping_method) do
    desc "How the device's reachability is determined.
      One of `tcp` (default), `udp` or `icmp`."

    validate do |value|
      [ :tcp, :udp, :icmp ].include?(value.to_sym)
    end

    munge do |value|
      value.to_sym
    end

    defaultto :tcp
  end
end
