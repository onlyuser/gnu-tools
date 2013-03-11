#VERSION INFO
BISON=bison-2.5

#SOURCE URLS
BISON_URL=http://ftp.gnu.org/gnu/bison/

#LOCAL PATHS
DOWNLOADS=$(CURDIR)/downloads
BUILD=$(CURDIR)/build

#INSTALL PATHS
BISON_PREFIX=$(CURDIR)/bison-install

#==================
# all
#==================

.default_goal : all
all : bison

#==================
# bison
#==================

$(DOWNLOADS)/$(BISON).tar.gz :
	mkdir -p $(DOWNLOADS)
	wget $(BISON_URL)/$(BISON).tar.gz --directory-prefix=$(DOWNLOADS)

.phony : bison
bison : $(DOWNLOADS)/$(BISON).tar.gz
	mkdir -p $(BUILD)
	tar zxvf $(DOWNLOADS)/$(BISON).tar.gz -C $(BUILD)
	cd $(BUILD)/$(BISON); \
		mkdir -p $(BISON_PREFIX); \
		./configure --prefix=$(BISON_PREFIX); \
		make && make install

#==================
# clean
#==================

.PHONY : clean
clean :
	rm -rf $(BUILD)/$(BISON)
	rm -rf $(BUILD)
	rm -rf $(BISON_PREFIX)
