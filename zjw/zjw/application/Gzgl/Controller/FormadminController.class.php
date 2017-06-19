<?php

/**
 * 会员
 */
namespace Gzgl\Controller;
use Common\Controller\AdminbaseController;
class FormadminController extends AdminbaseController {
    function add(){
    	$this->display();
    }

    function insert(){
        $Form   =   D('Form');
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
        $Form   =   M('Form');
        // 删除数据
        $data =   $Form->delete($id);
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
	    $Form   =   M('Form');
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
        $Form   =   M('Form');
        $this->assign('vo',$Form->find($id));
        $this->display();
    }


    function update(){
        $Form   =   D('Form');
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


    function query(){
        $Form   =   M('Form');
        $count = $Form->where('')->count();
        $page = $this->page($count, 20);
        $forms = $Form->order("create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

       if($forms) {
            $this->assign('forms',$forms);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }

        $this->display();
    }


}
