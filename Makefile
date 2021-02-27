include $(TOPDIR)/rules.mk

PKG_NAME:=rtl88x2bu
PKG_RELEASE=1
PKG_BUILD_PARALLEL:=1
#PKG_EXTMOD_SUBDIRS:=rtl8812bu

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/rtl88x2bu
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for Realtek 88X2 BU/CU devices
  DEPENDS:=+kmod-cfg80211 +kmod-usb-core +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT +kmod-mac80211
  FILES:=\
        $(PKG_BUILD_DIR)/rtw88.ko \
        $(PKG_BUILD_DIR)/rtwusb.ko
  AUTOLOAD:=$(call AutoProbe,rtw88) \
	    $(call AutoProbe,rtwusb)
  PROVIDES:=kmod-rtl8822bu
endef

NOSTDINC_FLAGS = \
        -I$(PKG_BUILD_DIR) \
        -I$(PKG_BUILD_DIR)/include \
        -I$(STAGING_DIR)/usr/include/mac80211-backport \
        -I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
        -I$(STAGING_DIR)/usr/include/mac80211 \
        -I$(STAGING_DIR)/usr/include/mac80211/uapi \
        -include backport/backport.h

NOSTDINC_FLAGS+=-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT -DBUILD_OPENWRT

define Build/Compile
        +$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
                $(KERNEL_MAKE_FLAGS) \
                M="$(PKG_BUILD_DIR)" \
                NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
                modules
endef

define KernelPackage/rtl88x2bu/install
       +mkdir -p $(1)/lib/firmware/rtw88 && $(CP) $(PKG_BUILD_DIR)/fw/* $(1)/lib/firmware/rtw88/

       
endef

$(eval $(call KernelPackage,rtl88x2bu))

