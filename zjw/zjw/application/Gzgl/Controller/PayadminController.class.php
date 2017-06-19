<?php

/**
 * 会员
 */
namespace Gzgl\Controller;
use Common\Controller\AdminbaseController;
use UploadFile;
class PayadminController extends AdminbaseController {

    function index(){  

        //$projectid = I("projectid");
        $Form   =   M('Pay');
        $count = $Form->where('')->count();
        // $count = $Form->where(array("projectid" => $projectid))->count();
        $page = $this->page($count, 10);
        // $forms = $Form->where(array("projectid" => $projectid))->order("create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
        $forms = $Form->where('')->order("create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            //$this->error('数据错误');
        }

        //  if(empty($projectid)){
        //      $this->display();
        // }else{
        //     $this->display('project_pay');
        // }
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

        $Form   =   D('Company');
        import("Tree");
        $tree = new \Tree(); 
        $result = $Form->where('')->order(array("pxxh" => "ASC"))->select();
         $parentid = intval(I("get.parentid"));
 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $parentid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str);
        $this->assign("select_categorys", $select_categorys);


        $tree_org = new \Tree(); 
        $Org   =   D('Org');
        $result_org = $Org->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();

         $parentid_org = intval(I("get.parentid"));
 
        foreach ($result_org as $r1) {
            $r1['selected'] = $r1['id'] == $parentid_org ? 'selected' : '';  
            $array_org[] = $r1; 
        }
        $str_org = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree_org->init($array_org);
        $select_org_categorys = $tree_org->get_tree(0, $str_org);
        $this->assign("select_org_categorys", $select_org_categorys);


        $tree_project = new \Tree(); 
        $Project   =   D('Projects');
        $result_project = $Project->order(array("id" => "ASC"))->select();

        
        foreach ($result_project as $r2) {
            $r2['selected'] = $r2['id'] == $parentid_org ? 'selected' : '';  
            $array_project[] = $r2; 
        }
        $str_project = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree_project->init($array_project);
        $select_project_categorys = $tree_project->get_tree(0, $str_project);
        $this->assign("select_project_categorys", $select_project_categorys);




