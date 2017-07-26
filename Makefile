all : sample.png

clean :
	rm -f sample.ppm sample.png

%.png : %.ppm
	convert -sample %3600 $< $@

%.ppm : %.tree
	./tree2ppm.sh $< $@
