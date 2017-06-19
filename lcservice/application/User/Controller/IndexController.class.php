<?php

/**
 * 会员注册登录
 */
namespace User\Controller;
use Common\Controller\HomebaseController;
class IndexController extends HomebaseController {
    //登录
	public function index() {
	    $id=I("get.id");
		$users_model=M("Users");
		
		$user=$users_model->where(array("id"=>$id))->find();
		
		if(empty($user)){
			$this->error("查无此人！");
		}
		$this->assign($user);
		$this->display(":index");
    }
    
    //登录
    public function user_indexs_init() {
        if(sp_is_user_login()){
           $this->display(':index');
        }else{
            $this->display('./');
        }
    }
    
    
    
    
    
    
    
    
    
    //修改登录用户信息初始化
    public function up_userinfo() {
        $id=I("get.id");
        $id = sp_get_current_userid();
        $users_model=M("Users");
    
        $user=$users_model->where(array("id"=>$id))->find();
    
        if(empty($user)){
            $this->error("查无此人！");
        }
        $this->assign($user);
        $this->display(":upuserinfo");
    
    }
    
    
    
    
    function is_login(){
    	if(sp_is_user_login()){
    	    $id = sp_get_current_userid();
    	    $Form   =   M('unit_service');
    	    // 首先构造子查询SQL
    	    $count = $Form->where("companyid=%d AND gqlx='1'",$id) ->count();
    	    $count2 = $Form->where("companyid=%d AND gqlx='2'",$id)->count();
    	    
    	    
    	    $forms = $Form
    	    ->field('cmf_unit_service.companyid AS companyid, cmf_users.enterprise AS enterprise, cmf_unit_service.servtitle AS servtitle, 
    	        cmf_unit_service.servtype AS servtype, cmf_unit_service.servstarttime AS starttime')
            ->join('Inner JOIN cmf_users ON cmf_users.id=cmf_unit_service.companyid ')
            ->where("cmf_unit_service.gqlx  = '2' ")->order(array("servstarttime" => "DESC"))->limit(5)->select();
    	    
    	    
    	    
    		$this->ajaxReturn(array("status"=>1,"user"=>sp_get_current_user(),"count"=>$count, "count2"=>$count2, "listss"=>$forms));
    	}else{
    		$this->ajaxReturn(array("status"=>0,"info"=>"此用户未登录！"));
    	}
    }

    //退出
    public function logout(){
    	$ucenter_syn=C("UCENTER_ENABLED");
    	$login_success=false;
    	if($ucenter_syn){
    		include UC_CLIENT_ROOT."client.php";
    		echo uc_user_synlogout();
    	}
    	session("user",null);//只有前台用户退出
    	redirect(__ROOT__."/");
    }
	
	public function logout2(){
    	$ucenter_syn=C("UCENTER_ENABLED");
    	$login_success=false;
    	if($ucenter_syn){
    		include UC_CLIENT_ROOT."client.php";
    		echo uc_user_synlogout();
    	}
		if(isset($_SESSION["user"])){
		$referer=$_SERVER["HTTP_REFERER"];
			session("user",null);//只有前台用户退出
			$_SESSION['login_http_referer']=$referer;
			$this->success("退出成功！",__ROOT__."/");
		}else{
			redirect(__ROOT__."/");
		}
    }

}
