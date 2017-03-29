bdf = batang10b.bdf batang10.bdf batang12b.bdf batang12.bdf batang14b.bdf batang14.bdf batang16b.bdf batang16.bdf batang18b.bdf batang18.bdf batang20b.bdf batang20.bdf batang24b.bdf batang24.bdf dotum10.bdf dotum12.bdf dotum14.bdf dotum16.bdf dotum18.bdf dotum20.bdf dotum24.bdf gulim10b.bdf gulim10.bdf gulim12b.bdf gulim12.bdf gulim14b.bdf gulim14b.bdf gulim16b.bdf gulim16.bdf gulim18b.bdf gulim18.bdf gulim20b.bdf gulim20.bdf gulim24b.bdf gulim24.bdf hline10.bdf hline12.bdf hline14.bdf hline16.bdf hline18.bdf hline20.bdf hline24.bdf
pcf = $(bdf:%.bdf=out/%.pcf.gz)
cache = out/fonts.dir out/fonts.scale
unicode_version = 9.0.0

all: $(pcf)

fontdir: $(pcf) $(cache)

out:
	mkdir -p out

out/%.pcf.gz: %.bdf out
	bdftopcf $< | gzip -9 > $@

out/fonts.scale: $(pcf)
	mkfontscale out

out/fonts.dir: $(pcf) out/fonts.scale
	mkfontdir out
	xset fp rehash
	fc-cache

clean:
	rm -rf out *.bak

.PHONY: all build clean
