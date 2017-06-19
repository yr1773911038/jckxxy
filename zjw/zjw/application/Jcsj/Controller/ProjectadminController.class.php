<?php

/**
 * 会员
 */
namespace Jcsj\Controller;
use Common\Controller\AdminbaseController;
class ProjectadminController extends AdminbaseController {
    
    function index(){  

        $Form   =   M('Projects');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form
            ->field('sp_projects.id,sp_projects.projectname,sp_projects.ssyhid,sp_projects.ssdwid,sp_projects.sgfid,
                sp_company.dwqc as jsfmc,sp_org.dwqc as ssyhmc,sp_construction.dwqc as sgfmc,
                sp_projects.xmjj,sp_projects.xm_status,sp_org.area as ssqymc,sp_projects.xmzh,
                sp_projects.grsl,sp_projects.zj,sp_projects.xmkssj')
            ->join('LEFT JOIN sp_org ON sp_org.id=sp_projects.ssyhid')
            ->join('LEFT JOIN sp_company ON sp_company.id = sp_projects.ssdwid')
            ->join('LEFT JOIN sp_construction ON sp_construction.id = sp_projects.sgfid')
            ->where('')->order("sp_projects.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
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
        
        //所属区域树
        $Form1   =  D('Org');
        import("Tree1");
        $tree1 = new\Tree();
        $result1 = $Form1->order(array("pxxh" => "ASC"))->select();
        
        foreach ($result1 as $r1) {
            $r1['selected'] = $r1['id'] == $parentid ? 'selected' : '';  
            $array1[] = $r1;
        }
        $str1 = "<option value='\$id' \$selected>\$spacer \$area</option>";
        $tree1->init($array1);
        $select_area = $tree1->get_tree(0, $str1,0,'&nbsp;');
        $this->assign("select_area", $select_area);
        //print_r($select_area);
        
        //建设单位树
        $Form2   =   D('Company');
        import("Tree2");
        $tree2 = new \Tree();
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        //$parentid = intval(I("get.parentid"));
        //$result = $Form->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();
        $result2 = $Form2->order(array("pxxh" => "ASC"))->select();

 
        foreach ($result2 as $r2) {
            $r2['selected'] = $r2['id'] == $parentid ? 'selected' : '';  
            $array2[] = $r2;
        }
        $str2 = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree2->init($array2);
        $select_company = $tree2->get_tree(0, $str2,0,'&nbsp;');
        $this->assign("select_company", $select_company);

        //施工单位树
        $Form3   =   D('Construction');
        import("Tree3");
        $tree3 = new \Tree();
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        //$parentid = intval(I("get.parentid"));
        //$result = $Form->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();
        $result3 = $Form3->order(array("pxxh" => "ASC"))->select();
 
        foreach ($result3 as $r3) {
            $r3['selected'] = $r3['id'] == $parentid ? 'selected' : '';  
            $array3[] = $r3;
        }
        $str3 = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree3->init($array3);
        $select_construction = $tree3->get_tree(0, $str3,0,'&nbsp;');
        $this->assign("select_construction", $select_construction);
        //print_r($select_construction);

        $this->display(); 
    }

    //添加标段及项目联系人
    function showpage(){
        
                $_GET['id']=$_GET['id'];
		$this->display('edit');
                
	}
    function insert(){
        $Form   =   D('Projects');
        if($Form->create()) {
            $result =   $Form->add();
            if($result) {
                //$this->success('',U('projectadmin/showpage'));//跳转到添加标段、联系人页面
                $this->success('数据添加成功！'.$result,leuu('projectadmin/showpage',array('id'=>$result)));//跳转到添加标段、联系人页面，并传出projectsid
            }else{
                $this->error('数据添加错误！');
            } 
        }else{
            $this->error($Form->getError());
        }
    }

    

     function delete($id=0){
        
        $Form   =   M('Projects');
        $data = $Form->find($id) ;
        // 删除数据
        $data1 =   $Form->delete($id);
        $data2=  M('Projectsbd')->where(array("projectid" => $data["id"]))->delete();
        $data3=  M('Projectsry')->where(array("projectid" => $data["id"]))->delete();
        
        if($data1) {           
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }
 
     
    function edit($id=0){

        $Company   =   M('Projects');
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

        //所属区域树
        $Form1   =  D('Org');
        import("Tree1");
        $tree1 = new\Tree();
        $result1 = $Form1->order(array("pxxh" => "ASC"))->select();
        
        foreach ($result1 as $r1) {
            $r1['selected'] = $r1['id'] == $parentid ? 'selected' : '';  
            $array1[] = $r1;
        }
        $str1 = "<option value='\$id' \$selected>\$spacer \$area</option>";
        $tree1->init($array1);
        $select_area = $tree1->get_tree(0, $str1,0,'&nbsp;');
        $this->assign("select_area", $select_area);

        //建设单位树
        $Form2   =   D('Company');
        import("Tree2");
        $tree2 = new \Tree();
        $parentid = $data["ssdwid"];  
        $result2 = $Form2->order(array("pxxh" => "ASC"))->select();        
        foreach ($result2 as $r2) {
            $r2['selected'] = $r2['id'] == $parentid ? 'selected' : '';  
            $array2[] = $r2;
        }
        $str2 = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree2->init($array2);
        $select_company = $tree2->get_tree(0, $str2,0,'&nbsp;');
        $this->assign("select_company", $select_company);

        //施工单位树
        $Form3   =   D('Construction');
        import("Tree3");
        $tree3 = new \Tree();
        ////$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        //$parentid = intval(I("get.parentid"));
        //$result = $Form->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();
        $result3 = $Form3->order(array("pxxh" => "ASC"))->select();
        $parentid = $data["sgfid"];  
        foreach ($result3 as $r3) {
            $r3['selected'] = $r3['id'] == $parentid ? 'selected' : '';  
            $array3[] = $r3;
        }
        $str3 = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree3->init($array3);
        $select_construction = $tree3->get_tree(0, $str3,0,'&nbsp;');
        $this->assign("select_construction", $select_construction);
        
      //标段、人员修改  
        $info1 = M("Projectsbd")->where(array("projectid" => $data["id"]))->select();
        $info2 = M("Projectsry")->where(array("projectid" => $data["id"]))->select();
        
        $this->assign('list_bd',$info1);
        $this->assign('list_ry',$info2);
        

        $this->display(); 

    }


    function update(){
        $Form   =   D('Projects');
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
 
  
    function read($id=0){

        $Company   =   M('Projects');
        $data = $Company->find($id) ;
        
     
        $sgfbzjModel   =   M('Sgfbzj'); 
        $sgfbzjList = $sgfbzjModel->where(array("projectid" => $data["id"]))->order("id")->select();
        $this->assign('voSgfbzj',$sgfbzjList); 

        $jsfbzjModel   =   M('Jsfbzj'); 
        $jsfbzjList = $jsfbzjModel->where(array("projectid" => $data["id"]))->order("id")->select();
        $this->assign('voJsfbzj',$jsfbzjList); 

        
      //读取标段、人员  
        $info1 = M("Projectsbd")->where(array("projectid" => $data["id"]))->select();
        $info2 = M("Projectsry")->where(array("projectid" => $data["id"]))->select();

        $this->assign('list_bd',$info1);
        $this->assign('list_ry',$info2);
        
        $this->assign('vo',$data); 

        //var_dump($info2);
        $this->display(); 

    }

    
    //查询数据
    function search($projectname1=''){
        $Projects   =   D('Projects'); 
        
        $where['projectname'] = array('like','%'.$projectname1.'%');
        $info = $Projects -> where($where) -> select();
        
        //输出查询结果
        $this -> assign('projectname1', $projectname1);
        $this -> assign('lists', $info);
        $this -> display('index');     
    }

}
