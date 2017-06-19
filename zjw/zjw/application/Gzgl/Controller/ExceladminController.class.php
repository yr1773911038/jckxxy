<?php

/**
 * 会员
 */
namespace Gzgl\Controller;
use Common\Controller\AdminbaseController;
use UploadFile;
class ExceladminController extends AdminbaseController {
    

    function import(){ 
       
      
       if (!empty($_FILES)) { 
            
           $allowExts= array('xlsx','xls');
           $savePath = './Public/upload/';
           $saveRule ='time';
            
 
         
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

                echo $highestRow;
                echo '<br />';
                 echo $highestColumn; 
                 echo '<br />';
                
                for($i=2;$i<=$highestRow;$i++)
                {   
                   $xm = $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();  //姓名
                   if (!empty($xm)){
                        $sfzh = $objPHPExcel->getActiveSheet()->getCell("B".$i)->getValue();//身份证号 
                        $xb = $objPHPExcel->getActiveSheet()->getCell("C".$i)->getValue();//性别
                        $dh = $objPHPExcel->getActiveSheet()->getCell("D".$i)->getValue();//电话
                        $birthday = $objPHPExcel->getActiveSheet()->getCell("E".$i)->getValue();//生日
                        $lxdz = $objPHPExcel->getActiveSheet()->getCell("E".$i)->getValue();//联系地址
                        
                        
                        header("Content-type: text/html; charset=utf-8"); 
                        echo "第" . $i . "条：" . $xm . ',' .$sfzh . ',' .$xb. ',' .$dh. ',' .$birthday. ',' .$lxdz;       
                        echo '<br />';
                    }
         
                }  
                 $this->success('导入成功！');
        }else
            {
                $this->error("请选择上传的文件");
            }   
       
    }




    function index(){ 
        $this->display();
    }


}
