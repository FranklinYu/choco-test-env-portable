# “linked_clone” requires 2.1.2
Vagrant.require_version '>= 2.1.2'

Vagrant.configure('2') do |config|
  config.vm.box = 'ferventcoder/win2012r2-x64-nocm'

  config.vm.provider :hyperv do |v|
    v.memory = 2048
    v.cpus = 1
    v.ip_address_timeout = 130
    v.linked_clone = true
    v.vm_integration_services = {
      guest_service_interface: true,
      heartbeat: true,
      key_value_pair_exchange: true,
      shutdown: true,
      time_synchronization: true,
      vss: true
    }
  end

  config.winrm.username = 'vagrant'
  config.winrm.password = 'vagrant'
  config.vm.guest = :windows
  config.vm.communicator = 'winrm'
  if ENV.key?('VAGRANT_DEFAULT_SWITCH')
    config.vm.network 'public_network', bridge: ENV['VAGRANT_DEFAULT_SWITCH']
  end

  config.vm.provision 'file', source: 'PowerShell.bat', destination: '$HOME/Desktop'
  config.vm.provision 'shell', path: 'provision.ps1', privileged: false

end
