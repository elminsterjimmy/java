package c7;

import java.io.File;
import java.io.FileFilter;
import java.util.concurrent.BlockingQueue;

public class IndexingService {

  private static final File POISON = new File("");
  private final IndexerThread consumer = new IndexerThread();
  private final CrawlerThread producer = new CrawlerThread();
  private final BlockingQueue<File> queue;
  private final FileFilter fileFilter;
  private final File root;

  class CrawlerThread extends Thread {
    public void run() {
      try {
        crawl(root);
      } catch (InterruptedException e) {

      } finally {
        while (true) {
          try {
            queue.put(POISON);
            break;
          } catch (InterruptedException e1) {

          }
        }
      }
    }

    private void crawl(File root) throws InterruptedException {
      // TODO Auto-generated method stub

    }
  }

  class IndexerThread extends Thread {
    public void run() {
      try {
        while (true) {
          File file;
          file = queue.take();
          if (POISON == file) {
            break;
          } else {
            indexFile(file);
          }
        }
      } catch (InterruptedException e) {
      }
    }

    private void indexFile(File file) {
      // TODO Auto-generated method stub

    }
  }

  public void start() {
    producer.start();
    consumer.start();
  }

  public void stop() {
    producer.interrupt();
  }

  public void awaitTermination() throws InterruptedException {
    consumer.join();
  }
}
