#-*- Makefile -*-
.SUFFIXES: .G .L .N .gon .line .n

CP = cp
RM = rm
AWK = awk
ECHO = echo

GDATA = china.G nzHires.G rivers.G worldHires.G world2Hires.G
LDATA = china.L nzHires.L rivers.L worldHires.L world2Hires.L

all: Gmake Lmake $(LDATA) $(GDATA)

.line.L:
	./Lmake 0 s b ${*}.line ${*}.linestats ../inst/mapdata/${*}.L

.gon.G:
	./Gmake b ${*}.gon ${*}.gonstats ../inst/mapdata/${*}.G ../inst/mapdata/${*}.L
	$(CP) ${*}.n ../inst/mapdata/${*}.N	# needed here for Mac

world2Hires.line: worldHires.line
	@$(ECHO) "Converting world to world2"
	$(AWK) -f convert.awk < worldHires.line > world2Hires.line
	$(CP) worldHires.linestats world2Hires.linestats

world2Hires.gon: worldHires.gon
	$(CP) worldHires.gon world2Hires.gon
	$(CP) worldHires.gonstats world2Hires.gonstats
	$(CP) worldHires.n world2Hires.n

clean:
	$(RM) -f Gmake Lmake ../inst/mapdata/* world2Hires.*
