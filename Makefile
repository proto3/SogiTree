TARGET=results/sample.png
VIDEO_TARGETS=results/seed.mp4

BIN=scripts
DATA=datas
RST=results

SOGITREE=./SogiTree
TREE2PNG=./tree2png

.PRECIOUS : %.ppm
.PHONY : all clean view

all : $(TARGET)

video : $(VIDEO_TARGETS)

clean :
	rm -rf $(RST)/*

$(RST)/%.png : $(DATA)/%.tree
	$(TREE2PNG) $< $@

$(RST)/%.mp4 : datas/%.tree
	DIR=$$(echo $@ | sed -e 's/.mp4//') ;\
	mkdir -p $$DIR ;\
	for I in $$(seq -w 1 30) ; \
	do \
		if [ $$I -eq 1 ] ;\
		then \
			TREE_IN=$$DIR/$$I.tree ;\
			cp $< $$TREE_IN ;\
			$(TREE2PNG) $$TREE_IN $$TREE_IN.png ;\
		else \
			TREE_OUT=$$DIR/$$I.tree ;\
			$(SOGITREE) < $$TREE_IN > $$TREE_OUT ;\
			$(TREE2PNG) $$TREE_OUT $$TREE_OUT.png ;\
			TREE_IN=$$TREE_OUT ;\
		fi \
	done ;\
	ffmpeg -r 10 -i $$DIR/%0$${#I}d.tree.png -r 10 $@

