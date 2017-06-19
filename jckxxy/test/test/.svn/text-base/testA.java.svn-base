package test;

import java.util.HashMap;

import cn.edu.slcupc.action.UserPropertyFilter;

import com.alibaba.fastjson.JSON;

public class testA {
	 
	               
	 public static void main(String[] args) {
		 B b=new B();
		 b.setId(1);
		 b.setName("zhh");
		 A a=new A();
		 a.setB(b);
		 a.setId(2);
		 a.setName("ddd");
		 UserPropertyFilter filter=new UserPropertyFilter();
		 filter.setExcludes(new HashMap<Class<?>, String[]>() {
          private static final long serialVersionUID = -8411128674046835592L;
                    
          {
             put(A.class, new String[] { "id" });
             put(B.class, new String[] { "name" });
         }
         });
		  System.out.println(JSON.toJSONString(a, filter));
		 
		 
	}
}
