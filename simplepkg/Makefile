include	$(TOPDIR)/rules.mk
PKG_NAME :=TNdemo
PKG_RELEASE := 1
PKG_BUILD_DIR:=	$(BUILD_DIR)/$(PKG_NAME)
include	$(INCLUDE_DIR)/package.mk

define Package/TNdemo
 SECTION:=TNdemo
 CATEGORY:=InnoRoute
 TITLE:=TNdemo
# DEPENDS:=+ftdi_opto_tool
 endef
define Build/Prepare
#mkdir ‐p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef
define Package/TNdemo/install 
	$(INSTALL_DIR) $(1)/usr/sbin
#	$(INSTALL_CONF) ./files/conffile.conf $(1)/usr/share/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/TNdemo $(1)/usr/sbin/
endef
#define Package/TNdemo/postinst
#!/bin/sh
# check if we are on real system
#if [ -z "$${IPKG_INSTROOT}" ]; then
#	echo "Enabling rc.d symlink"
#	/etc/init.d/initscript enable
#fi
#exit 0
#endef

#define Package/TNdemo/prerm
#!/bin/sh
# check if we are on real system
#if [ -z "$${IPKG_INSTROOT}" ]; then
#	echo "Removing rc.d symlink"
#	/etc/init.d/iniscript disable
#fi
#exit 0
#endef
$(eval $(call BuildPackage,TNdemo)) 
#for more information see: https://wiki.openwrt.org/doc/devel/packages


	
  
	
  


  

  
	
  

 	


