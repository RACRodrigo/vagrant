Puppet::Type.type(:cacti_device).provide(:cli, :parent => Puppet::Provider) do
  # commands ...

  # def create ... end

  def destroy
    rm_device("--device-id=#{@property_hash[:id]}")
  end 
end
