# Build all known outputs by default.
all: gv png pdf cleanup

# Convenient shorthand.
repng: clean png
repdf: clean pdf
refinal: clean final

# Only generate the final (MIR, LIR) for each function.
final: /tmp/ion.json
	./iongraph --final $<
	./genpngs

gv: /tmp/ion.json
	./iongraph $<
png: gv
	./genpngs
pdf: gv
	./genpdfs

cleanup: pdf
	rm func*-*.gv
	rm func*-*.gv.png
	rm func*-*.gv.pdf

clean:
	rm -f *.gv *.gv.png *.pdf
