package c6;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import c6.QuoteTask.TravelQuote;

public class QuoteTask implements Callable<TravelQuote> {
  
  private static final int SIZE = 100;
  private final ExecutorService exec = new ScheduledThreadPoolExecutor(SIZE);

  private final TravelCompany company;
  private final TravelInfo travelInfo;

  public QuoteTask(TravelCompany company, TravelInfo travelInfo) {
    super();
    this.company = company;
    this.travelInfo = travelInfo;
  }

  @Override
  public TravelQuote call() throws Exception {
    return company.solicitQuote(travelInfo);
  }

  public List<TravelQuote> getRankedTravelQuotes(TravelInfo travelInfo,
      Set<TravelCompany> companies, Comparator<TravelQuote> ranking, long time,
      TimeUnit unit) throws InterruptedException {
    List<QuoteTask> tasks = new ArrayList<QuoteTask>();
    for (TravelCompany company : companies) {
      tasks.add(new QuoteTask(company, travelInfo));
    }
    
    List<Future<TravelQuote>> futures = exec.invokeAll(tasks, time, unit);
    List<TravelQuote> quotes = new ArrayList<TravelQuote>(tasks.size());
    Iterator<QuoteTask> taskIter = tasks.iterator();
    for (Future<TravelQuote> f : futures) {
      QuoteTask task = taskIter.next();
      try {
        quotes.add(f.get());
      } catch (ExecutionException e) {
        quotes.add(task.getFailureQuote(e.getCause()));
      } catch (CancellationException e) {
        quotes.add(task.getTimeoutQuote(e));
      }
    }
    
    Collections.sort(quotes, ranking);
    return quotes;
  }

  private TravelQuote getTimeoutQuote(CancellationException e) {
    // TODO Auto-generated method stub
    return null;
  }

  private TravelQuote getFailureQuote(Throwable cause) {
    // TODO Auto-generated method stub
    return null;
  }

  class TravelQuote {

  }

  class TravelCompany {

    public TravelQuote solicitQuote(TravelInfo travelInfo) {
      // TODO Auto-generated method stub
      return null;
    }

  }

  class TravelInfo {

  }
}
