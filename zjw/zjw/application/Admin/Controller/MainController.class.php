<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class MainController extends AdminbaseController {
	
	function _initialize() {
	}


    function index(){  

        $Form   =   M('Projectsbd');
        $count = $Form->where('')->count();
        //$aar = new stdClass(); 
        $aar1 = 'yhzh is NULL';
        $aar ='yhzh = ""';
        $page = $this->page($count, 10);
        $forms = $Form
            ->field('sp_projectsbd.id,sp_projectsbd.bdmc,sp_projectsbd.projectid,sp_projectsbd.ssyhmc,sp_projectsbd.yhzh,sp_projectsbd.bd_status,
                sp_projects.projectname as xmmc')
            ->join('LEFT JOIN sp_projects ON sp_projectsbd.projectid=sp_projects.id')
            ->where($aar)->order("sp_projectsbd.id")->limit($page->firstRow . ',' . $page->listRows)->select();
        $forms1 = $Form
            ->field('sp_projectsbd.id,sp_projectsbd.bdmc,sp_projectsbd.projectid,sp_projectsbd.ssyhmc,sp_projectsbd.yhzh,sp_projectsbd.bd_status,
                sp_projects.projectname as xmmc')
            ->join('LEFT JOIN sp_projects ON sp_projectsbd.projectid=sp_projects.id')
            ->where($aar1)->order("sp_projectsbd.id")->limit($page->firstRow . ',' . $page->listRows)->select();

        $this->assign("page", $page->show('Admin'));  
        $formss = array_merge($forms,$forms1);//两数组合并

       if($formss) {
            $this->assign('lists',$formss);// 模板变量赋值
        }else{
            $this->error('数据错误');
        }

        $this->display();
    }

   

    public function index_bzj(){
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


     public function index_qt(){
        
        $Form   =   M('Visits');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form->where('visit_status!=1')->order("create_time DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
        
        $this->assign("page", $page->show('Admin'));  

        if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            //$this->error('数据错误');
        }

        $this->display();
    }
     
    // function index_xm(){     
    //     $Form   =   M('Projectsbd'); 
    //     $arrayWhere= '';        
    //     $count = $Form->where($arrayWhere)->count();
    //     $page = $this->page($count, 10);
    //     $forms = $Form->where($arrayWhere)->order("id DEBC")->limit($page->firstRow . ',' . $page->listRows)->select();     
    //     $this->assign("page", $page->show('Admin'));  

    //    if($forms) {
    //         $this->assign('lists',$forms);// 模板变量赋值
    //     }else{
    //         $this->error('数据错误');
    //     }
   
    // $this->display();
    // }









}