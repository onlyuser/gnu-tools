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
GCC_INFRA_PREFIX=/tmp/gcc_infra
GCC_PREFIX=/tmp/gcc

#==================
# all
#==================

.default_goal : all
all : gcc

#==================
# gmp
#==================

$(GMP).tar.bz2 :
	wget $(GCC_INFRA_URL)/$(GMP).tar.bz2

.phony : gmp
gmp : $(GMP).tar.bz2
	bunzip2 -k $(GMP).tar.bz2
	tar xvf $(GMP).tar
	rm $(GMP).tar
	cd $(GMP); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# mpfr
#==================

$(MPFR).tar.bz2 :
	wget $(GCC_INFRA_URL)/$(MPFR).tar.bz2

.phony : mpfr
mpfr : $(MPFR).tar.bz2 gmp
	bunzip2 -k $(MPFR).tar.bz2
	tar xvf $(MPFR).tar
	rm $(MPFR).tar
	cd $(MPFR); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX) \
			--with-gmp=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# mpc
#==================

$(MPC).tar.gz :
	wget $(GCC_INFRA_URL)/$(MPC).tar.gz

.phony : mpc
mpc : $(MPC).tar.gz gmp mpfr
	tar zxvf $(MPC).tar.gz
	cd $(MPC); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX) \
			--with-gmp=$(GCC_INFRA_PREFIX) \
			--with-mpfr=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# elf
#==================

$(ELF).tar.gz :
	wget $(ELF_URL)/$(ELF).tar.gz

.phony : elf
elf : $(ELF).tar.gz
	tar zxvf $(ELF).tar.gz
	cd $(ELF); \
		mkdir -p $(GCC_INFRA_PREFIX); \
		./configure --disable-shared --enable-static --prefix=$(GCC_INFRA_PREFIX); \
		make && make check && make install

#==================
# gcc
#==================

$(GCC).tar.gz :
	wget $(GCC_URL)/$(GCC)/$(GCC).tar.gz

.phony : gcc
gcc : $(GCC).tar.gz gmp mpfr mpc elf
	tar zxvf $(GCC).tar.gz
	cd $(GCC); \
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
	rm -rf $(GMP)
	rm -rf $(MPFR)
	rm -rf $(MPC)
	rm -rf $(ELF)
	rm -rf $(GCC)
	rm -rf $(GCC_INFRA_PREFIX)
	rm -rf $(GCC_PREFIX)
