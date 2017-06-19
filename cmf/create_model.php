<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');
//项目相对路径，不可更改
 
/**
 * 系统调试设置
 * 项目正式部署后请设置为false
 */
//define ( 'APP_DEBUG', true );

/**
 * 应用目录设置
 * 安全期间，建议安装调试完成后移动到非WEB目录
 */
//开启调试模式
define("APP_DEBUG", true);
//网站当前路径
define('SITE_PATH', dirname(__FILE__)."/");
//项目路径，不可更改
define('APP_PATH', SITE_PATH . 'application/');
//项目相对路径，不可更改
define('SPAPP_PATH',   SITE_PATH.'simplewind/');
//
define('SPAPP',   './application/');
//项目资源目录，不可更改
define('SPSTATIC',   SITE_PATH.'statics/');
//定义缓存存放路径
define("RUNTIME_PATH", SITE_PATH . "/data/runtime/");
//静态缓存目录
define("HTML_PATH", SITE_PATH . "/data/runtime/Html/");
//版本号
define("SIMPLEWIND_CMF_VERSION", 'X1.6.1');

define("THINKCMF_CORE_TAGLIBS", 'cx,Common\Lib\Taglib\TagLibSpadmin,Common\Lib\Taglib\TagLibHome');

 
// 绑定入口文件到Admin模块访问
define('BIND_MODULE','study');

 

/**
 * 引入核心入口
 * ThinkPHP亦可移动到WEB以外的目录
 */ 

require SPAPP_PATH.'Core/ThinkPHP.php';