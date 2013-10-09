#include <baseapi.h>    // tesseract
#include <allheaders.h> // leptonica

#include <iostream>

using namespace std;

int main( int argc, char *argv[] ) {
  if ( argc != 2 ) { // argc should be 2 for correct execution
    // We print argv[0] assuming it is the program name
    cout<<"usage: "<< argv[0] <<" <filename>\n";
    exit(0);
  }

  // string file with filename
  char* file = argv[1];

  tesseract::Orientation orientation;
  tesseract::WritingDirection direction;
  tesseract::TextlineOrder order;
  float deskew_angle;

  Pix *image = pixRead(file);
  tesseract::TessBaseAPI *api = new tesseract::TessBaseAPI();
  // Initialize tesseract-ocr with English, without specifying tessdata path
  if (api->Init(NULL, "eng")) {
    fprintf(stderr, "Could not initialize tesseract.\n");
    exit(1);
  }

  api->SetPageSegMode(tesseract::PSM_AUTO_OSD);
  api->SetImage(image);

  tesseract::PageIterator* it =  api->AnalyseLayout();
  it->Orientation(&orientation, &direction, &order, &deskew_angle);
  printf("Orientation: %d\nWritingDirection: %d\nTextlineOrder: %d\n" \
      "Deskew angle: %.4f\n",
      orientation, direction, order, deskew_angle);

  return 0;
}
