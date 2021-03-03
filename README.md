# openwrt-rtl88x2bu-cu

LEDE的kernel模块，用于RTL8822BU/CU USB网卡设备的驱动。驱动来自[neojou](https://github.com/neojou/rtw88-usb/tree/kernel-5.4)。

**目前的问题：不支持AP（多半是废了233）**

使用的驱动源代码不支持ap，只支持客户端模式和监听模式（可能可以用于无线渗透？）。正在寻求新的源代码以解决问题。

发现[immortalwrt](https://github.com/immortalwrt/immortalwrt/tree/openwrt-21.02/package)的openwrt20源代码中已经包含了这个驱动，并且似乎支持AP功能，且能在LEDE中正常编译。目前在[这里](https://github.com/dhdgves/openwrtdriver_immortalwrt)做了整理，以方便日后使用。

下载LEDE源代码之后，将文件夹放到package/kernel 目录下，运行make menuconfig，即可在Kernel module -> Wireless drivers 中找到相应的88x2bu选项，勾选编译即可。目前编译在R2S的profile下进行，没有进行过其他的编译测试。

~~编译完成，刷入之后，要把src/fw中的所有文件复制到/lib/firmware/rtw88。~~

现在尝试把复制firmware的操作加入到Makefile，不再需要手动复制了。

刷新luci界面，即可看到无线选项。



