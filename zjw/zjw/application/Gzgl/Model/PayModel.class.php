<?php
namespace Gzgl\Model;
use Common\Model\CommonModel;
class PayModel extends CommonModel{
 
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}

		 // 定义自动验证
    protected $_validate    =   array(
        array('xm','require','姓名必须'), 
        array('sfzh','require','身份证号必须'), 
        array('kh','require','卡号必须'),  
        array('fkrq','require','发卡日期必须'), 
        array('ssyhid','require','银行必须'), 
        array('companyid','require','所在公司必须'),
        array('projectid','require','所在项目必须'),
        array('je','require','金额必须'),  
     );
    // 定义自动完成
    protected $_auto    =   array(
        array('create_time','time',1,'function'),
        array('create_ip','get_client_ip',1,'function'),
        array('create_username','get_current_admin_id',1,'function'),  
    );

   


}