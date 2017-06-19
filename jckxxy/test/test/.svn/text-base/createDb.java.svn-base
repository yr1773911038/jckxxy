package test;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.junit.Test;

public class createDb {
	@Test
	public void create(){
			  Configuration cfg = new Configuration().configure("hibernate.cfg.xml");  
		        // 生成并输出sql到文件（当前目录）和数据库  
		        SchemaExport export = new SchemaExport(cfg);  
		        // true 在控制台打印sql语句，true 导入sql语句到数据库，即可执行  
		        export.create(true, true);  
			
		}

}
