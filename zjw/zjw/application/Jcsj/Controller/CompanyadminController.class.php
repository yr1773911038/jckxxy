<?php

/**
 * 会员
 */
namespace Jcsj\Controller;
use Common\Controller\AdminbaseController;
class CompanyadminController extends AdminbaseController {

    function index(){  

        $Form   =   M('Company');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form->field('sp_company.id,sp_company.dwqc,sp_company.dwjc,sp_company.yhzh,sp_company.content,sp_company.dw_status,sp_org.dwqc as ssyhmc')->join('LEFT JOIN sp_org on sp_company.ssyhid = sp_org.id')->where('')->order("sp_company.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
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
        //print_r ($select_categorys);
        $this->display(); 
    }

    function insert(){
        $Form   =   D('Company');
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
        $Form   =   M('Company');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Company');
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

        $Company   =   M('Company');
        $data = $Company->find($id) ;
        $this->assign('vo',$data); 
 
        $Form   =   M('Org');
        import("Tree");
        $tree = new \Tree(); 
        $parentid = $data["ssyhid"];  
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


    function update(){
        $Form   =   D('Company');
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

    
    //查询数据
    function search($dwqc1=''){
        $Company   =   D('Company'); 
        
        $where['dwqc'] = array('like','%'.$dwqc1.'%');
        $info = $Company -> where($where) -> select();
        
        //输出查询结果
        $this -> assign('dwqc1', $dwqc1);
        $this -> assign('lists', $info);
        $this -> display('index');     
    }
    

}
