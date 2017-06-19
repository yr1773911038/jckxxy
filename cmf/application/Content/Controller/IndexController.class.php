<?php
namespace Content\Controller; 
use Common\Controller\AdminbaseController;  

class IndexController extends AdminbaseController {
//读取数据
    public function index(){        //定义操作方法
	$content = M('Content');   //实例化content对象  模型实例化
 	    $arrayWhere= '';
        $count = $content->where($arrayWhere)->count();    //查询满足条件的总记录数
        $page = $this->page($count, 6);     //传入总记录数和每页显示的记录数
        $forms = $content->where($arrayWhere)->order("id DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Admin'));  
        if($forms) {
            $this->assign('lists',$forms);   // 模板变量赋值
        }else{
            $this->error('数据错误');
        }
  	$this->display();    //输出模板
    }
//增加数据
    public function insert(){
 		$Form = D('Content');   //自定义模型实例化
        if($Form->create()) {
            $result = $Form->add();
            if($result) {
                $this->success('数据添加成功！');
            }else{
                $this->error('数据添加错误！');
            }
        }else{
            $this->error($Form->getError());
        } 
    }
//save方法更新数据库        
    public function save(){        
      	$Form = D('Content');
        if($Form->create()) {
            $result = $Form->save(); 
            if($result) {
                $this->success('操作成功！');
            }else{
                $this->error('写入错误！');
            }
        }else{
            $this->error($Form->getError());
        }
    }
//已经创建数据 insert方法
    public function add(){
     	$this->display();
    }
//修改数据
    public function edit($id=0){
      	$Form = M('Content');
	    $data = $Form->find($id);    //读取数据使用find方法
	    if($data) {
	        $this->assign('vo',$data);  // 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display(); 
    }
//删除数据
	public function  delete($id=0){
		$Form = D('Content');
		$data = $Form->delete($id);
		if ($data){
			$this->success("删除成功！");
		}else{
			$this->error("删除失败！");
		}
	}
//查找数据   
    public function search() {
        if($_POST['title']){
            $search1=$_POST['title'];//按照内容标题查找
            //echo $search1;
        }
        if($_POST['title1']){
            $search2=$_POST['title1'];//按照内容关键字查找
            //echo $search2;
        }
        if($_POST['title2']){
            $search3=$_POST['title2'];//按照内容状态查找
            //echo $search3;
        }
            
        $where['title']=array('like','%'.$search1.'%');
        $where['keyword']=array('like','%'.$search2.'%');
        $where['state']=array('like','%'.$search3.'%');
        //$res=M('content')->where($where)->select();
        //dump($res);
             
        $con=D('content');   
        $count = $con->where($where)->count();
        $page = $this->page($count, 6);
        $forms = $con ->where($where)->order("id DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("page", $page->show('Admin'));  
       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            $this->error('没有找到合适的数据');
        }
  	$this->display();    
        }
}
          




            

     

		
  

        









	   
		 
		 
	