        $this->display(); 
    }

    function insert(){
        $Form   =   D('Pay');
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
        $Form   =   M('Pay');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Pay');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('data',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display();
 	}
     
    function edit($payid=0){

        $Moneycard   =   M('Pay');
        $data = $Moneycard->find($payid) ;
        $this->assign('vo',$data); 
 
        $Form   =   M('Company');
        import("Tree");
        $tree = new \Tree(); 
        $sscompanyid = $data["companyid"];  
        $result = $Form->where('')->order(array("pxxh" => "ASC"))->select(); 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $sscompanyid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str);
        $this->assign("select_categorys", $select_categorys);


        $tree_org = new \Tree(); 
        $Org   =   D('Org');
        $result_org = $Org->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();

         $parentid_org = $data["orgid"];  ;
 
        foreach ($result_org as $r1) {
            $r1['selected'] = $r1['id'] == $parentid_org ? 'selected' : '';  
            $array_org[] = $r1; 
        }
        $str_org = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree_org->init($array_org);
        $select_org_categorys = $tree_org->get_tree(0, $str_org);
        $this->assign("select_org_categorys", $select_org_categorys);


        $tree_project = new \Tree(); 
        $parentid_projectid= $data["projectid"];  ;
        $Project   =   D('Projects');
        $result_project = $Project->order(array("id" => "ASC"))->select();

        
        foreach ($result_project as $r2) {
            $r2['selected'] = $r2['id'] == $parentid_projectid ? 'selected' : '';  
            $array_project[] = $r2; 
        }
        $str_project = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree_project->init($array_project);
        $select_project_categorys = $tree_project->get_tree(0, $str_project);
        $this->assign("select_project_categorys", $select_project_categorys);


        $this->display(); 

    }


    function update(){
        $Form   =   D('Pay');
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




function importExcel(){ 
       
       $Form   =   M('Company');
        import("Tree");
        $tree = new \Tree(); 
        $sscompanyid = $data["companyid"];  
        $result = $Form->where('')->order(array("pxxh" => "ASC"))->select(); 
        foreach ($result as $r) {
            $r['selected'] = $r['id'] == $sscompanyid ? 'selected' : '';  
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str);
        $this->assign("select_categorys", $select_categorys);


        $tree_org = new \Tree(); 
        $Org   =   D('Org');
        $result_org = $Org->where('parent_id>2')->order(array("pxxh" => "ASC"))->select();

         $parentid_org = $data["ssyhid"];  ;
 
        foreach ($result_org as $r1) {
            $r1['selected'] = $r1['id'] == $parentid_org ? 'selected' : '';  
            $array_org[] = $r1; 
        }
        $str_org = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree_org->init($array_org);
        $select_org_categorys = $tree_org->get_tree(0, $str_org);
        $this->assign("select_org_categorys", $select_org_categorys);

        
        
        $tree_project = new \Tree(); 
        $Project   =   D('Projects');
        $result_project = $Project->order(array("id" => "ASC"))->select();

        
        foreach ($result_project as $r2) {
            $r2['selected'] = $r2['id'] == $parentid_org ? 'selected' : '';  
            $array_project[] = $r2; 
        }
        $str_project = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree_project->init($array_project);
        $select_project_categorys = $tree_project->get_tree(0, $str_project);
        $this->assign("select_project_categorys", $select_project_categorys);


        $this->display();
    }
    
    function importExcelSave(){
        

         if (!empty($_FILES)) { 
            
           $allowExts= array('xlsx','xls');
           $savePath = './Public/upload/';
           $saveRule ='time';
             
            $companyid= I("post.companyid");
            $companyname= I("post.companyname"); 
            $ssyhid= I("post.ssyhid");
            $ssyhmc= I("post.ssyhmc");
            $gzny= I("post.gzny");

            $projectid= I("post.projectid");
            $projectname= I("post.projectname"); 



            if(empty($companyid)){
                 $this->error("请选择所在公司");
             }

              if(empty($ssyhid)){
                 $this->error("请选择所属银行");
             }


              if(empty($gzny)){
                 $this->error("工资月份必须");
             }
  
           $upload = new UploadFile('',$allowExts,'',$savePath ,$saveRule);
           
            if (!$upload->upload()) { 
                $this->error($upload->getErrorMsg());
            } else {
                $info = $upload->getUploadFileInfo();  
            }   
        
       
                vendor("PHPExcel.PHPExcel");

                $file_name=$info[0]['savepath'].$info[0]['savename'];
                $objReader = \PHPExcel_IOFactory::createReader('Excel5');
                $objPHPExcel = $objReader->load($file_name,$encode='utf-8');
                $sheet = $objPHPExcel->getSheet(0);
                $highestRow = $sheet->getHighestRow(); // 取得总行数
                $highestColumn = $sheet->getHighestColumn(); // 取得总列数

               // echo $highestRow;
               // echo '<br />';
              //   echo $highestColumn; 
               //  echo '<br />';

                $insertCount=0;
                $updateCount=0;
                $Pay   =   M('Pay');
                
                for($i=2;$i<=$highestRow;$i++)
                {   
                   $xm = $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();  //姓名
                   if (!empty($xm)){
                        $sfzh = $objPHPExcel->getActiveSheet()->getCell("B".$i)->getValue();//身份证号 
                        $kh = $objPHPExcel->getActiveSheet()->getCell("C".$i)->getValue();//卡号
                        $je = $objPHPExcel->getActiveSheet()->getCell("D".$i)->getValue();//金额
                        
                        $data['xm'] = $xm; 
                        $data['sfzh'] = $sfzh; 
                        $data['kh'] = $kh;
                        $data['je'] = $je;

                        $data['gzny'] = $gzny;
                        $data['orgid'] = $ssyhid;
                        $data['orgname'] = $ssyhmc;
                        $data['companyid'] = $companyid;
                        $data['companyname'] = $companyname;
                        $data['projectid'] = $projectid;
                        $data['projectname'] = $projectname;


                        $result_find = $Pay->where(array('kh' => $kh,'gzny' => $gzny))->find();
                        if (!$result_find){
                            $insertCount++;
                            $Pay->add( $data);
                        }else{
                             $updateCount++;
                            $Pay->save(); 
                        }

                       // header("Content-type: text/html; charset=utf-8"); 
                       // echo "第" . $i . "条：" . $xm . ',' .$sfzh . ',' .$xb. ',' .$dh. ',' .$birthday. ',' .$lxdz;       
                        //echo '<br />';
                    }
         
                }  
 
                 $this->success('导入成功！'."新增:" . $insertCount .",修改:" . $updateCount );
        }else
            {
                $this->error("请选择上传的文件");
            }   


  
    }
    
    //查询数据
    function search($xm1=''){
        $Pay = D('Pay');
        
        $where['xm'] = array('like','%'.xm1.'%');
        $info = $Pay ->where($where) -> select();
        
        $this -> assign('xm',$xm1);
        $this -> assign('lists',$info);
        $this -> display('index'); 
    }

}
