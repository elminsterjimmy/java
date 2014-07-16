package com.elminster.easyexpression.evaluate;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.elminster.common.util.ReflectUtil;
import com.elminster.easyexpression.DataType;
import com.elminster.easyexpression.IVariable;
import com.elminster.easyexpression.Variable;
import com.elminster.easyexpression.evaluate.IResult.Result;
import com.elminster.easyexpression.exception.ParserException;
import com.elminster.easyexpression.func.FunctionDef;
import com.elminster.easyexpression.func.Operator2Def;
import com.elminster.easyexpression.func.StandardOperation;
import com.elminster.easyexpression.operator.IOperator;

public class Evaluater implements IEvaluater {
  
  private static Log logger = LogFactory.getLog(Evaluater.class);

  private Map<String, FunctionDef> operations1 = new HashMap<String, FunctionDef>();
  private Map<String, Operator2Def> operations2 = new HashMap<String, Operator2Def>();

  private int line = 0;

  private int offset = 0;

  private int size;

  private String expression;

  private Map<String, IVariable> variableMap = new HashMap<String, IVariable>();
  
  private Stack<Object> stack;
  
  public Evaluater() {
    registDefaultOperator();
    registDefaultVariable();
  }
  
  private void registerDyadicOperation(Operator2Def odf) {
    operations2.put(odf.getName(), odf);
  }

  private void registDefaultVariable() {
    
  }

  private void registDefaultOperator() {
    registerDyadicOperation(StandardOperation.EQ);
    registerDyadicOperation(StandardOperation.NEQ1);
    registerDyadicOperation(StandardOperation.NEQ2);
    registerDyadicOperation(StandardOperation.GT);
    registerDyadicOperation(StandardOperation.GET);
    registerDyadicOperation(StandardOperation.LT);
    registerDyadicOperation(StandardOperation.LET);
    registerDyadicOperation(StandardOperation.AND);
    registerDyadicOperation(StandardOperation.OR);
    registerDyadicOperation(StandardOperation.PLUS);
    registerDyadicOperation(StandardOperation.SUB);
    registerDyadicOperation(StandardOperation.PLS);
    registerDyadicOperation(StandardOperation.DIV);
  }

  @Override
  public void addVariable(String variableName, Object variable) {
    if (isVariableDefined(variableName)) {
      throw new ParserException(variableName + " is already defined.");
    }
    this.variableMap.put(variableName, new Variable(variableName, variable));
  }

  @Override
  public void addFunction(String funcName, FunctionDef func) {
    checkOperator(funcName);
  }

  private void checkOperator(String opName) {

  }

  @Override
  public Object evaluate(String expression) {
    compile(expression);
    Object rst = null;
    Stack<Object> stk = new Stack<Object>();
    int stackSize = stk.size();
    for (Object obj : this.stack) {
      IOperator operator = (IOperator) obj;
      IResult result = operator.operate(stk);
      if (logger.isDebugEnabled()) {
        StringBuilder sb = new StringBuilder();
        sb.append(result.getCommand());
        sb.append(" ==========> ");
        sb.append(result.getResult());
        logger.debug(sb.toString());
      }
      if (Result.NG == result.getSuccess()) {
        // TODO
      } else {
        
      }
    }
    if (stk.size() - stackSize == 1) {
      return stk.pop();
    } else if (stk.size() - stackSize == 0) {
      return null;
    }
    return rst;
  }
  
  private void compile(String expression) {
    this.expression = expression;
    this.offset = 0;
    this.line = 0;
    this.size = expression.length();
    this.stack = new Stack<Object>();
    
    compile0();
  }
  
  private DataType compile0() {
    DataType result = DataType.UNDEFINE;
    if (this.offset < this.size) {
      result = readOperand();
      skipSpace();
      if (!result.isUndefined()) {
        while (this.offset < this.size) {
          String op = readOperate();
          Operator2Def operator = searchDyadicOperation(op);
          if (null != operator) {
            result = read2Operator(result, operator);
          }
        }
      } else {
        throw new ParserException("unknow keyword: " + readNextWord());
      }
    }
    return result;
  }
  
