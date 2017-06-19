<?php
namespace Gzgl\Model;
use Common\Model\CommonModel;
class FormModel extends CommonModel{
 
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}

		 // 定义自动验证
    protected $_validate    =   array(
        array('title','require','标题必须'),
     );
    // 定义自动完成
    protected $_auto    =   array(
        array('create_time','time',1,'function'),
    );

   


}