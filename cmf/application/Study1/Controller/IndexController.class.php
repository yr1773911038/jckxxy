<?php
namespace Study1\Controller; 
use Common\Controller\AdminbaseController;  

/**
参考链接 
CRUD 操作 
http://blog.csdn.net/mengyun00/article/details/7788747
**/
class IndexController extends AdminbaseController {
    public function index(){
        //$this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px } a,a:hover,{color:blue;}</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>版本 V{$Think.version}</div><script type="text/javascript" src="http://ad.topthink.com/Public/static/client.js"></script><thinkad id="ad_55e75dfae343f5a1"></thinkad><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');

	$study1   =   M('Study1');   //实例化study1对象

 	$arrayWhere= '';
        
        $count = $study1->where($arrayWhere)->count();

        $page = $this->page($count, 10);
        $forms = $study1->where($arrayWhere)->order("id DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }
  	$this->display();
        

    }

      public function insert(){

 		$Form   =   D('Study1');
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

      public function save(){
      	 $Form   =   D('Study1');
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


     public function add(){
     	$this->display();
     }

      public function edit($id=0){

      	 $Form   =   M('Study1');
	    // 读取数据
	    $data =   $Form->find($id);
	    if($data) {
	        $this->assign('vo',$data);// 模板变量赋值
	    }else{
	        $this->error('数据错误');
	    }
	    $this->display(); 
     }
     
}