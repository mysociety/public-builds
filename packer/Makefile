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

fixmystreet-ami-cobrand:
	@test -d files/cobrand || ( echo "Please make sure you've got a cobrand at files/cobrand/" && exit 1 )
	@test -f files/general.yml.cobrand || ( echo "Please make sure you've got a suitable config file at files/general.yml.cobrand" && exit 1 )
	packer build -var-file vars/fixmystreet.json -var 'install_type=full-cobrand' builders/amazon_fms_cobrand.json

fixmystreet-vagrant-stretch:
	@echo "Building FixMyStreet Vagrant box..."
	packer build -var-file=vars/stretch.json -var-file=vars/fixmystreet.json builders/vagrant_debian.json
