#/bin/bash

cp -f /mnt/hue.ini /etc/hue/conf/hue.ini
cp -f /mnt/hive-site.xml /etc/hive/conf/hive-site.xml
cp -rf /mnt/usr /
cp -f /usr/lib/hue/desktop/libs/notebook/src/notebook/static/notebook/js/notebook.ko.js /usr/lib/hue/build/static/notebook/js/notebook.ko.*.js
cp -f /usr/lib/hue/apps/beeswax/src/beeswax/static/beeswax/js/beeswax.vm.js /usr/lib/hue/build/static/beeswax/js/beeswax.vm.*.js

service hue restart
sleep 10

while true; do
	if ps aux | grep hue | grep runcherrypyserver > /dev/null; then
		sleep 30
	else
		exit 1
	fi
done
