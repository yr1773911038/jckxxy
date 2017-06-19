<?php
namespace Gzgl\Model;
use Common\Model\CommonModel;
class StatisticsModel extends CommonModel{
 
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}

		 // 定义自动验证
    protected $_validate    =   array(
        array('id','require','编号'), 
        array('dwqc','require','单位全称'), 
        array('je','require','金额'),  
        array('gzny','require','工资年月')
     );
    // 定义自动完成
    protected $_auto    =   array(
        array('create_time','time',1,'function'),
        array('create_ip','get_client_ip',1,'function'),
        array('create_username','get_current_admin_id',1,'function'),  
    );

   


}