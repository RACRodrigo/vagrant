Puppet::Type.type(:cacti_device).provide(:cli, :parent => Puppet::Provider) do
  # commands ...

  # def create ... end

  # def destroy ... end

  # def exists? ... end

  # def self.instances ... end

  def self.prefetch(resources)
    instances.each do |provider|
      if res = resources[provider.name]
        res.provider = provider
      end
    end
  end
end
