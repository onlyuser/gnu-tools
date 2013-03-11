#VERSION INFO
GMP=gmp-4.3.2
MPFR=mpfr-2.4.2
MPC=mpc-0.8.1
ELF=libelf-0.8.13
GCC=gcc-4.6.3

#SOURCE URLS
GCC_INFRA_URL=ftp://gcc.gnu.org/pub/gcc/infrastructure
ELF_URL=http://www.mr511.de/software
GCC_URL=http://ftp.gnu.org/gnu/gcc

#LOCAL PATHS
DOWNLOADS=$(CURDIR)/downloads
BUILD=$(CURDIR)/build

#INSTALL PATHS
GCC_INFRA_PREFIX=$(CURDIR)/gcc-infra-install
GCC_PREFIX=$(CURDIR)/gcc-install

#==================
# all
#==================

.default_goal : all
all : gcc

#==================
# gmp
#==================

$(DOWNLOADS)/$(GMP).tar.bz2 :
	mkdir -p $(DOWNLOADS)
	wget $(GCC_INFRA_URL)/$(GMP).tar.bz2 --directory-prefix=$(DOWNLOADS)

.phony : gmp
gmp : $(DOWNLOADS)/$(GMP).tar.bz2
	mkdir -p $(BUILD)
	tar jxvf $(DOWNLOADS)/$(GMP).tar.bz2 -C $(BUILD)
	cd $(BUILD)/$(GMP); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# mpfr
#==================

$(DOWNLOADS)/$(MPFR).tar.bz2 :
	mkdir -p $(DOWNLOADS)
	wget $(GCC_INFRA_URL)/$(MPFR).tar.bz2 --directory-prefix=$(DOWNLOADS)

.phony : mpfr
mpfr : $(DOWNLOADS)/$(MPFR).tar.bz2 gmp
	mkdir -p $(BUILD)
	tar jxvf $(DOWNLOADS)/$(MPFR).tar.bz2 -C $(BUILD)
	cd $(BUILD)/$(MPFR); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX) \
			--with-gmp=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# mpc
#==================

$(DOWNLOADS)/$(MPC).tar.gz :
	mkdir -p $(DOWNLOADS)
	wget $(GCC_INFRA_URL)/$(MPC).tar.gz --directory-prefix=$(DOWNLOADS)

.phony : mpc
mpc : $(DOWNLOADS)/$(MPC).tar.gz gmp mpfr
	mkdir -p $(BUILD)
	tar zxvf $(DOWNLOADS)/$(MPC).tar.gz -C $(BUILD)
	cd $(BUILD)/$(MPC); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX) \
			--with-gmp=$(GCC_INFRA_PREFIX) \
			--with-mpfr=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# elf
#==================

$(DOWNLOADS)/$(ELF).tar.gz :
	mkdir -p $(DOWNLOADS)
	wget $(ELF_URL)/$(ELF).tar.gz --directory-prefix=$(DOWNLOADS)

.phony : elf
elf : $(DOWNLOADS)/$(ELF).tar.gz
	mkdir -p $(BUILD)
	tar zxvf $(DOWNLOADS)/$(ELF).tar.gz -C $(BUILD)
	cd $(BUILD)/$(ELF); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# gcc
#==================

$(DOWNLOADS)/$(GCC).tar.gz :
	mkdir -p $(DOWNLOADS)
	wget $(GCC_URL)/$(GCC)/$(GCC).tar.gz --directory-prefix=$(DOWNLOADS)

.phony : gcc
gcc : $(DOWNLOADS)/$(GCC).tar.gz gmp mpfr mpc elf
	mkdir -p $(BUILD)
	tar zxvf $(DOWNLOADS)/$(GCC).tar.gz -C $(BUILD)
	cd $(BUILD)/$(GCC); \
		mkdir -p $(GCC_PREFIX); \
		./configure --disable-shared --prefix=$(GCC_PREFIX) \
			--disable-bootstrap \
			--disable-libstdcxx-pch \
			--disable-multilib \
			--enable-languages=c,c++ \
			--enable-lto \
			--enable-threads=posix \
			--with-gmp=$(GCC_INFRA_PREFIX) \
			--with-mpfr=$(GCC_INFRA_PREFIX) \
			--with-mpc=$(GCC_INFRA_PREFIX) \
			--with-libelf=$(GCC_INFRA_PREFIX) \
			--with-fpmath=sse; \
		make && make install

#==================
# clean
#==================

.PHONY : clean
clean :
	rm -rf $(BUILD)/$(GMP)
	rm -rf $(BUILD)/$(MPFR)
	rm -rf $(BUILD)/$(MPC)
	rm -rf $(BUILD)/$(ELF)
	rm -rf $(BUILD)/$(GCC)
	rm -rf $(BUILD)
	rm -rf $(GCC_INFRA_PREFIX)
	rm -rf $(GCC_PREFIX)
