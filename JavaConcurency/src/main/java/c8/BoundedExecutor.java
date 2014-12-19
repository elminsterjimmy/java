package c8;

import java.util.concurrent.Executor;
import java.util.concurrent.Semaphore;

import anno.ThreadSafe;

@ThreadSafe
public class BoundedExecutor {

  private final Executor exec;
  private final Semaphore semaphore;
  
  public BoundedExecutor(Executor exec, Semaphore semaphore) {
    this.exec = exec;
    this.semaphore = semaphore;
  }
 
  public void submitTask(final Runnable command) throws InterruptedException {
    
  }
}