  private DataType read2Operator(DataType left, Operator2Def operator) {
    Stack<Object> stack = this.stack;
    this.stack = new Stack<Object>();
    DataType right = readOperand();
    int offset = this.offset;
    String op2 = readOperate();
    Operator2Def operator2 = searchDyadicOperation(op2);
    if (null != operator2 && operator2.getPriority() > operator.getPriority()) {
      right = read2Operator(right, operator2);
    } else {
      this.offset = offset;
    }
    this.stack.push(operator.getOperator());
    Stack<Object> result = new Stack<Object>();
    for (int i = 0; i < stack.size(); i++) {
      result.push(stack.get(i));
    }
    for (int i = 0; i < this.stack.size(); i++) {
      result.push(this.stack.get(i));
    }
    this.stack = result;
    return left;
  }

  private Operator2Def searchDyadicOperation(String op) {
    return operations2.get(op);
  }

  private String readOperate() {
    skipSpace();
    return readNextWord();
  }

  // TODO timestamp
  private DataType readOperand() {
    DataType dt = DataType.UNDEFINE;
    skipSpace();
    int idx = offset;
    if (idx < size) {
      char c = expression.charAt(idx);
      if ('(' == c) {
        this.offset++;
        dt = compile0();
        if (offset < size) {
          c = expression.charAt(offset++);
          if (')' != c) {
            throw new ParserException("except '('", this.line, this.offset);
          }
        }
        // TODO not support function invoke: (T).func()
      } else if ('\'' == c || '"' == c) {
        // string
        dt = readString();
      } else if ('-' == c || isNumberic(c)) {
        // number
        dt = readNumber();
      } else if (isNull()) {
        dt = DataType.NULL;
      } else if (isBooleanConst()) {
        dt = DataType.BOOLEAN;
      } else if (isOp1Operator()) {
        String op1 = readNextWord();
        dt = readOperand();
        dt = lookup1Operator(op1, dt);
      } else {
        // try to variable
        dt = readVariable();
      }
      if (DataType.UNDEFINE.equals(dt)) {
        this.offset = idx;
        throw new ParserException("undefined symbol " + readNextWord());
      }
    }
    return dt;
  }

  private DataType lookup1Operator(String op1, DataType dt) {
    FunctionDef f = operations1.get(op1);
    this.stack.push(f.getOperator());
    return f.getResult();
  }
  
  private boolean isOp1Operator() {
    int offset = this.offset;
    String word = readNextWord();
    boolean result = operations1.containsKey(word);
    this.offset = offset;
    return result;
  }

  private boolean isBooleanConst() {
    skipSpace();
    if (this.offset >= this.size) {
      return false;
    }
    int offset = this.offset;
    String word = readNextWord();
    boolean result = true;
    if ("true".equals(word)) {
      this.stack.push(new Variable(true));
    } else if ("false".equals(word)) {
      this.stack.push(new Variable(false));
    } else {
      result = false;
    }
    if (!result) {
      this.offset = offset;
    }
    return result;
  }

  private boolean isVariableDefined(String variableName) {
    return null != variableMap.get(variableName);
  }
  
  private boolean isNull() {
    skipSpace();
    if (this.offset >= this.size) {
      return false;
    }
    int offset = this.offset;
    String word = readNextWord();
    boolean result = "null".equals(word);
    if (!result) {
      this.offset = offset;
    } else {
      this.stack.push(new Variable());
    }
    return result;
  }

