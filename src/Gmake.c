#include <stdio.h>
#include <stdlib.h>
/*
#include <math.h>
*/
#include <float.h>
#include "map.h"

#define Seek(f,n)	fseek(f, (long)(n), 0)
#define Read(f,s,n)	fread((char *)(s), sizeof(*(s)), (int)(n), f)
#define Write(f,s,n)	fwrite((char *)(s), sizeof(*(s)), (int)(n), f)
#define Alloc(s,n,t)	s = (t *)calloc((unsigned)(n), sizeof(t))
#define Max(a,b)	((a) > (b) ? (a) : (b))
#define R2FMT		"%hd%hd"	/* format for reading two Region's */

char Usage[] = "Usage: %s a in-file in-file-statsfile out-file\n   or: %s b in-file in-file-statsfile out-file binary-line-file";
char *Me, *getword(), *Infile, *Linefile;
FILE *Lin;
Region n;
int np, maxl;

main(ac, av)
char *av[];
{

	FILE *in, *in2, *out;
	int ascii;

	Me = av[0];
	if(ac < 5)
		fatal(Usage, Me);
	ascii = *av[1] == 'a';
	if(ac != (ascii ? 5 : 6))
		fatal(Usage, Me);
	Infile = av[2];
	if((in = fopen(av[2], "rb")) == NULL)
		fatal("Cannot open %s for reading", av[2]);
	if((in2 = fopen(av[3], "rb")) == NULL)
                fatal("Cannot open %s for reading", av[3]);
	if(fscanf(in2, "%ld%ld", &np, &maxl) != 2)
		fatal("Cannot read stats data file %s", av[3]);
	n = np;	/* won't read directly */
	if((out = fopen(av[4], "wb")) == NULL)
		fatal("Cannot open %s for writing", av[4]);
	Linefile = av[5];
	if(!ascii && (Lin = fopen(av[5], "rb")) == NULL)
		fatal("Cannot open %s for reading", av[5]);
	ascii ? to_ascii(in, out) : to_binary(in, out);
	exit(0);
}

to_ascii(in, out)
FILE *in, *out;
{
	Region n, i;
	Line m, j, N = 0;
	struct region_h *rh;
	Polyline *r;
	char buf[128];
	int column, k;

	if(Read(in, &n, 1) != 1)
		fatal("Cannot read size");
	Alloc(rh, n, struct region_h);
	if(rh == NULL)
		fatal("No memory for headers");
	if(Read(in, rh, n) != n)
		fatal("Cannot read headers");
	for(i = 0; i < n; i++)
		N = Max(N, rh[i].nline);
	Alloc(r, N, Polyline);
	if(r == NULL)
		fatal("No memory for data");
	for(i = 0; i < n; i++) {
		if((m = rh[i].nline) <= 0)
			fatal("Negative line count at header %ld", (long)i);
		if(Seek(in, rh[i].offset) < 0)
			fatal("Cannot seek to record %ld", (long)i);
		if(Read(in, r, m) != m)
			fatal("Cannot read record %ld", (long)i);
		column = 0;
		for(j = 0; j < m; j++) {
			sprintf(buf, " %ld", (long)r[j]);
			k = strlen(buf);
			if(column + k >= 80) {
				fputc('\n', out);
				column = 0;
			}
			fprintf(out, "%s", buf);
			column += k;
		}
		fprintf(out, "\n%s\n", EOR);
	}
}

to_binary(in, out)
FILE *in, *out;
{
	Region i;
	Line m; 
	int t;
	struct region_h *rh;
	Polyline *r;

	if(Seek(out, sizeof(Region) + np*sizeof(struct region_h)) < 0)
		fatal("Cannot seek in input file");
	Alloc(rh, np, struct region_h);
	Alloc(r, maxl+1, Polyline);
	if(rh == NULL || r == NULL)
		fatal("No memory");
	for(i = 0; i < np; i++) {
		m = 0;
		while((t = getpoly(in, &r[m++])) > 0)
			;
		if(t < 0)
			fatal("Read, line=%ld word=%ld", (long)i, (long)m);
		--m;
		rh[i].offset = ftell(out);
		rh[i].nline = m;
		set_range(rh+i, r);
		if(Write(out, r, m) != m)
			fatal("Cannot write record %ld", (long)i);
	}
	if(Seek(out, 0) < 0)
		fatal("Cannot seek to beginning of output file");
	if(Write(out, &n, 1) != 1)
		fatal("Cannot write size to output file");
	if(Write(out, rh, np) != np)
		fatal("Cannot write headers to output file");
}

/*
 * Read one polyline number.  The return value should be
 * 1 if a number was read, 0 if the end-of-record indicator was
 * read and -1 if there was a read fatal.
 */
getpoly(f, r)
FILE *f;
Polyline *r;
{
	char *w;

	if((w = getword(f)) == 0)
		return(-1);
	if(strcmp(w, EOR) == 0)
		return(0);
	*r = atoi(w);
	return(1);
}

#define WORDSIZE 100

char *
getword(f)
FILE *f;
{
	static char word[WORDSIZE];
	char *s = word;
	int c;

	do
		if((c = fgetc(f)) < 0)
			return(0);
	while(isspace(c));
	do {
		if(s - word >= WORDSIZE-1)
			return(0);
		*s++ = c;
		c = fgetc(f);
	} while(c >= 0 && !isspace(c));
	*s++ = 0;
/*fprintf(stderr, "%s\n", word);
*/
	return(word);
}

set_range(rh, r)
struct region_h *rh;
Polyline r[];
{
	int n = rh->nline;
	struct line_h *lh, *get_lh();
	float xmin = FLT_MAX, ymin = FLT_MAX;
	float xmax = -FLT_MAX, ymax = -FLT_MAX;

	while(n--) {
		lh = get_lh(ABS(*r));
		xmin = MIN(xmin, lh->sw.x);
		xmax = MAX(xmax, lh->ne.x);
		ymin = MIN(ymin, lh->sw.y);
		ymax = MAX(ymax, lh->ne.y);
		r++;
	}
	rh->sw.x = xmin;
	rh->sw.y = ymin;
	rh->ne.x = xmax;
	rh->ne.y = ymax;
}

struct line_h *
get_lh(r)
Polyline r;
{
	static struct line_h lh;
	int seek;

	seek = sizeof(int) + sizeof(Polyline) + (r-1)*sizeof(struct line_h);
	if(Seek(Lin, seek) == -1)
		fatal("Cannot seek to header in %s", Linefile);
	if(Read(Lin, &lh, 1) != 1)
		fatal("Cannot read header in %s", Linefile);
	return(&lh);
}

/* VARARGS */
fatal(s, a, b)
char *s;
{
	fprintf(stderr, s, a, a, b);
	fprintf(stderr, "\n");
	exit(1);
}
