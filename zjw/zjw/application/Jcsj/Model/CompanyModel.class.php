<?php
namespace Jcsj\Model;
use Common\Model\CommonModel;
class CompanyModel extends CommonModel{
 
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}

		 // 定义自动验证
    protected $_validate    =   array(
        array('dwqc','require','单位名称必须'), 
        array('ssyhid','require','所属银行必须'),
     );
    // 定义自动完成
    protected $_auto    =   array(
        //array('create_time','time',1,'function'),
        array('create_ip','get_client_ip',1,'function'),
        array('create_username','get_current_admin_id',1,'function'), 
        array('dwjc','dwqc',1,'field'),
    );

   


}