package c5;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

public class Preloader {

  private final FutureTask<Integer> futrue = new FutureTask<Integer>(new Callable<Integer>() {
    public Integer call() throws DataLoadException {
      return loadInteger();
    }
  });
  
  private final Thread thread = new Thread(futrue);
  
  public void start() { thread.start(); }
  
  public Integer get() throws DataLoadException, InterruptedException {
    try {
      return futrue.get();
    } catch (ExecutionException e) {
      Throwable cause = e.getCause();
      if (cause instanceof DataLoadException) {
        throw (DataLoadException) cause;
      } else {
        throw launderThrowable(cause);
      }
      
    }
  }

  private RuntimeException launderThrowable(Throwable t) {
    if (t instanceof RuntimeException) {
      return (RuntimeException) t;
    } else if (t instanceof Error) {
      throw (Error) t;
    } else {
      throw new IllegalStateException("Not unchecked", t);
    }
  }

  protected Integer loadInteger() {
    // TODO Auto-generated method stub
    return null;
  }
  
  class DataLoadException extends RuntimeException {
    
  }
}
