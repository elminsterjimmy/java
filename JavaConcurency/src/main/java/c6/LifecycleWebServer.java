package c6;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledThreadPoolExecutor;

public class LifecycleWebServer {

  private static final int SIZE = 100;
  private final ExecutorService exec = new ScheduledThreadPoolExecutor(SIZE);
  
  public void start() throws IOException {
    ServerSocket socket = new ServerSocket(80);
    while (!exec.isShutdown()) {
      try {
        final Socket conn = socket.accept();
        exec.execute(new Runnable() {
          
          @Override
          public void run() {
            handleRequest(conn);
          }
          
        });
      } catch (RejectedExecutionException e) {
        if (!exec.isShutdown()) {
          System.out.println("task submission rejected " + e);
        }
      }
    }
  }
  
  public void stop() {
    exec.shutdown();
  }

  protected void handleRequest(Socket conn) {
    Request req = readRequest(conn);
    if (isShutdownRequest(req)) {
      stop();
    } else {
      dispatchRequest(req);
    }
  }
  
  private void dispatchRequest(Request req) {
    // TODO Auto-generated method stub
    
  }

  private boolean isShutdownRequest(Request req) {
    // TODO Auto-generated method stub
    return false;
  }

  private Request readRequest(Socket conn) {
    // TODO Auto-generated method stub
    return null;
  }

  class Request {
    
  }
}
