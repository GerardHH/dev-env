#!/bin/bash

# Stolen from https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444

function fix_keychron_k2() {
	if [ -f /etc/modprobe.d/hid_apple.conf ]; then
		echo "Detected keychron fixes, skipping"
		return 0
	fi
	echo "Make Fn + F-keys work"
	# Posible values 0, 1, 2
	echo "options hid_apple fnmode=0" | sudo tee /etc/modprobe.d/hid_apple.conf
	# the "-k all" part is not always needed, but it's better to do that for all kernels anyway
	sudo update-initramfs -u -k all

	echo "Enable Bluetooth fast connect config"
	sudo sed --in-place \
		--expression="s/^#\(FastConnectable = \)\(true\|false\)/\1true/" \
		--expression="s/^#\(ReconnectAttempts=[[:digit:]]\)/\1/" \
		--expression="s/^#\(ReconnectIntervals=\([[:digit:]]\+, \|[[:digit:]]\+\)\+\)/\1/" \
		/etc/bluetooth/main.conf

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!! Reboot is adviced !!!!!"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
}
