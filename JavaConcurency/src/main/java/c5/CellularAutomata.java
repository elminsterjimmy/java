package c5;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

public class CellularAutomata {

  private final Board mainBoard;
  
  private final CyclicBarrier barrier;
  
  private final Worker[] workers;
  
  public CellularAutomata(Board board) {
    this.mainBoard = board;
    int count = Runtime.getRuntime().availableProcessors();
    this.barrier = new CyclicBarrier(count, new Runnable() {

      @Override
      public void run() {
        mainBoard.commitNewValue();
      }
      
    });
    this.workers = new Worker[count];
    for (int i = 0; i < count; i++) {
      workers[i] = new Worker(mainBoard.getSubBoard(count, i));
    }
  }
  
  private class Worker implements Runnable {
    private final Board board;
    
    public Worker(Board board) {
      this.board = board;
    }
    
    @Override
    public void run() {
      while(!board.hasConverged()) {
        for (int x = 0; x < board.getMaxX(); x++) {
          for (int y = 0; y < board.getMaxX(); y++) {
            board.setNewValue(x, y, computerValue(x, y));
          }
        }
        try {
          barrier.await();
        } catch (InterruptedException ex) {
          return;
        } catch (BrokenBarrierException ex) {
          return;
        }
      }
    }
    
  }
  
  class Board {

    public boolean hasConverged() {
      // TODO Auto-generated method stub
      return false;
    }

    public void setNewValue(int x, int y, Object computerValue) {
      // TODO Auto-generated method stub
      
    }

    public Board getSubBoard(int count, int i) {
      // TODO Auto-generated method stub
      return null;
    }

    public void commitNewValue() {
      // TODO Auto-generated method stub
      
    }

    public int getMaxX() {
      // TODO Auto-generated method stub
      return 0;
    }
    
  }

  public Object computerValue(int x, int y) {
    // TODO Auto-generated method stub
    return null;
  }
}
