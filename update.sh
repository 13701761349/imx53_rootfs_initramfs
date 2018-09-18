#!/bin/sh
#update call it in /etc/init.d/rcS
mkdir /dirrootfs
mkdir /dirimage

#formate
mkfs.ext2 /dev/mmcblk0p1

#mount inand 
cmd="mount /dev/mmcblk0p1	/dirrootfs"
echo "mount /dev/mmcblk0p1	/dirrootfs"
mount /dev/mmcblk0p1	/dirrootfs

#mount sd
echo "mount /dev/mmcblk1p1	/dirimage"
mount /dev/mmcblk1p1	/dirimage

#copy
#tar xvzf /dirimage/image/rootfs.tar.gz	-C /dirrootfs
tar xvjf /dirimage/image/rootfs.tar.bz2	-C /dirrootfs




i=1
while ((i=1))

do 

	ROOTFS=$(find /dirimage/image/rootfs.tar.bz2)
	echo $ROOTFS
	if [ "$ROOTFS" != "/dirimage/image/rootfs.tar.bz2" ];then
		echo "not find the file"
		echo "will reboot"
		reboot
	else
		echo "update success,pls unplug the sd card!"
	fi
	sleep 1
done


