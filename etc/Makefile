.PHONY: all-configs power-configs

all-configs: power-configs

power-configs: /etc/systemd/logind.conf

/etc/systemd/logind.conf: etc/Makefile
	# Redirecting the output directly to the file can result in the file content
	# getting clobbered. We should redirect the output to a temp file instead.
	cat $@ | \
		sed -e "s/^#\?\(HandlePowerKey\)=.*$$/\1=suspend/" | \
		sed -e "s/^#\?\(HandleLidSwitch\)=.*$$/\1=ignore/" | \
		tee /tmp/${@F}
	sudo mv /tmp/${@F} $@

