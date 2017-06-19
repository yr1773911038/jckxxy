<?php
/* 
 *会员
 */
namespace Jcsj\Controller;
use Common\Controller\AdminbaseController;
class BdadminController extends AdminbaseController{
    
   
     function index(){  

        $Form   =   M('Projectsbd');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form
            ->field('sp_projectsbd.id,sp_projectsbd.bdmc,sp_projectsbd.projectid,sp_projectsbd.ssyhmc,sp_projectsbd.yhzh,sp_projectsbd.bd_status,
                sp_projects.projectname as xmmc')
            ->join('LEFT JOIN sp_projects ON sp_projectsbd.projectid=sp_projects.id')
            ->where('')->order("sp_projectsbd.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }

        $this->display();
    }

   
    
    function insert(){
 	$Form   =   D('Projectsbd'); 
     
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
        $Form1  =   D('Projectsbd');
        
        $Form   =   D('Org');
        import("Tree");
        $tree = new \Tree();
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $parentid = intval(I("get.parentid"));
        $result = $Form->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();

 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $parentid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str,0,'&nbsp;');
        $this->assign("select_categorys", $select_categorys);
        
        $this->display(); 
    }


     function yhzhadd($id=0){
        $Form   =   M('Projectsbd');
        // 读取数据
        $data = $Form->find($id);
        $this->assign('vo',$data);// 模板变量赋值

        $Form2   =  D('org');
        import("Tree");
        $tree2 = new \Tree();
        $sshymc = $vo["sshymc"];  
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $result2 = $Form2 -> where(array('dwlb = 2'))->order(array("id" => "ASC"))->select();

        foreach ($result2 as $r2) {
        $r2['selected'] = $r2['dwqc'] == $sshymc  ? 'selected' : '';  
        $array2[] = $r2;
        }
        $str2 = "<option value='\$dwqc' \$selected>\$spacer \$dwqc</option>";
        $tree2->init($array2);
        $select_categorys2 = $tree2->get_tree(0, $str2,0,'&nbsp;');
        $this->assign("select_categorys2", $select_categorys2);
        //print_r ($select_categorys);
       
           
         $this->display(); 
    }





       
    function edit($id=0){
        $Form   =   M('Projectsbd');
        // 读取数据
        $data = $Form->find($id);
        $this->assign('vo',$data);// 模板变量赋值

        $Form2   =  D('org');
        import("Tree");
        $tree2 = new \Tree();
        $sshymc = $vo["sshymc"];  
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $result2 = $Form2 -> where(array('dwlb = 2'))->order(array("id" => "ASC"))->select();

        foreach ($result2 as $r2) {
        $r2['selected'] = $r2['dwqc'] == $sshymc  ? 'selected' : '';  
        $array2[] = $r2;
        }
        $str2 = "<option value='\$dwqc' \$selected>\$spacer \$dwqc</option>";
        $tree2->init($array2);
        $select_categorys2 = $tree2->get_tree(0, $str2,0,'&nbsp;');
        $this->assign("select_categorys2", $select_categorys2);
        //print_r ($select_categorys);
       
	       
         $this->display(); 
    }
		
		 

     function update(){
        $Form   =   D('Projectsbd');
        if($Form->create()) {
            $result =   $Form->save();
            if($result) {
                $this->success('操作成功！');
            }else{
                $this->error('写入错误！');
            }
        }else{
            $this->error($Form->getError());
        }
    }
	/*function update(){

        $id = $_POST['id'];
		$bdmc = $_POST['bdmc'];  
		$ssyhmc = $_POST['ssyhmc'];
		$yhzh = $_POST['yhzh'];
		$bd_status = $_POST['bd_status'];
		$projectid =  $_POST['projectid'];             
		$User = M("Projectsbd"); // 实例化User对象
		$data = array('bdmc'=>$bdmc,'ssyhmc'=>$ssyhmc,'yhzh'=>$yhzh,'projectid'=>$projectid,'bd_status'=>$bd_status);
		$User-> where('id='.$id)->setField($data);
                
                if($User) {
                     $this->success('操作成功！');
                }else{
                     $this->error('写入错误！');
                } 
	
//            $Form   =   D('Projectsbd');
//            if($Form->create()) {
//                $result =   $Form->save();
//                if($result) {
//                    $this->success('操作成功！');
//                }else{
//                    $this->error('写入错误！');
//                }
//            }else{
//                $this->error($Form->getError());
//            }
        }*/


    
    function read($id=0){
 	    $Form   =   M('Projectsbd');
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
        $Form   =   M('Projectsbd');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }    
} 