  private DataType readVariable() {
    IVariable variable = null;
    // // ignore $
    // offset++;
    String nextWord = readNextWord();
    String variableName = null;
    String variableProperty = null;
    if (null != nextWord) {
      int idx = nextWord.indexOf(".");
      if (-1 != idx) {
        variableName = nextWord.substring(0, idx);
        variableProperty = nextWord.substring(idx + 1);
      } else {
        variableName = nextWord;
      }
    }
    IVariable v = variableMap.get(variableName);
    if (null == v) {
      throw new ParserException("variable: " + variableName + " is not defined.", line);
    }
    Object var;
    if (null == variableProperty) {
      variable = v;
    } else {
      Object o = v.getVariableValue();
      Field field = ReflectUtil.getDeclaredField(o.getClass(), variableProperty);
      try {
        var = ReflectUtil.getFieldValue(o, field);
        variable = new Variable(v.getVariableName() + "." + variableProperty, var);
      } catch (IllegalArgumentException e) {
        throw new ParserException("variable: " + nextWord + " is not defined in class:" + o.getClass().getName(), line);
      } catch (IllegalAccessException e) {
        throw new ParserException("variable: " + nextWord + " is not defined in class:" + o.getClass().getName(), line);
      }
    }
    stack.push(variable);
    return variable.getVariableType();
  }

  private DataType readNumber() {
    IVariable variable = null;
    char sign = expression.charAt(offset);
    int start = offset;
    boolean hasDot = false;
    boolean hasE = false;
    boolean hasL = false;
    if ('-' == sign) {
      // is negative
      offset++;
    }
    while (offset < size) {
      char c = expression.charAt(offset);
      if (isNumberic(c)) {
        ;
      } else if (!hasDot && '.' == c) {
        hasDot = true;
      } else if (!hasE && ('e' == c || 'E' == c)) {
        hasE = true;
      } else if (!hasDot && !hasE && !hasL && ('l' == c || 'L' == c)) {
        hasL = true;
      } else {
        break;
      }
      offset++;
    }
    String number = expression.substring(start, offset);
    if (hasDot) {
      variable = new Variable(new Double(number));
    } else if (hasL) {
      variable = new Variable(new Long(number));
    } else {
      variable = new Variable(new Integer(number));
    }
    stack.push(variable);
    return variable.getVariableType();
  }

  private DataType readString() {
    IVariable variable = null;
    char separator = expression.charAt(offset);
    offset++;
    int start = offset;
    while (offset < size && expression.charAt(offset) != separator) {
      offset++;
    }

    if (offset == size) {
      throw new ParserException("unexpected end,", line);
    }
    String string = expression.substring(start, offset);
    variable = new Variable((Object)string);
    offset++;
    stack.push(variable);
    return DataType.STRING;
  }

  private boolean isNumberic(char c) {
    return c >= '0' && c <= '9';
  }

  private boolean isSkipSpace(char c) {
    return ' ' == c || '\t' == c || '\n' == c || '\r' == c;
  }

  private void skipSpace() {
    for (; offset < size; offset++) {
      char c = expression.charAt(offset);
      if (!isSkipSpace(c)) {
        break;
      }
      // new line
      if (10 == c) {
        line++;
      }
    }
  }

  private String readNextWord() {
    skipSpace();
    StringBuilder sb = new StringBuilder();
    for (; offset < size; offset++) {
      char c = expression.charAt(offset);
      if (isSkipSpace(c)) {
        break;
      } else {
        sb.append(c);
      }
    }
    return sb.toString();
  }

  @Override
  public void setVariableValue(String variableName, Object variable) {
    if (!isVariableDefined(variableName)) {
      throw new ParserException(variableName + " is not defined.", line);
    }
    IVariable oldValue = variableMap.get(variableName);
    IVariable newValue = new Variable(variableName, variable);
    // type check
    if (!oldValue.getVariableType().equals(newValue.getVariableType())) {
      throw new ParserException("Data type mismatch: old variable type is: " + oldValue.getVariableType().getName()
          + " new variable type is :" + newValue.getVariableType().getName(), line);
    }
    this.variableMap.put(variableName, newValue);
  }
}
