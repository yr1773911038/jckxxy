<?php
namespace Register\Controller;
use Common\Controller\HomebaseController;
class RegistController extends HomebaseController {
    //首页
	public function index() {
	    //$this->display('./themes/simplebootx/Register/register.html');
	    $this->display();
    }
}