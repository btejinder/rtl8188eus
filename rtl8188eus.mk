################################################################################
#
# rtl8188eu
#
################################################################################

RTL8188EUS_VERSION = 30c129990fb7432c8a96571ca9625e6f2911b99f
RTL8188EUS_SITE = $(call github,quickreflex,rtl8188eus,$(RTL8188EUS_VERSION))
#RTL8188EUS_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
#RTL8188EUS_LICENSE_FILES = COPYING
#RTL8188EUS_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m

#define RTL8188EU_INSTALL_FIRMWARE
#	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
#endef
#RTL8188EU_POST_INSTALL_TARGET_HOOKS += RTL8188EU_INSTALL_FIRMWARE
RTL8188EUS_MODULE_MAKE_OPTS = \
        CONFIG_RTL8188EU=m \
        KVER=$(LINUX_VERSION_PROBED) \
        KSRC=$(LINUX_DIR)


$(eval $(kernel-module))
$(eval $(generic-package))
