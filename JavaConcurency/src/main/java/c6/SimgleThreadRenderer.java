package c6;

import java.util.ArrayList;
import java.util.List;

public class SimgleThreadRenderer {

  void renderPage(CharSequence source) {
    renderText(source);
    List<ImageData> imageData = new ArrayList<ImageData>();
    for (ImageInfo imageInfo : scanForImageInfo(source)) {
      imageData.add(imageInfo.downloadImage());
    }
    for (ImageData data : imageData) {
      renderImage(data);
    }
  }
  
  
  private List<ImageInfo> scanForImageInfo(CharSequence source) {
    // TODO Auto-generated method stub
    return null;
  }


  private void renderImage(ImageData data) {
    // TODO Auto-generated method stub
    
  }



  private void renderText(CharSequence source) {
    // TODO Auto-generated method stub
    
  }


  class ImageData {
    
  }
  
  class ImageInfo {

    public ImageData downloadImage() {
      // TODO Auto-generated method stub
      return null;
    }
    
  }
}
