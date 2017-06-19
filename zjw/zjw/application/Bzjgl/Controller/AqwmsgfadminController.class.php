<?php

/**
 * 会员
 */
namespace Bzjgl\Controller;
use Common\Controller\AdminbaseController;
class AqwmsgfadminController extends AdminbaseController {

    function index(){  

        $Form   =   M('Aqwmsgf');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form
            ->field('sp_aqwmsgf.id,sp_aqwmsgf.projectid,sp_aqwmsgf.gczzj,sp_aqwmsgf.bzjbl,sp_aqwmsgf.nmggzffbl,
                sp_projects.projectname as xmmc,sp_org.dwqc as ssyhmc,sp_company.yhzh as ssyhzh,sp_company.dwqc as jsfmc')
            ->join('LEFT JOIN sp_projects ON sp_aqwmsgf.projectid=sp_projects.id')
            ->join('LEFT JOIN sp_org ON sp_org.id=sp_projects.ssyhid')
            ->join('LEFT JOIN sp_company ON sp_company.id = sp_projects.ssdwid')            
            ->where('')->order("sp_aqwmsgf.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            //$this->error('数据错误');
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

    function insert(){
        $Form   =   D('Aqwmsgf');
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
         $Form   =   M('Aqwmsgf');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Aqwmsgf');
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

        $Company   =   M('Aqwmsgf');
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
        $Form   =   D('Aqwmsgf');
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
