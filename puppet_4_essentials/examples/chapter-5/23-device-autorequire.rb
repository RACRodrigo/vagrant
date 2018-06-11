Puppet::Type.type(:cacti_device).provide(:cli, :parent => Puppet::Provider) do
  # commands ...

  # def create ... end

  # def destroy ... end

  # def exists? ... end

  # def self.instances ... end

  # def self.prefetch(resources) ... end

  autorequire :package do
    catalog.resource(:package, 'cacti')
  end
end
