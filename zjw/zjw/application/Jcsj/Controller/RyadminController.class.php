<?php
/* 
 *会员
 */
namespace Jcsj\Controller;
use Common\Controller\AdminbaseController;
class RyadminController extends AdminbaseController{
    
    function index(){     
        $Form   =   M('Projectsry'); 
 	$arrayWhere= '';        
        $count = $Form->where($arrayWhere)->count();
        $page = $this->page($count, 10);
        $forms = $Form->where($arrayWhere)->order("id DEBC")->limit($page->firstRow . ',' . $page->listRows)->select();     
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }
   
  	$this->display();
    }
       
      function insert(){
 	$Form   =   D('Projectsry'); 
     
        if($Form->create()) {
            $result =   $Form->add();
            if($result) {
                $this->success('数据添加成功！');
            }else{
                $this->error('数据添加错误！');
            }
        }else{
            $this->error($Form->getError());
        } 
     }
    
//      function insert(){
//
//      $Form   =   D('Projectsbd');
//      $Forms   =  D('Projectsry');
//        if($Form->create()) {
//            $result =   $Form->add();
//            if($result) {
//                if($Forms->create()) {
//                    $result1 =   $Forms->add();
//                    if($result1) {
//                        $this->success('数据添加成功！');
//                    }else{
//                        $this->error('数据添加错误！');
//                    }
//                }else{
//                    $this->error($Form->getError());
//                }
//            }else{
//                $this->error('数据添加错误！');
//            }
//        }else{
//            $this->error($Form->getError());
//        }
//    }

    
    function add(){
        $Form   =   D('Projectsry');
        
        $this->display(); 
    }
    
    
    function edit($id=0){
        $Form   =   M('Projectsry');
        // 读取数据
        $data = $Form->find($id);
        if($data) {
	        $this->assign('vo',$data);// 模板变量赋值
        }else{
	        $this->error('数据错误');
        }
           $this->display(); 
    }
		
		 
	function update(){

                $id = $_POST['id'];
		$rylb = $_POST['rylb'];  
		$name = $_POST['name'];		
		$lxfs = $_POST['lxfs'];
		$ry_status = $_POST['ry_status'];
		$projectid =  $_POST['projectid'];
		$User = M("Projectsry"); // 实例化User对象
		$data = array('rylb'=>$rylb,'name'=>$name,'lxfs'=>$lxfs,'projectid'=>$projectid,'ry_status'=>$ry_status);
		$User-> where('id='.$id)->setField($data);
                
		if($User) {
                $this->success('操作成功！');
            }else{
                $this->error('写入错误！');
            } 



//	       $Form = M('Projectsry');
//	       if(!$Form->create()) {
//	         $result = $Form->save();
//	            if($result) {
//	               $this->success('操作成功！');
//	            }else{
//	               $this->error($Form.'1');
//				}
//	       }else{
//	            $this->error($Form->getError());
//	        }
	  }


    
    function read($id=0){
	    $Form   =   M('Projectsry');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('data',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display();
 	}
        
    function delete($id=0){
        $Form   =   M('Projectsry');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }    
} 

