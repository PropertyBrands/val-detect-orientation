# To compile programs using tesseract's API (>= 3.02.02-1)
CC=g++
CFLAGS=
LDFLAGS= -Wl,-static -ltesseract -llept -Wl,-Bdynamic -Wl,--as-needed \
				 -lpthread -lz -lm -ljpeg -ltiff -lpng
INCLUDES=-I/usr/include/tesseract -I/usr/local/include/leptonica

# If needing to include from a local build
#INCLUDES=-I../tesseract-ocr/api -I../tesseract-ocr/ccstruct \
#				 -I../tesseract-ocr/ccutil -I../tesseract-ocr/ccmain \
#				 -I../leptonica-1.69/src

BINARY_DIR=./bin

all:
	mkdir -p $(BINARY_DIR)
	$(CC) src/detect_orientation.cpp $(CFLAGS) $(INCLUDES) $(LDFLAGS) \
		-o $(BINARY_DIR)/detect_orientation

clean:
	rm --force $(BINARY_DIR)/detect_orientation
	rmdir --ignore-fail-on-non-empty $(BINARY_DIR)
