package c6;

import java.util.Timer;
import java.util.TimerTask;

/**
 * Result: 
 * 
Exception in thread "Timer-0" java.lang.RuntimeException
  at c6.OutOfTime$ThrowTask.run(OutOfTime.java:20)
  at java.util.TimerThread.mainLoop(Timer.java:555)
  at java.util.TimerThread.run(Timer.java:505)
Exception in thread "main" java.lang.IllegalStateException: Timer already cancelled.
  at java.util.Timer.sched(Timer.java:397)
  at java.util.Timer.schedule(Timer.java:193)
  at c6.OutOfTime.main(OutOfTime.java:12)

 * @author jgu
 *
 */
public class OutOfTime {

  public static void main(String[] args) throws Exception {
    Timer timer = new Timer();
    timer.schedule(new ThrowTask(), 1);
    SECONDS.sleep(1);
    timer.schedule(new ThrowTask(), 1);
    SECONDS.sleep(5);
  }
  
  static class ThrowTask extends TimerTask {

    @Override
    public void run() {
      throw new RuntimeException();
    }
    
  }
  
  static class SECONDS {
    public static void sleep(long l) throws InterruptedException {
      Thread.sleep(l * 1000);
    }
  }
}
