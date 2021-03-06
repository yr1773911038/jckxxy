<?php
namespace Gzgl\Controller;
use Common\Controller\AdminbaseController;
use UploadFile;
class StatisticsController extends AdminbaseController {

    function index(){  	
			
		$where_ands=array("post_type=2 and post_status=1");
		$fields=array(
				'start_time'=> array("field"=>"gzny","operator"=>">"),
				'end_time'  => array("field"=>"gzny","operator"=>"<"),
				'keyword'  => array("field"=>"dwqc","operator"=>"like"),
		);
		if(IS_POST){
				
			foreach ($fields as $param =>$val){
				if (isset($_POST[$param]) && !empty($_POST[$param])) {
					$operator=$val['operator'];
					$field   =$val['field'];
					$get=$_POST[$param];
					$_GET[$param]=$get;
					if($operator=="like"){
						$get="%$get%";
					}
					array_push($where_ands, "$field $operator '$get'");
				}
			}
		}else{
			foreach ($fields as $param =>$val){
				if (isset($_GET[$param]) && !empty($_GET[$param])) {
					$operator=$val['operator'];
					$field   =$val['field'];
					$get=$_GET[$param];
					if($operator=="like"){
						$get="%$get%";
					}
					array_push($where_ands, "$field $operator '$get'");
				}
			}
		}
		
		$where= join(" and ", $where_ands);	
		
		$users_obj=M();
		$sql="select a.id,a.dwqc,b.je,b.gzny from sp_org a
				inner join (
				select sum(je)as je,orgid,gzny from sp_pay
				group by orgid,gzny ) b on a.id=b.orgid ";
		$list = $users_obj->query($sql);

		//$count=$list->where($where)->count();
		//$page = $this->page($count, 20);
		
		//$posts=$this->posts_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->select();


		$users=array();
		foreach ($users_data as $u){
			$users[$u['id']]=$u;
		}
		$this->assign("users",$users);
		
		//$this->assign("Page", $page->show('Admin'));
		$this->assign("formget",$_GET);
		$this->assign("posts",$posts);
		$this->display();

    }
	function recyclebin(){
		$where_ands=array("post_type=2 and post_status=0");
		$fields=array(
				'start_time'=> array("field"=>"post_date","operator"=>">"),
				'end_time'  => array("field"=>"post_date","operator"=>"<"),
				'keyword'  => array("field"=>"post_title","operator"=>"like"),
		);
		if(IS_POST){
		
			foreach ($fields as $param =>$val){
				if (isset($_POST[$param]) && !empty($_POST[$param])) {
					$operator=$val['operator'];
					$field   =$val['field'];
					$get=$_POST[$param];
					$_GET[$param]=$get;
					if($operator=="like"){
						$get="%$get%";
					}
					array_push($where_ands, "$field $operator '$get'");
				}
			}
		}else{
			foreach ($fields as $param =>$val){
				if (isset($_GET[$param]) && !empty($_GET[$param])) {
					$operator=$val['operator'];
					$field   =$val['field'];
					$get=$_GET[$param];
					if($operator=="like"){
						$get="%$get%";
					}
					array_push($where_ands, "$field $operator '$get'");
				}
			}
		}
		
		$where= join(" and ", $where_ands);
		
		$count=$this->posts_model->where($where)->count();
		$page = $this->page($count, 20);
		
		$posts=$this->posts_model->where($where)->limit($page->firstRow . ',' . $page->listRows)->select();
		
		$users_obj=M();
		$sql="select a.id,a.dwqc,b.je,b.gzny from sp_org a
				inner join (
				select sum(je)as je,orgid,gzny from sp_pay
				group by orgid,gzny ) b on a.id=b.orgid ";
		$list = $users_obj->query($sql);
		$users=array();
		foreach ($users_data as $u){
			$users[$u['id']]=$u;
		}
		$this->assign("users",$users);
		
		$this->assign("Page", $page->show('Admin'));
		$this->assign("formget",$_GET);
		$this->assign("posts",$posts);
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
            $gzny= I("post.gzny");



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
    


}
