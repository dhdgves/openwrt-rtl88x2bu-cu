# openwrt-rtl88x2bu-cu

LEDE的kernel模块，用于RTL8822BU/CU USB网卡设备的驱动。驱动来自[neojou](https://github.com/neojou/rtw88-usb/tree/kernel-5.4)。

**目前的问题：不支持AP（多半是废了233）**

使用的驱动源代码不支持ap，只支持客户端模式和监听模式（可能可以用于无线渗透？）。正在寻求新的源代码以解决问题。

下载LEDE源代码之后，将文件夹放到package/kernel 目录下，运行make menuconfig，即可在Kernel module -> Wireless drivers 中找到相应的88x2bu选项，勾选编译即可。目前编译在R2S的profile下进行，没有进行过其他的编译测试。

编译完成，刷入之后，要把src/fw中的所有文件复制到/lib/firmware/rtw88。

```shell
$ sudo mkdir -p /lib/firmware/rtw88
$ sudo cp fw/rtw8822* /lib/firmware/rtw88/
$ sudo insmod rtw88.ko
$ sudo insmod rtwusb.ko
```

刷新luci界面，即可看到无线选项。



