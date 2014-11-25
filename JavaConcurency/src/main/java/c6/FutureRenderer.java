package c6;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledThreadPoolExecutor;

import c6.SimgleThreadRenderer.ImageData;
import c6.SimgleThreadRenderer.ImageInfo;

public class FutureRenderer {

  private static final int SIZE = 100;
  private final ExecutorService executor = new ScheduledThreadPoolExecutor(SIZE);
  
  void renderPage(CharSequence source) {
    final List<ImageInfo> imageInfos = scanForImageInfo(source);
    Callable<List<ImageData>> task = new Callable<List<ImageData>>() {

      @Override
      public List<ImageData> call() throws Exception {
        List<ImageData> result = new ArrayList<ImageData>();
        for (ImageInfo imageInfo : imageInfos) {
          result.add(imageInfo.downloadImage());
        }
        return result;
      }
    };
    
    Future<List<ImageData>> future = executor.submit(task);
    renderText(source);
    try {
      List<ImageData> imageData = future.get();
      for (ImageData data : imageData) {
        renderImage(data);
      }
    } catch (InterruptedException e) {
      Thread.currentThread().interrupt();
      future.cancel(true);
    } catch (ExecutionException e) {
      throw launderThrowable(e.getCause());
    }
  }

  private List<ImageInfo> scanForImageInfo(CharSequence source) {
    // TODO Auto-generated method stub
    return null;
  }

  private RuntimeException launderThrowable(Throwable cause) {
    // TODO Auto-generated method stub
    return null;
  }

  private void renderImage(ImageData data) {
    // TODO Auto-generated method stub
    
  }

  private void renderText(CharSequence source) {
    // TODO Auto-generated method stub
    
  }
}
