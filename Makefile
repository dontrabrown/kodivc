EXECUTABLE=kodivc
MODELDIR=`pkg-config --variable=modeldir pocketsphinx`
LIBS=`pkg-config --cflags --libs pocketsphinx sphinxbase` -lcurl
GITVERSION=`git log --oneline 2>/dev/null | cut -d' ' -f1 | head -1`

all:
	gcc -g -o $(EXECUTABLE) $(EXECUTABLE).c -DGITVERSION=\"$(GITVERSION)\" -DMODELDIR=\"$(MODELDIR)\" $(LIBS)

clean:
	rm -f $(EXECUTABLE)

install:
	install -d $(DESTDIR)/usr/bin $(DESTDIR)/$(MODELDIR)/lm/en/kodivc
	install $(EXECUTABLE) $(DESTDIR)/usr/bin/$(EXECUTABLE)
	install -m 0644 -t $(DESTDIR)/$(MODELDIR)/lm/en/kodivc model/normal.dic model/spelling.dic model/kodivc.lm

