package c5;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import anno.GuardedBy;

/**
 * A -> not hit cache -> compute f(1) -> put to cache
 * B ---------------------> not hit cache -> compute f(1) -> put to cache
 * 
 * 
 * @author jgu
 *
 * @param <A>
 * @param <V>
 */
public class Memizer2<A, V> implements Computable<A, V> {

  private final Map<A, V> cache = new ConcurrentHashMap<A, V>();
  
  private final Computable<A, V> c;
  
  
  public Memizer2(Computable<A, V> c) {
    this.c = c;
  }
  
  @Override
  public V compute(A arg) throws InterruptedException {
    V result = cache.get(arg);
    if (null == result) {
      result = c.compute(arg);
      cache.put(arg, result);
    }
    return result;
  }
}
