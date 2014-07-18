package com.elminster.easydao.db.handler;

import java.lang.reflect.Method;
import java.util.Collection;

import com.elminster.common.util.ReflectUtil;

public class ResultSetHandlerFactory {

	private static ResultSetHandlerFactory instance = new ResultSetHandlerFactory();
	
	private ResultSetHandlerFactory() {}
	
	public static ResultSetHandlerFactory getInstance() {
		return instance;
	}
	
	public IResultSetHandler getResultSetHandler(Method invokeMethod) throws HandleException {
		Class<?> returnClazz = invokeMethod.getReturnType();
		Class<?>[] genericType;
    try {
      genericType = ReflectUtil.getGenericReturnType(invokeMethod);
      return getResultSetHandler(returnClazz, genericType);
    } catch (ClassNotFoundException e) {
      throw new HandleException(e);
    }
	}
	
	public IResultSetHandler getResultSetHandler(Class<?> resultClass, Class<?>[] genericTypes) throws HandleException {
    IResultSetHandler resultSetHandler = null;
    if (null == resultClass) {
      return null;
    } else if (Collection.class.isAssignableFrom(resultClass)) {
      // List
      resultSetHandler = new CollectionResultSetHandler(genericTypes[0], resultClass);
    } else if (resultClass.isArray()) {
      // Array
    } else {
      resultSetHandler = new ObjectResultSetHandler(resultClass);
    }
    return resultSetHandler;
  }
}
