TARGET=sample.png
#TARGET=colorbar.png

.PRECIOUS : %.ppm
.PHONY : all clean view

all : $(TARGET)

clean :
	rm -f *.ppm *.png

view : $(TARGET)
	eog $<

%.png : %.ppm
	convert -sample %3600 $< $@

%.ppm : %.tree
	./tree2ppm.sh $< $@
