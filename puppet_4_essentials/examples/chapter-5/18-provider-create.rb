Puppet::Type.type(:cacti_device).provide(:cli, :parent => Puppet::Provider) do
  # commands ...

  def create
    args = []
    args << "--description=#{resource[:name]}"
    args << "--ip=#{resource[:ip]}"
    args << "--ping_method=#{resource[:ping_method]}"
    add_device(*args)
  end
end
