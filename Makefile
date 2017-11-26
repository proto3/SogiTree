TARGET=results/sample.png results/seed.mp4
#TARGET=colorbar.png

BIN=scripts
DATA=datas
RST=results

SOGITREE=./SogiTree
TREE2PPM=$(BIN)/tree2ppm.sh

.PRECIOUS : %.ppm
.PHONY : all clean view

all : $(TARGET)

clean :
	rm -rf $(RST)/*

$(RST)/%.png : $(RST)/%.ppm
	convert -sample %800 $< $@

$(RST)/%.ppm : datas/%.tree
	$(BIN)/tree2ppm.sh $< $@

$(RST)/%.mp4 : datas/%.tree
	DIR=$$(echo $@ | sed -e 's/.mp4//') ;\
	mkdir -p $$DIR ;\
	TREE_IN=$$DIR/1.tree ;\
	cp $< $$TREE_IN ;\
	for I in $$(seq 1 30) ; \
	do \
		TREE_OUT=$$DIR/$$(($$I+1)).tree ;\
		$(SOGITREE) < $$TREE_IN > $$TREE_OUT ;\
		$(TREE2PPM) $$TREE_IN $$TREE_IN.ppm ;\
		convert -sample %800 $$TREE_IN.ppm $$TREE_IN.png ;\
		TREE_IN=$$TREE_OUT ;\
	done ;\
	ffmpeg -r 10 -i $$DIR/%d.tree.png -r 10 $@

