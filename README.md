# openwrt-rtl8822bu-cu

LEDE的kernel模块，用于RTL8822BU/CU USB网卡设备的驱动。驱动来自[neojou](https://github.com/neojou/rtw88-usb/tree/kernel-5.4)。



首次尝试将linux驱动弄到源代码里面，没有进行测试，但是能成功编译。

下载到openwrt系统中解压，输入

```shell
opkg install  kmod-rtl88x2bu_5.4.95-1_aarch64_generic.ipk --nodeps

insmod rtw88_8822be
```



或者下载LEDE源代码之后，将文件夹放到package/kernel 目录下，运行make menuconfig，即可在Kernel module -> Wireless drivers 中找到相应的88x2bu选项，勾选编译即可。目前编译在R2S的profile下进行，没有进行过其他的编译测试。



