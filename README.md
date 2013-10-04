detect-orientation
==================

Use tesseract API to detect image orientation

## Usage

```
$ bin/detect_orientation <filename>
Orientation: 3
WritingDirection: 0
TextlineOrder: 2
Deskew angle: -0.0021
```

## Building

Requires tesseract 3.02.02. The makefile assumes header files for tesseract and
leptonica can be found under:

* /usr/include/tesseract
* /usr/local/include/leptonica

However, if you manually build tesseract and leptonica you can change the
INCLUDES to something like:

```
INCLUDES=-I../tesseract-ocr/api -I../tesseract-ocr/ccstruct \
				 -I../tesseract-ocr/ccutil -I../tesseract-ocr/ccmain \
				 -I../leptonica-1.69/src
```

The makefile compiles a binary with the tesseract and leptonica libraries
statically linked.

## Notes

In the bin directory we have a detect_orientation and detect_orientation.x86.
detect_orientation is the 64bit version. When running make, we compile onto
bin/detect_orientation (even if you are making a 32bit version).
