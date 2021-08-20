#!/bin/sh
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

if [ "$1" = "uninstall" ]; then
   	rm -f /etc/dpkg/origins/sparkylinux
	rm -f /etc/sparky/info
	rm -f /etc/lsb-release
	if [ -f /etc/dpkg/origins/default ]; then
		rm -f /etc/dpkg/origins/default
	fi
	if [ -f /etc/dpkg/origins/debian ]; then
		ln -sf /etc/dpkg/origins/debian /etc/dpkg/origins/default
	fi
	if [ -f /usr/sbin/update-grub ] || [ -f /usr/sbin/update-grub2 ]; then
		update-grub
	fi
else
	cp etc/sparkylinux /etc/dpkg/origins/
	if [ ! -d /etc/sparky ]; then
		mkdir -p /etc/sparky
	fi
	cp etc/info /etc/sparky/
	cp etc/lsb-release /etc/
	if [ -f /etc/dpkg/origins/default ]; then
		rm -f /etc/dpkg/origins/default
	fi
	ln -sf /etc/dpkg/origins/sparkylinux /etc/dpkg/origins/default
	if [ -f /usr/sbin/update-grub ] || [ -f /usr/sbin/update-grub2 ]; then
		update-grub
	fi
fi
