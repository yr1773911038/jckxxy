<?php

/**
 * 会员
 */
namespace Bzjgl\Controller;
use Common\Controller\AdminbaseController;
class JsfadminController extends AdminbaseController {

    function index(){  

        $Form   =   M('Jsfbzj');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form
            ->field('sp_jsfbzj.id,sp_jsfbzj.projectid,sp_jsfbzj.bdmc,sp_jsfbzj.yhzh,sp_jsfbzj.gczzj,sp_jsfbzj.bzjbl,sp_jsfbzj.bzjje,sp_jsfbzj.bzjjnsj,
                sp_jsfbzj.gzzfgsrq,sp_jsfbzj.nmggzffbl,sp_jsfbzj.nmggzffje,sp_jsfbzj.bz,sp_jsfbzj.shenhe,
                sp_projects.projectname as xmmc,sp_org.dwqc as ssyhmc,sp_company.yhzh as ssyhzh,sp_company.dwqc as jsfmc')
            ->join('LEFT JOIN sp_projects ON sp_jsfbzj.projectid=sp_projects.id')
			->join('LEFT JOIN sp_projectsbd ON sp_jsfbzj.bdmc=sp_projectsbd.bdmc')
            ->join('LEFT JOIN sp_org ON sp_org.id=sp_projects.ssyhid')
            ->join('LEFT JOIN sp_company ON sp_company.id = sp_projects.ssdwid')            
            ->where('')->order("sp_jsfbzj.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }

        $this->display();

    }

 /**
     * 获取菜单深度
     * @param $id
     * @param $array
     * @param $i
     */
    protected function _get_level($id, $array = array(), $i = 0) {
    
        if ($array[$id]['parentid']==0 || empty($array[$array[$id]['parentid']]) || $array[$id]['parentid']==$id){
            return  $i;
        }else{
            $i++;
            return $this->_get_level($array[$id]['parentid'],$array,$i);
        }
    
    }


    function add(){
        $Form   =   D('Projects');
        import("Tree");
        $tree = new \Tree();
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $result = $Form->order(array("id" => "ASC"))->select();

 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $parentid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str,0,'&nbsp;');
        $this->assign("select_categorys", $select_categorys);
        //print_r ($select_categorys);
        $this->display(); 
    }


	public function ld1(){

		//实例化数据表	
		$type = M('Projectsbd');


		$id1 = $_POST["id"];

		$data = $type -> where(array('projectid'=> $id1))->field('id,bdmc')->select();

        $aa = count($data,0);
        if ($aa == '1') {
            foreach ($data as $vo) {
                $data .= "<option >请选择</option>";
                $data .= "<option ";
                if( $id == $vo['id'] ){
                    $data .= " selected ";
                }
                $data .= " value ='" . $vo['bdmc'] . "'>" . $vo['bdmc'] . "</option>";
            }

        }else{
		
		//$data = "<option value ='1111'>-城市-</option>";
    		foreach ($data as $vo) {
    			$data .= "<option ";
    			if( $id == $vo['id'] ){
    				$data .= " selected ";
    			}
    			$data .= " value ='" . $vo['bdmc'] . "'>" . $vo['bdmc'] . "</option>";
    		}
        }
		$this->ajaxReturn($data,"JSON");
	
        
	}


	public function ld2(){
		//实例化数据表	
		$Form1 = M('Projectsbd');
		$bdmc = $_POST["bdmc"];
		// 构造查询条件
		$condition['bdmc'] = $bdmc;
		// 查询数据
		$list = $Form1->where($condition)->select();
		//print_r($list);  
        //echo $list['yhzh'];  
        foreach ($list as $vo1) {
            $list .= "<input ";
            $list .= "name='yhzh'";
            $list .= "type='hidden'";
            $list .= "value ='" . $vo1['yhzh'] . "'></input>";
            $list .=  $vo1['yhzh'] ;
        }
        //$list['yhzh']
		$this->ajaxReturn($list,"JSON");
       
	}


    function insert(){
        $Form   =   D('Jsfbzj');
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

     function delete($id=0){
         $Form   =   M('Jsfbzj');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Jsfbzj');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('data',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display();
 	}
     
    function edit($id=0){

        $Company   =   M('Jsfbzj');
        $data = $Company->find($id) ;
        $this->assign('vo',$data); 
 
        $Form   =   M('Projects');
        import("Tree");
        $tree = new \Tree(); 
        $parentid = $data["projectid"];  
        $result = $Form->order(array("id" => "ASC"))->select(); 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $parentid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str,0,'&nbsp;');
        $this->assign("select_categorys", $select_categorys);


        

        $this->display(); 

    }


    function update(){
        $Form   =   D('Jsfbzj');
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



}
