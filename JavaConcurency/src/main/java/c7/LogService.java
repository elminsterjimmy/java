package c7;

import java.io.PrintWriter;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import anno.GuardedBy;

public class LogService {

  private final BlockingQueue<String> queue = new LinkedBlockingQueue<String>();
  private final LoggerThread loggerThread = new LoggerThread();
  private final PrintWriter writer = new PrintWriter(System.out);
  @GuardedBy("this") private boolean isShutdown;
  @GuardedBy("this") private int reservations;
  
  public void start() {
    loggerThread.start();
  }
  
  public void stop() {
    synchronized (this) {
      isShutdown = true;
    }
    loggerThread.interrupt();
  }
  
  public void log(String msg) throws InterruptedException {
    synchronized (this) {
      if (isShutdown) {
        throw new IllegalStateException();
      }
      ++reservations;
    }
    queue.put(msg);
  }
  
  private class LoggerThread extends Thread {
    public void run() {
      try {
        while (true) {
          try {
            synchronized (LogService.this) {
              if (isShutdown && reservations == 0) {
                break;
              }
            }
            String msg = queue.take();
            synchronized (LogService.this) {
              --reservations;
            }
            writer.println(msg);
          } catch (InterruptedException e) {
            
          }
        }
      } finally {
        writer.close();
      }
    }
  }
}
