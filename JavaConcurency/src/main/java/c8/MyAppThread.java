package c8;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyAppThread extends Thread {

  public static final String DEFAULT_NAME = "MyAppThread";
  private static volatile boolean debugLifecycel = false;
  private static final AtomicInteger created = new AtomicInteger();
  private static final AtomicInteger alive = new AtomicInteger();
  private static final Logger log = Logger.getAnonymousLogger();
  
  public MyAppThread(Runnable r) {
    this(r, DEFAULT_NAME);
  }
  
  public MyAppThread(Runnable r, String name) {
    super(r, name + "-" + created.incrementAndGet());
    this.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
      
      @Override
      public void uncaughtException(Thread t, Throwable e) {
        log.log(Level.SEVERE, "UNCAUGHT in thread " + t.getName(), e);
      }
    });
  }
  
  public void run() {
    boolean debug = debugLifecycel;
    if (debug) {
      log.log(Level.FINE, "Created " + getName());
    }
    try {
      alive.incrementAndGet();
      super.run();
    } finally {
      alive.decrementAndGet();
      if (debug) {
        log.log(Level.FINE, "Exiting " + getName());
      }
    }
  }

  /**
   * @return the debugLifecycel
   */
  public static boolean isDebugLifecycel() {
    return debugLifecycel;
  }

  /**
   * @param debugLifecycel the debugLifecycel to set
   */
  public static void setDebugLifecycel(boolean debugLifecycel) {
    MyAppThread.debugLifecycel = debugLifecycel;
  }

  /**
   * @return the created
   */
  public static AtomicInteger getCreated() {
    return created;
  }

  /**
   * @return the alive
   */
  public static AtomicInteger getAlive() {
    return alive;
  }
}
