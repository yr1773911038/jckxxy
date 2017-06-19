package cn.edu.slcupc.action;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class ObjectJsonValueProcessor
  implements JsonValueProcessor
{
  private String[] properties;
  private Class<?> clazz;
  
  public ObjectJsonValueProcessor(String[] properties, Class<?> clazz)
  {
    this.properties = properties;
    this.clazz = clazz;
  }
  
  public Object processArrayValue(Object arg0, JsonConfig arg1)
  {
    return null;
  }
  
  public Object processObjectValue(String key, Object value, JsonConfig jsonConfig)
  {
    PropertyDescriptor pd = null;
    Method method = null;
    StringBuffer json = new StringBuffer("{");
    try
    {
      for (int i = 0; i < this.properties.length; i++)
      {
        pd = new PropertyDescriptor(this.properties[i], this.clazz);
        method = pd.getReadMethod();
        String v = String.valueOf(method.invoke(value, new Object[0]));
        json.append("'" + this.properties[i] + "':'" + v + "'");
        json.append(i != this.properties.length - 1 ? "," : "");
      }
      json.append("}");
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
    return JSONObject.fromObject(json.toString());
  }
}
