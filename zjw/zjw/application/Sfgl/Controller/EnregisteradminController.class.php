<?php

/**
 * 会员
 */
namespace Sfgl\Controller;
use Common\Controller\AdminbaseController;
use UploadFile;
class EnregisteradminController extends AdminbaseController {

    function index(){  

        $projectid = I("projectid");

        $Form   =   M('Visits');


        if(empty($projectid)){
            $arrayWhere= '';
        }else{
            $arrayWhere=  array("szxmid" => $projectid) ;
        }

        $count = $Form->where($arrayWhere)->count();

        $page = $this->page($count, 10);
        $forms = $Form->where($arrayWhere)->order("create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            //$this->error('数据错误');
        }

        if(empty($projectid)){
             $this->display();
        }else{
            $this->display('project_enregister'); 
        }
       

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

        //建筑单位
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


        //所在项目
        $tree_org = new \Tree(); 
        $projects   =   M('Projects');
        $result_org = $projects->where('')->order(array("xmkssj" => "ASC"))->select();

         $parentid_org = intval(I("get.parentid"));
 
        foreach ($result_org as $r1) {
            $r1['selected'] = $r1['id'] == $parentid_org ? 'selected' : '';  
            $array_org[] = $r1; 
        }
        $str_org = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree_org->init($array_org);
        $select_org_categorys = $tree_org->get_tree(0, $str_org);
        $this->assign("select_org_categorys", $select_org_categorys);



        //施工单位树
        $Form3   =   D('Construction'); 
        $tree3 = new \Tree();
        ////$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
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



        $this->display(); 
    }

    function insert(){
        $Form   =   D('Visits');
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
        $Form   =   M('Visits');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Visits');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('data',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display();
 	}
     
    function edit($kh=0){

        $Moneycard   =   M('Visits');
        $data = $Moneycard->find($kh) ;
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

         $parentid_org = $data["ssyhid"];  ;
 
        foreach ($result_org as $r1) {
            $r1['selected'] = $r1['id'] == $parentid_org ? 'selected' : '';  
            $array_org[] = $r1; 
        }
        $str_org = "<option value='\$id' \$selected>\$spacer \$dwqc</option>";
        $tree_org->init($array_org);
        $select_org_categorys = $tree_org->get_tree(0, $str_org);
        $this->assign("select_org_categorys", $select_org_categorys);

           //施工单位树
        $Form3   =   D('Construction'); 
        $tree3 = new \Tree();
        ////$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
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
        


        $this->display(); 

    }


    function update(){
        $Form   =   D('Visits');
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

            if(empty($companyid)){
                 $this->error("请选择所在公司");
             }

              if(empty($ssyhid)){
                 $this->error("请选择所属银行");
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
                $Moneycard   =   M('Moneycard');
                
                for($i=2;$i<=$highestRow;$i++)
                {   
                   $xm = $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();  //姓名
                   if (!empty($xm)){
                        $sfzh = $objPHPExcel->getActiveSheet()->getCell("B".$i)->getValue();//身份证号 
                        $kh = $objPHPExcel->getActiveSheet()->getCell("C".$i)->getValue();//卡号
                        $fkrq = $objPHPExcel->getActiveSheet()->getCell("D".$i)->getValue();//发卡日期 
                        
                        $data['xm'] = $xm; 
                        $data['sfzh'] = $sfzh; 
                        $data['kh'] = $kh;
                        $data['fkrq'] = $fkrq;

                        $data['ssyhid'] = $ssyhid;
                        $data['ssyhmc'] = $ssyhmc;
                        $data['companyid'] = $companyid;
                        $data['companyname'] = $companyname;


                        $result_find = $Moneycard->where(array('kh' => $kh))->find();
                        if (!$result_find){
                            $insertCount++;
                            $Moneycard->add( $data);
                        }else{
                             $updateCount++;
                            $Moneycard->save(); 
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
        $Visits   =   D('Visits'); 
        
        $where['xm'] = array('like','%'.$xm1.'%');
        $info = $Visits -> where($where) -> select();
        
        //输出查询结果
        $this -> assign('xm1', $xm1);
        $this -> assign('lists', $info);
        $this -> display('index');     
    }


}
