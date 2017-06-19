<?php

/**
 * 会员
 */
namespace Bzjgl\Controller;
use Common\Controller\AdminbaseController;
class ShadminController extends AdminbaseController {

    function index(){  

        $Form   =   M('Jsfbzj');
        $count = $Form->where('shenhe="0"')->count();
        $page = $this->page($count, 10);

        $forms = $Form
            ->field('sp_jsfbzj.id,sp_jsfbzj.projectid,sp_jsfbzj.bdmc,sp_jsfbzj.yhzh,sp_jsfbzj.gczzj,sp_jsfbzj.bzjbl,sp_jsfbzj.bzjje,sp_jsfbzj.bzjjnsj,
                sp_jsfbzj.gzzfgsrq,sp_jsfbzj.nmggzffbl,sp_jsfbzj.nmggzffje,sp_jsfbzj.bz,
                sp_projects.projectname as xmmc,sp_org.dwqc as ssyhmc,sp_company.yhzh as ssyhzh,sp_company.dwqc as jsfmc')
            ->join('LEFT JOIN sp_projects ON sp_jsfbzj.projectid=sp_projects.id')
            ->join('LEFT JOIN sp_projectsbd ON sp_jsfbzj.bdmc=sp_projectsbd.bdmc')
            ->join('LEFT JOIN sp_org ON sp_org.id=sp_projects.ssyhid')
            ->join('LEFT JOIN sp_company ON sp_company.id = sp_projects.ssdwid')            
            ->where('shenhe="0"')->order("sp_jsfbzj.id")->limit($page->firstRow . ',' . $page->listRows)->select();
  
        $this->assign("page", $page->show('Admin'));  

  
        $this->assign('lists',$forms);// 模板变量赋值
       
        $this->display();

    }

      function shcg($id=0){
        //审核成功
         $Form   =   M('Jsfbzj');
        // 要修改的数据对象属性赋值
        $data['shenhe'] = '1';
        //审核通过
        $data =  $Form->where('id='.$id)->save($data); // 根据条件更新记录
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

     function shsb($id=0){
         //审核失败
         $Form   =   M('Jsfbzj');
        // 要修改的数据对象属性赋值
        $data['shenhe'] = '2';
        //审核未通过
        $data =  $Form->where('id='.$id)->save($data); // 根据条件更新记录
        if($data) {
            $this->success("保存成功！");
        }else{
            $this->error('保存失败');
        } 
    }

    function read($id=0){
        $Form   =   M('Jsfbzj');
        // 读取数据
        $data =   $Form->find($id);
        if($data) {
            $this->assign('data',$data);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }
        $this->display();
    }
     

}
