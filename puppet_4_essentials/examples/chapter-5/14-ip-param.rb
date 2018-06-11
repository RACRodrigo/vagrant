require 'ipaddr'

Puppet::Type.newtype(:cacti_device) do
  @doc = <<-EOD
    Manages Cacti devices.
    EOD

  newparam(:ip) do
    desc "The IP address of the device."

    isrequired

    validate do |value|
      begin
        IPAddr.new(value)
      rescue ArgumentError
        fail "'#{value}' is not a valid IP address"
      end
    end

    munge do |value|
      value.downcase
    end
  end
end
