package com.elminster.easydao.db.executor;

import java.lang.reflect.Method;

import com.elminster.easydao.db.analyze.data.SqlStatementInfo;
import com.elminster.easydao.db.analyze.data.SqlStatementInfo.SqlType;
import com.elminster.easydao.db.handler.IResultSetHandler;
import com.elminster.easydao.db.handler.ResultSetHandlerFactory;

public class ExecutorProxy {
  
  private ResultSetHandlerFactory resultSetHandlerFactory = ResultSetHandlerFactory
      .getInstance();
  
  private ISqlExecutor executor;
  
  public ExecutorProxy(ISqlExecutor executor) {
    this.executor = executor;
  }

  public Object execute(SqlStatementInfo sqlStatementInfo, Method invokeMethod,
      Object[] args) throws ExecuteException {
    Object rst = null;
    SqlType sqlType = sqlStatementInfo.getAnalyzedSqlType();
    IResultSetHandler resultSetHandler = null;
    try {
      resultSetHandler = resultSetHandlerFactory
          .getResultSetHandler(invokeMethod);
    } catch (Exception e) {
      throw new ExecuteException("cannot generate result set handler: " + e);
    }
    if (SqlType.UPDATE == sqlType) {
      rst = executor.executeUpdate(sqlStatementInfo);
    } else if (SqlType.QUERY == sqlType) {
      rst = executor.executeQuery(sqlStatementInfo, resultSetHandler);
    } else if (SqlType.STORED_PROCEDURE == sqlType) {

    }
    return rst;
  }
}
