package c8;

import java.util.concurrent.ThreadFactory;

public class MyThreadFactory implements ThreadFactory {
  private final String poolName;
  
  public MyThreadFactory(String poolName) {
    super();
    this.poolName = poolName;
  }

  @Override
  public Thread newThread(Runnable r) {
    return new MyAppThread(runnable, poolName);
  }

}
