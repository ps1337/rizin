OBJ_XNU_KERNELCACHE=bin_xnu_kernelcache.o
OBJ_XNU_KERNELCACHE+=../format/xnu/rz_cf_dict.o

LINK+=$(STOP)/yxml/libyxml.a
CFLAGS+=-I$(STOP)/yxml/

STATIC_OBJ+=${OBJ_XNU_KERNELCACHE}
TARGET_XNU_KERNELCACHE=bin_xnu_kernelcache.${EXT_SO}

ifeq ($(WITHPIC),1)
ALL_TARGETS+=${TARGET_XNU_KERNELCACHE}

${TARGET_XNU_KERNELCACHE}: ${OBJ_XNU_KERNELCACHE}
	-${CC} $(call libname,bin_xnu_kernelcache) -shared ${CFLAGS} \
	-o ${TARGET_XNU_KERNELCACHE} ${OBJ_XNU_KERNELCACHE} $(LINK) $(LDFLAGS) \
	${LDFLAGS_LINKPATH}../../syscall -L../../util -lrz_syscall
endif