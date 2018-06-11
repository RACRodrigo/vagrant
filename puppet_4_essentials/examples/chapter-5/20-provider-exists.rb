Puppet::Type.type(:cacti_device).provide(:cli, :parent => Puppet::Provider) do
  # commands ...

  # def create ... end

  # def destroy ... end

  def exists?
    self.class.instances.find do |provider|
      provider.name == resource[:name]
    end 
  end 
end
