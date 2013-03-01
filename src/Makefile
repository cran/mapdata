#-*- Makefile -*-

.SUFFIXES: .G .L .N .gon .line .name

CP = cp
ECHO = echo
RM = rm -f 
PKGNAME = mapdata
MKDIR = mkdir

GDATA = china.G japan.G nzHires.G rivers.G worldHires.G world2Hires.G
LDATA = china.L japan.L nzHires.L rivers.L worldHires.L world2Hires.L
NDATA = china.N japan.N nzHires.N rivers.N worldHires.N world2Hires.N

.line.L:
	@$(MKDIR) -p ../inst/mapdata
	./Lmake 0 s b ${*}.line ${*}.linestats ../inst/mapdata/${*}.L

.gon.G:
	./Gmake b ${*}.gon ${*}.gonstats ../inst/mapdata/${*}.G ../inst/mapdata/${*}.L

.name.N:
	@$(MKDIR) -p ../inst/mapdata
	@$(CP) ${*}.name ../inst/mapdata/${*}.N

.PHONY: all gdata ldata ndata

all: gdata ndata

gdata: Gmake ldata
	$(MAKE) $(GDATA)

ldata: Lmake world2Hires.line
	$(MAKE) $(LDATA)

ndata: world2Hires.line
	$(MAKE) $(NDATA)

world2Hires.line: worldHires.line
	@$(ECHO) "Converting world to world2"
	$(AWK) -f convert.awk < worldHires.line > world2Hires.line
	@$(CP) worldHires.linestats world2Hires.linestats
	@$(CP) worldHires.gon world2Hires.gon
	@$(CP) worldHires.gonstats world2Hires.gonstats
	@$(CP) worldHires.name world2Hires.name

clean:
	$(RM) Gmake Lmake ../inst/mapdata/* world2Hires.* $(PKGNAME).s[lo] $(PKGNAME).dylib *.exe
	$(RM) -r ../inst
