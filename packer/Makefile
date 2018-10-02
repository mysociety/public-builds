#
# Public Builds Packer Makefile
#

.PHONEY: clean clobber fixmystreet-ami fixmystreet-vagrant-stretch

clean:
	@echo "Removing all box files."
	rm -f ./boxes/*.box

clobber: clean
	@echo "Removing ISO images."
	rm -f ./iso/*.iso
	echo "Removing packer_cache directory."
	rm -fr ./packer_cache

fixmystreet-ami:
	@echo "Building FixMyStreet AMI..."
	packer build -var-file vars/fixmystreet.json builders/amazon.json

fixmystreet-ami-slim:
	@echo "Building App-only FixMyStreet AMI..."
	packer build -var-file vars/fixmystreet.json -var 'install_args=--docker' -var 'install_type=slim' builders/amazon.json

fixmystreet-vagrant-stretch:
	@echo "Building FixMyStreet Vagrant box..."
	packer build -var-file=vars/stretch.json -var-file=vars/fixmystreet.json builders/vagrant_debian.json
