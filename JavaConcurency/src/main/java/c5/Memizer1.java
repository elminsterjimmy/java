package c5;

import java.util.HashMap;
import java.util.Map;

import anno.GuardedBy;

public class Memizer1<A, V> implements Computable<A, V> {

  @GuardedBy("this")
  private final Map<A, V> cache = new HashMap<A, V>();
  
  private final Computable<A, V> c;
  
  
  public Memizer1(Computable<A, V> c) {
    this.c = c;
  }
  
  @Override
  public synchronized V compute(A arg) throws InterruptedException {
    V result = cache.get(arg);
    if (null == result) {
      result = c.compute(arg);
      cache.put(arg, result);
    }
    return result;
  }

}
