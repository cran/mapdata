#-*- Makefile -*-
.SUFFIXES: .G .L .N .gon .line .n

CP = cp
RM = rm

GDATA = china.G nzHires.G rivers.G worldHires.G world2Hires.G
LDATA = china.L nzHires.L rivers.L worldHires.L world2Hires.L
NDATA = china.N nzHires.N rivers.N worldHires.N world2Hires.N

all: Gmake Lmake $(LDATA) $(GDATA) $(NDATA)

.line.L:
	./Lmake 0 s b ${*}.line ${*}.linestats ../inst/mapdata/${*}.L

.gon.G:
	./Gmake b ${*}.gon ${*}.gonstats ../inst/mapdata/${*}.G ../inst/mapdata/${*}.L

.n.N:
	$(CP) ${*}.n ../inst/mapdata/${*}.N

clean:
	$(RM) Gmake Lmake ../inst/mapdata/*
