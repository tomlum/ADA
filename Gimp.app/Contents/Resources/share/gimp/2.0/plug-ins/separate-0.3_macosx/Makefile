
PREFIX=/usr/devel

GTK_INCLUDE = `pkg-config gtk+-2.0 --cflags`
GTK_LIB = `pkg-config gtk+-2.0 --libs`
GIMP_INCLUDE = `pkg-config gimp-2.0 --cflags` `pkg-config gimpui-2.0 --cflags`
GIMP_LIB = `pkg-config gimp-2.0 --libs` `pkg-config gimpui-2.0 --libs`
LCMS_INCLUDE = `pkg-config lcms --cflags`
LCMS_LIB = `pkg-config lcms --libs`
TIFF_LIB = -ltiff

VERSION = 0.1
CC = gcc -g
DEPEND = gccmakedep
RM = rm -f

CFLAGS = $(GIMP_INCLUDE) $(GTK_INCLUDE) $(LCMS_INCLUDE) -O2 -Wall
LDFLAGS = $(GIMP_LIB) $(GTK_LIB) $(LCMS_LIB) $(TIFF_LIB)

SOURCES = \
	separate.c util.c tiff.c

OBJECTS=$(SOURCES:.c=.o)

TARGETS = separate

all:	 $(TARGETS)

depend:
	$(DEPEND) -- $(CFLAGS) -- $(SOURCES)

clean:
	$(RM) $(OBJECTS) $(TARGETS) core *~

separate: $(OBJECTS)
	$(CC) separate.o util.o tiff.o -o $@ $(LDFLAGS)

install: separate
	gimptool-2.0 --install-bin separate

uninstall:
	rm -f $(HOME)/.gimp/plug-ins/separate

# Inference rules

.c.o:
	$(CC) $(CFLAGS) -c $<

