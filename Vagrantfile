
# Bento: Packer templates for building minimal Vagrant baseboxes
# The bento/ubuntu-18.04 is a small image of 500 MB, fast to download
BOX = "bento/ubuntu-18.04"
BOX_VER = "201906.18.0"
VM_NAME = "TrustNodeWRT"

$bootstrap= <<-SCRIPT
# Install dependencies
apt-get update
apt-get install -y git gcc binutils bzip2 flex python perl make  grep unzip gawk subversion libz-dev linux-headers-generic linux-libc-dev libjson-c* libc-bin build-essential git-core libncurses5-dev unzip gawk zlib1g-dev subversion mercurial mtools openjdk-8-jdk libssl-dev libelf-dev git git-core python-virtualenv gcc python-pip python-dev libjpeg-turbo8 libjpeg-turbo8-dev zlib-gst  mariadb-common  swig libxslt-dev automake autoconf libtool libffi-dev
SCRIPT

$openwrt= <<-SCRIPT
echo "download OpenWRT"
mkdir build
cd build
git clone https://github.com/InnoRoute/TrustNodeWRT.git
echo "done"
SCRIPT


Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.provider "virtualbox" do |v|
  	v.memory = 2048
  	v.cpus = 2
	end

  config.vm.define "trustnodewrt" do |trustnodewrt|

    trustnodewrt.vm.hostname = "trustnodewrt"
    trustnodewrt.vm.box = BOX
    trustnodewrt.vm.box_version = BOX_VER
    trustnodewrt.vm.box_check_update = true

    trustnodewrt.vm.post_up_message = '
VM started! Run "vagrant ssh <vmname>" to connect.'
	
	trustnodewrt.vm.provision :shell, inline: $bootstrap, privileged: true
	trustnodewrt.vm.provision :shell, inline: $openwrt, privileged: false
	end
end

