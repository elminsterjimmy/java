package c8;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;

import anno.GuardedBy;
import anno.Immutable;
import anno.ThreadSafe;

public class ConcurrentPuzzleSolver<P, M> {

  private final Puzzle<P, M> puzzle;
  private final ExecutorService exec;
  private final ConcurrentMap<P, Boolean> seen = new ConcurrentHashMap<P, Boolean>();
  final ValueLatch<Node<P, M>> solution = new ValueLatch<Node<P, M>>();
  
  public ConcurrentPuzzleSolver(Puzzle<P, M> puzzle, ExecutorService exec) {
    super();
    this.puzzle = puzzle;
    this.exec = exec;
  }

  public List<M> solve() throws InterruptedException {
    try {
      P p =puzzle.initialPosition();
      exec.execute(newTask(p, null, null));
      Node<P, M> solnNode = solution.getValue();
      return null == solnNode ? null : solnNode.asMoveList();
    } finally {
      exec.shutdown();
    }
  }
  
  protected Runnable newTask(P p, M m, Node<P, M> n) {
    return new SolverTask(p, m, n);
  }

  class SolverTask extends Node<P, M> implements Runnable {
    
    public SolverTask(P pos, M move, Node<P, M> prev) {
      super(pos, move, prev);
    }

    public void run() {
      if (solution.isSet() || null != seen.putIfAbsent(pos, true)) {
        return; // found the solution or run the position.
      }
      if (puzzle.isGoal(pos)) {
        solution.setValue(this);
      } else {
        for (M m : puzzle.legalMoves(pos)) {
          exec.execute(newTask(puzzle.move(pos, m), m, this));
        }
      }
    }
  }

  @Immutable
  static class Node<P, M> {
    final P pos;
    final M move;
    final Node<P, M> prev;
    
    public Node(P pos, M move, Node<P, M> prev) {
      super();
      this.pos = pos;
      this.move = move;
      this.prev = prev;
    }
    
    List<M> asMoveList() {
      List<M> solution = new LinkedList<M>();
      for (Node<P, M> n = this; n.move != null; n = n.prev) {
        solution.add(0, n.move);
      }
      return solution;
    }
  }
  
  @ThreadSafe
  public class ValueLatch<T> {
    @GuardedBy("this") private T value = null;
    private final CountDownLatch done = new CountDownLatch(1);
    
    public boolean isSet() {
      return 0 == done.getCount();
    }
    
    public synchronized void setValue(T newValue) {
      if (!isSet()) {
        value = newValue;
        done.countDown();
      }
    }
    
    public T getValue() throws InterruptedException {
      done.await();
      synchronized (this) {
        return value;
      }
    }
  }
}
