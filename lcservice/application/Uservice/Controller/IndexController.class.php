<?php
namespace Uservice\Controller;
use Common\Controller\HomebaseController;
class IndexController extends HomebaseController {
    
    //发布服务初始化
    public function index(){
        
        $Form   =   M('unit_service');
        $count = $Form->where('')->count();
        $page = $this->page($count, 10);
        $forms = $Form->where('')->order("servfabutime DESC")->limit($page->firstRow . ',' . $page->listRows)->select();
        
        $this->assign("page", $page->show('Admin'));
        
        if($forms) {
            $this->assign('lists',$forms);// 模板变量赋值
        }else{
            //$this->error('数据错误');
        }
        
       $this->display(':index');
        
    }
    
    //请求服务初始化
    public function req_service(){
        $this->display(':req_service');
    }
    
    //发布新服务
    public function add_fbservice(){
        $this->display(':addservice');
    }
    
    /**
     * 添加新服务
     */
    function addUnServices(){
        $service_model=M("unit_service");
        
        $data=array(
            'companyid' => sp_get_current_userid(),//所属企业
            'gqlx' => '1',//供求类型，1:供;2:求
            'servtitle' =>$_POST['servtitle'],//服务标题
            'servtype' =>$_POST['servtype'],//服务分类
            'servneirong' => $_POST['servneirong'],//服务内容
            'servfaburen' => sp_get_current_userid(),//服务发布人
            'servfabutime' => date("Y-m-d H:i:s"),//服务发布时间
            'servfangshi' => $_POST['servfangshi'],//服务方式
            'servshoufei' => $_POST['servshoufei'],//服务收费模式
            'servflow'=>$_POST['servflow'],//服务流程
        );
        $rst = $service_model->add($data);
        if($rst){
            $this->success("数据添加成功！",U("uservice/index/index"));
             
        }else{
            $this->error("数据添加失败！",U("uservice/index/add_fbservice"));
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}