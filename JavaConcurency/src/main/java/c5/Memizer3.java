package c5;

import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;

/**
 * A -> not hit cache -> put future to cache -> compute f(1) -> set result
 * B ->    not hit cache -> put future to cache -> compute f(1) -> set result
 * 
 * 
 * @author jgu
 *
 * @param <A>
 * @param <V>
 */
public class Memizer3<A, V> implements Computable<A, V> {

  private final Map<A, Future<V>> cache = new ConcurrentHashMap<A, Future<V>>();
  
  private final Computable<A, V> c;
  
  
  public Memizer3(Computable<A, V> c) {
    this.c = c;
  }
  
  @Override
  public V compute(final A arg) throws InterruptedException {
    Future<V> f = cache.get(arg);
    if (null == f) {
      Callable<V> eval = new Callable<V>() {

        @Override
        public V call() throws InterruptedException {
          return c.compute(arg);
        }
        
      };
      FutureTask<V> ft = new FutureTask<V>(eval); 
      f = ft;
      cache.put(arg, ft);
      ft.run();
    }
    try {
      return f.get();
    } catch (ExecutionException e) {
      throw launderThrowable(e.getCause());
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
}
