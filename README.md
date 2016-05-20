# LIRC driver for BBB

## Hardware Installation

Choose an Infrared Receiver that works with 3.3V. For example a TSOP31236.

Connect its output signal directly to the BBB GPIO capable pin, e.g. P8\_07.


## Software Installation (kernel driver)

```
make prepare
make install
```

Add a following line into /etc/modules to enable module to receive IR on the pin P8\_07:
```
lirc-bbb gpio_in_pin=66
```
Reboot the BBB and verify that /dev/lirc0 file is present.


## Software Installation (LIRC)

http://www.lirc.org/html/configuration-guide.html

Or see an example in the "example\_lirc\_conf" directory.


## Credits

 - https://github.com/hani93/lirc_bbb
 - https://thenetworkcable.wordpress.com/2014/10/18/compiling-lirc_bbb-for-ir-control-on-a-beagle-bone-black/
