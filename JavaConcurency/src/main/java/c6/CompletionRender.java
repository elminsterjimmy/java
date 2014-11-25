package c6;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;

import c6.SimgleThreadRenderer.ImageData;
import c6.SimgleThreadRenderer.ImageInfo;

public class CompletionRender {

  private final ExecutorService executor;
  
  CompletionRender(ExecutorService executor) {
    this.executor = executor;
  }
  
  void renderPage(CharSequence source) {
    List<ImageInfo> info = scanForImageInfo(source);
    CompletionService<ImageData> completionService = new ExecutorCompletionService<ImageData>(executor);
    for (final ImageInfo imageInfo : info) {
      completionService.submit(new Callable<ImageData>() {

        @Override
        public ImageData call() throws Exception {
          return imageInfo.downloadImage();
        }
        
      });
      
      renderText(source);
      
      try {
        for (int t = 0, n = info.size(); t < n; t++) {
          Future<ImageData> f = completionService.take();
          ImageData imageData = f.get();
          renderImage(imageData);
        }
      } catch (InterruptedException e) {
        Thread.currentThread().interrupt();
      } catch (ExecutionException e) {
        throw launderThrowable(e.getCause());
      }
    }
  }

  private RuntimeException launderThrowable(Throwable cause) {
    // TODO Auto-generated method stub
    return null;
  }

  private void renderImage(ImageData imageData) {
    // TODO Auto-generated method stub
    
  }

  private void renderText(CharSequence source) {
    // TODO Auto-generated method stub
    
  }

  private List<ImageInfo> scanForImageInfo(CharSequence source) {
    // TODO Auto-generated method stub
    return null;
  }
}
