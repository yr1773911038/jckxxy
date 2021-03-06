<?php

/**
 * 会员
 */
namespace Gzgl\Controller;
use Common\Controller\AdminbaseController;
use UploadFile;
class WorkeradminController extends AdminbaseController {

    function index(){  

        $Form   =   M('Worker');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form->where('')->order("xm asc,create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
  
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
        //print_r ($select_categorys);

   
        $Form1   =   D('Projects');

        $tree1 = new \Tree();
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $result1 = $Form1->order(array("id" => "ASC"))->select();

 
        foreach ($result1 as $r1) {
            $r1['selected'] = $r1['id'] == $parentid ? 'selected' : '';  
            $array1[] = $r1;
        }
        $str1 = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree1->init($array1);
        $select_categorys1 = $tree1->get_tree(0, $str1);
        $this->assign("select_categorys1", $select_categorys1);
        //print_r ($select_categorys);
        $this->display(); 
    }




    public function ld1(){

        //实例化数据表    
        $type = M('Projectsbd');


        $id1 = $_POST["id"];

        $data = $type -> where(array('projectid'=> $id1))->field('id,bdmc')->select();
        
        //$data = "<option value ='1111'>-城市-</option>";
        foreach ($data as $vo) {
            $data .= "<option ";
            if( $id == $vo['id'] ){
                $data .= " selected ";
            }
            $data .= " value ='" . $vo['bdmc'] . "'>" . $vo['bdmc'] . "</option>";
        }

        $this->ajaxReturn($data,"JSON");
    
        
    }

    function insert(){
        $Form   =   D('Worker');
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
        $Form   =   M('Worker');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Worker');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('data',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display();
 	}
     
    function edit($sfzh=0){

        $Worker   =   M('Worker');
        $data = $Worker->find($sfzh) ;
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

       
        $Form1   =  D('Projects');
        $tree1 = new \Tree();
        $ssprojectsid = $data["projectid"];  
        //$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
        $result1 = $Form1->order(array("id" => "ASC"))->select();

 
        foreach ($result1 as $r1) {
            $r1['selected'] = $r1['id'] == $ssprojectsid ? 'selected' : '';  
            $array1[] = $r1;
        }
        $str1 = "<option value='\$id' \$selected>\$spacer \$projectname</option>";
        $tree1->init($array1);
        $select_categorys1 = $tree1->get_tree(0, $str1);
        $this->assign("select_categorys1", $select_categorys1);
        //print_r ($select_categorys);

      
        $this->display(); 

    }


    function update(){
        $Form   =   D('Worker');
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
         $Form   =   M('Worker');
       
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

        $this->display();
    }
    
    function importExcelSave(){
        

         if (!empty($_FILES)) { 
            
           $allowExts= array('xlsx','xls');
           $savePath = './Public/upload/';
           $saveRule ='time';
             
            $companyid= I("post.companyid");
            $companyname= I("post.companyname");

            if(empty($companyid)){
                 $this->error("请选择所在公司");
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
                $Worker   =   M('Worker');
                
                for($i=2;$i<=$highestRow;$i++)
                {   
                   $xm = $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();  //姓名
                   if (!empty($xm)){
                        $sfzh = $objPHPExcel->getActiveSheet()->getCell("B".$i)->getValue();//身份证号 
                        $xb = $objPHPExcel->getActiveSheet()->getCell("C".$i)->getValue();//性别
                        $dh = $objPHPExcel->getActiveSheet()->getCell("D".$i)->getValue();//电话
                        $birthday = $objPHPExcel->getActiveSheet()->getCell("E".$i)->getValue();//生日
                        $birthday ==date("Y-m-d",$birthday);
                        $lxdz = $objPHPExcel->getActiveSheet()->getCell("E".$i)->getValue();//联系地址
                        $data['xm'] = $xm;
                        $data['xb']=$xb=='男'?13:2;
                        $data['sfzh'] = $sfzh; 
                        $data['dh'] = $dh;
                        $data['birthday'] = $birthday;
                        $data['lxdz'] = $lxdz;
                        $data['companyid'] = $companyid;
                        $data['companyname'] = $companyname;


                        $result_find = $Worker->where(array('sfzh' => $sfzh))->find();
                        if (!$result_find){
                            $insertCount++;
                            $Worker->add( $data);
                        }else{
                             $updateCount++;
                            $Worker->save(); 
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
    
     function search($xm1='',$sfzh1='',$szgs1='',$szxm1='',$szbd1=''){
        $Worker   =   D('worker'); 

        $where['xm'] = array('like','%'.$xm1.'%');
        $where['sfzh'] = array('like','%'.$sfzh1.'%');
        $where['companyname'] = array('like','%'.$szgs1.'%');
        $where['projectname'] = array('like','%'.$szxm1.'%');
        $where['bdmc'] = array('like','%'.$szbd1.'%');
        $info = $Worker -> where($where) -> select();
        
        //输出查询结果
       

        $this -> assign('lists', $info);
        $this -> display('index');     
    }
    //查询数据
    // function search($xm1=''){
    //     $Worker   =   D('Worker'); 

    //     $where['xm'] = array('like','%'.$xm1.'%');
    //     $info = $Worker -> where($where) -> select();
        
    //     //输出查询结果
    //     $this -> assign('xm1', $xm1);
    //     $this -> assign('lists', $info);
    //     $this -> display('index');     
    // }
   /** 
    //查询数据
    function search2($sfzh1=''){
        $Worker   =   D('Worker'); 
        
        $where['sfzh'] = array('like','%'.$sfzh1.'%');
        $info = $Worker -> where($where) -> select();
        
        //输出查询结果
        $this -> assign('sfzh1', $sfzh1);
        $this -> assign('lists', $info);
        $this -> display('index');     
    }
    
    //查询数据
    function search3(){
        $Worker   =   D('Worker'); 
        //拼接搜索条件
        $condition = "0";
        if(!empty($xm)){
            $condition = $condition ."and xm like '%".$xm."%'";
        }
        if(!empty($sfzh)){
            $condition = $condition ."and sfzh = '".$sfzh."'";
        }
        $info = $Worker -> where($condition)->limit($page->firstRow.','.$page->listRows)->select();
        //$where['xm'] = array('like','%'.$xm1.'%');
        //$info = $Worker -> where($where) -> select();
        
        //输出查询结果
        $this -> assign('xm', xm);
        $this -> assign('sfzh', sfzh);
        $this -> assign('lists', $info);
        $this -> display('index');     
    }
**/

}
