package c8;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicInteger;

public class PuzzleSolver<P, M> extends ConcurrentPuzzleSolver<P, M> {
  
  private final AtomicInteger taskCount = new AtomicInteger(0);

  public PuzzleSolver(Puzzle<P, M> puzzle, ExecutorService exec) {
    super(puzzle, exec);
  }

  @Override
  protected Runnable newTask(P p, M m, c8.ConcurrentPuzzleSolver.Node<P, M> n) {
    return super.newTask(p, m, n);
  }

  class CountingSolverTask extends SolverTask {

    public CountingSolverTask(P pos, M move,
        c8.ConcurrentPuzzleSolver.Node<P, M> prev) {
      super(pos, move, prev);
      taskCount.incrementAndGet();
    }
    
    public void run() {
      try {
        super.run();
      } finally {
        if (0 == taskCount.decrementAndGet()) {
          solution.setValue(null);
        }
      }
    }
  }
}
