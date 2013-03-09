#VERSION INFO
BISON=bison-2.5

#SOURCE URLS
BISON_URL=http://ftp.gnu.org/gnu/bison/

#LOCAL PATHS
BISON_PREFIX=/tmp/bison

#==================
# all
#==================

.default_goal : all
all : bison

#==================
# bison
#==================

$(BISON).tar.gz :
	wget $(BISON_URL)/$(BISON).tar.gz

.phony : bison
bison : $(BISON).tar.gz
	tar zxvf $(BISON).tar.gz
	cd $(BISON); \
		mkdir -p $(BISON_PREFIX); \
		./configure --prefix=$(BISON_PREFIX); \
		make && make install

#==================
# clean
#==================

.PHONY : clean
clean :
	rm -rf $(BISON)
	rm -rf $(BISON_PREFIX)
