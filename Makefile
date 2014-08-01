# contrib/dict_voikko/Makefile

MODULE_big = dict_voikko
OBJS = dict_voikko.o

EXTENSION = dict_voikko
DATA = dict_voikko--1.0.sql dict_voikko--unpackaged--1.0.sql

REGRESS = dict_voikko

LDFLAGS_SL+=-lvoikko

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/dict_voikko
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
