<?php

/**
 * 
 * PHP version 5.6.x | 7.x | 8.x
 * 
 * @category Modules
 * @package WHMCS
 * @author Pejman Kheyri <pejmankheyri@gmail.com>
 * @copyright 2021 All rights reserved.
 */

include( dirname( __FILE__ ) . '/functions.php' );
 
class Poll {
			
	/**
	* @var string $dbhost dbhost
	*/
	protected $dbhost = 'localhost';
	
	/**
	* @var string $dbusername db username
	*/
	protected $dbusername = ''; // your WHMCS database username
	
	/**
	* @var string $dbpassword db password
	*/
	protected $dbpassword = ''; // your WHMCS database password

	/**
	* @var string $dbname db name
	*/
	protected $dbname = ''; // your WHMCS database name
	
	/**
	* @var string $message_code_1 message code 1
	*/
	public $message_code_1 = 'صف پیام ها خالی است و پیام جدیدی وجود ندارد';

	/**
	* @var string $message_code_3 message code 3
	*/
	public $message_code_3 = 'وضعیت حالت های استردادی به لغو شده تغییر یافت';
	
	/**
	* @var string $message_code_4 message code 4
	*/
	public $message_code_4 = 'وضعیت حالت های استردادی به لغو شده تغییر یافت اما اطلاعات در جدول صف کارها افزوده نشد';
	
	/**
	* @var string $message_code_5 message code 5
	*/
	public $message_code_5 = 'اطلاعات دامنه در پایگاه داده بروزرسانی شد';
	
	/**
	* @var string $message_code_6 message code 6
	*/
	public $message_code_6 = 'خطایی در دریافت اطلاعات دامنه بوجود آمده است';
	
	/**
	* @var string $message_code_8 message code 8
	*/
	public $message_code_8 = 'اطلاعات تغییر یافته شناسه کابر در جدول درخواست ذخیره شد';
	
	/**
	* @var string $message_code_9 message code 9
	*/
	public $message_code_9 = 'کد وجود یا عدم وجود پیام دریافت نشد !';
	
	/**
	* @var string $message_code_10 message code 10
	*/
	public $message_code_10 = 'حالت های HolderChangeApproved و Rejected وجود ندارند';
	
	/**
	* @var string $message_code_11 message code 11
	*/
	public $message_code_11 = 'حالت های Rejected و HolderChangeApproved همزمان باز گردانیده شده اند !';
	
	/**
	* @var string $message_code_12 message code 12
	*/
	public $message_code_12 = 'ارسال و دریافت پیام با موفقیت انجام شد و اطلاعات ذخیره گردید';
	
	/**
	* @var string $message_code_13 message code 13
	*/
	public $message_code_13 = 'ارسال پیغام دریافت اطلاعات از سمت نیک با خطا مواجه شد';
	
	/**
	* @var string $message_code_14 message code 14
	*/
	public $message_code_14 = 'ذخیره گزارش با خطا مواجه شد';
	
	/**
	* get certificate and serverURL from irNicClass
	*
    * @return void
	*/
	public function __construct(){
		
		$irnic = new irNicClass();
		$this->certificate = $irnic->certificate;
		$this->EPP_SERVER_URL = $irnic->serverURL;
		$this->nictoken = $irnic->nictoken;
		$this->trid = $irnic->trid;
		
	}
	
	/**
	* connecting to database.
	*
    * @return string Indicates the connection status
	*/
	protected function connectionDB(){
		
		$dbconnect = mysqli_connect($this->dbhost, $this->dbusername, $this->dbpassword, $this->dbname);
		mysqli_set_charset($dbconnect,"utf8");
		return $dbconnect;
		
	}
	
	/**
	* sends request to irnic web server.
	*
	* @param string $xmlStr xml string
	* @var string $EPP_SERVER_URL EPP SERVER URL
	* @var string $certificate certificate
    * @throws Exception for send request to irnic web server.
    * @return string Indicates the request response from irnic
	*/
	public function request($xmlStr,$action) {
				
		$XML = stripslashes(trim($xmlStr));
		$EPP_SERVER_URL = $this->EPP_SERVER_URL;

		try{
			$USER_CERTIFICATE_FILE = dirname( __FILE__ ) . '/' . $this->certificate;
			$ch = curl_init();		
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch, CURLOPT_SSLCERT, $USER_CERTIFICATE_FILE);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
			curl_setopt($ch, CURLOPT_USERAGENT, "IRNIC_EPP_Client_Sample");
			curl_setopt($ch, CURLOPT_POST, false);
			curl_setopt($ch, CURLOPT_URL,"$EPP_SERVER_URL");
			curl_setopt($ch, CURLOPT_POSTFIELDS, $xmlStr);		
			
			$response = curl_exec( $ch );

			if (curl_errno( $ch ) !== 0) {
				$response = '
					<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" >
						<response>
							<result code="-1" >
								<msg>Connection error: ' . curl_error( $ch ) . '</msg>
							</result>
						</response>
					</epp>
				';
			}
			
			curl_close( $ch );
			$this->irNicLog($action, $XML, $response);
			return $response;
			
		} catch (Exeption $e) {
			
			echo 'Error SendMessage : '.$e->getMessage();
			
		}
		
	}

	/**
	* for log data to whmcs modules log
	*
	* @param string $action action name
	* @param string $reqstring request string
	* @param string $resdata response data
    * @return void
	*/
	public function irNicLog($action, $reqstring, $resdata) {
		
		$nictoken = $this->nictoken;
		$replacevars = array($nictoken);
		
		$requeststring = xml2ary($reqstring);
		$responsedata = xml2ary($resdata);
		if (function_exists('logModuleCall')) {
			logModuleCall('irnic',$action,$reqstring,$resdata,$resdata,$replacevars);
		}
		
	}
	
	/**
	* saves log data to database.
	*
	* @param string $int poll code
	* @param string $msgID nic message id
	* @param string $poll_index nic message index
	* @param string $poll_messages nic message text
	* @param string $poll_mess_code message code
    * @throws Exception for save log data to database.
    * @return boolean Indicates the log information
	*/
	public function log_polls($int,$msgID,$poll_index,$poll_messages,$respons_poll,$poll_mess_code){
		
		try{
			
			$now = date("Y-m-d H:i:s",time());
			$dbconnect = $this -> connectionDB();
			
			$query_insert_log = "INSERT INTO mod_irnic_poll(poll_code,msgID,poll_index,poll_messages,poll_xml,poll_mess_code,date_time) values('$int','$msgID','$poll_index','$poll_messages','$respons_poll','$poll_mess_code','$now') ";
			$insert_log =  mysqli_query($dbconnect,$query_insert_log)or die(mysqli_error($dbconnect));

			if($insert_log){
					
				$xml_Ack = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
				<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
				 <command>
				  <poll op="ack" msgID="'.$msgID.'"/>
				  <clTRID>'.$this->trid.'</clTRID>
				 </command>
				</epp>';

				$irnic = new irNicClass();
				$request_Ack = $this->request($xml_Ack,'Poll_Acknowledge');
				$respons_Ack = xml2ary($request_Ack);
				$resp_code_Ack = irNicClass::parseResCode($respons_Ack);

				if($resp_code_Ack == 1000){
					
					$poll_mess_code = '12';
					$poll_messages = $this->message_code_12;
					$query_insert_Ack = "INSERT INTO mod_irnic_poll(poll_code,msgID,poll_index,poll_messages,poll_xml,poll_mess_code,date_time) values('$int','$msgID','$poll_index','$poll_messages','$request_Ack','$poll_mess_code','$now') ";
					$insert_Ack =  mysqli_query($dbconnect,$query_insert_Ack)or die(mysqli_error($dbconnect));

				} else {
					
					$poll_mess_code = '13';
					$poll_messages = $this->message_code_13;
					$query_insert_Ack = "INSERT INTO mod_irnic_poll(poll_code,msgID,poll_index,poll_messages,poll_xml,poll_mess_code,date_time) values('$int','$msgID','$poll_index','$poll_messages','$request_Ack','$poll_mess_code','$now') ";
					$insert_Ack =  mysqli_query($dbconnect,$query_insert_Ack)or die(mysqli_error($dbconnect));

				}
				
				return true;
				
			} else {
				
				$poll_mess_code = '14';
				$poll_messages = $this->message_code_14;
				$query_insert_error = "INSERT INTO mod_irnic_poll(poll_code,msgID,poll_index,poll_messages,poll_xml,poll_mess_code,date_time) values('$int','$msgID','$poll_index','$poll_messages','$respons_poll','$poll_mess_code','$now') ";
				$insert_error =  mysqli_query($dbconnect,$query_insert_error)or die(mysqli_error($dbconnect));
				
				return false;
				
			}
		} catch (Exeption $e) {
			
			echo 'Error SendMessage : '.$e->getMessage();
			
		}
		
	}
	
	/**
	* sends poll request to irnic.
	*
    * @return poll_value[] An array of string objects
	*/
	public function Poll_Request(){
		
		$xml_poll = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <poll op="req"/>
		  <clTRID>'.$this->trid.'</clTRID>
		 </command>
		</epp>';

		$request_poll = $this->request($xml_poll,'Poll_Request');
		$respons_poll = xml2ary($request_poll);
		$resp_code_poll = irNicClass::parseResCode($respons_poll);
		$int = intval($resp_code_poll);
		
		@$poll_value[] = $respons_poll["epp"]["_c"]["response"]["_c"]["msgQ"]["_a"]["count"];
		$poll_value[] = $int;
		$poll_value[] = $respons_poll;
		$poll_value[] = $request_poll;

		return $poll_value;
		
	}
	
	/**
	* Query for Select Domain Rejected.
	*
    * @return string Indicates the Query for Select Domain Rejected
	*/
	public function QuerySelectDomainRejected($poll_domain_name){
		
		$dbconnect = $this -> connectionDB();
		$query_sel_domain_rej = "SELECT * FROM tbldomains WHERE (status = 'Pending Transfer' OR status = 'Active' OR status = 'Expired') AND domain = '$poll_domain_name' LIMIT 1";
		$select =  mysqli_query($dbconnect,$query_sel_domain_rej)or die(mysqli_error($dbconnect));
		return $select;
		
	}
	
	/**
	* Query for Update Domain Rejected.
	*
    * @return string Indicates the Query for Update Domain Rejected
	*/
	public function QueryUpdateDomainRejected($domain_id){
		
		$dbconnect = $this -> connectionDB();
		$query_up_domain_rej = "UPDATE tbldomains SET status = 'Cancelled' WHERE id = '$domain_id'";
		$update_rej =  mysqli_query($dbconnect,$query_up_domain_rej)or die(mysqli_error($dbconnect));
		return $update_rej;
		
	}
	
	/**
	* Query for Insert Domain Rejected.
	*
    * @return string Indicates the Query for Insert Domain Rejected
	*/
	public function QueryInsertDomainRejected($poll_domain_name){
		
		$now_Todo = date("Y-m-d",time());
		$dbconnect = $this -> connectionDB();
		$description = 'IRNIC Domain : '.$poll_domain_name.' Rejected';
		$query_insert_rej = "INSERT INTO tbltodolist(date,title,description,admin,status,duedate) values('$now_Todo','IRNIC_Rejected_Domain_Status','$description',0,'Pending','$now_Todo') ";

		$insert_rej =  mysqli_query($dbconnect,$query_insert_rej)or die(mysqli_error($dbconnect));
		return $insert_rej;
		
	}

	/**
	* Query for Insert Domain Rejected.
	*
    * @return string Indicates the Query for Insert Domain Rejected
	*/
	public function QueryInsertDomainNoRejectedNote($poll_domain_name,$poll_domain_note){
		
		$now_Todo = date("Y-m-d",time());
		$dbconnect = $this -> connectionDB();
		$title = 'IRNIC Domain : '.$poll_domain_name;
		$query_insert_rej = "INSERT INTO tbltodolist(date,title,description,admin,status,duedate) values('$now_Todo','$title','$poll_domain_note',0,'Pending','$now_Todo') ";

		$insert_rej =  mysqli_query($dbconnect,$query_insert_rej)or die(mysqli_error($dbconnect));
		return $insert_rej;
		
	}
	
	/**
	* Query for Select Domain Approved.
	*
    * @return string Indicates the Query for Select Domain Approved
	*/
	public function QuerySelectDomainApproved($poll_domain_name){
		
		$dbconnect = $this -> connectionDB();
		$query_sel_domain_app = "SELECT * FROM tbldomains WHERE status = 'Pending Transfer' AND domain = '$poll_domain_name' LIMIT 1";
		$select_app =  mysqli_query($dbconnect,$query_sel_domain_app)or die(mysqli_error($dbconnect));
		return $select_app;
		
	}
	
	/**
	* Query for Update Domain Approved.
	*
    * @return string Indicates the Query for Update Domain Approved
	*/
	public function QueryUpdateDomainApproved($domain_app_id){
		
		$dbconnect = $this -> connectionDB();
		$query_up_domain_app = "UPDATE tbldomains SET status = 'Active' WHERE id = '$domain_app_id'";
		$update_app =  mysqli_query($dbconnect,$query_up_domain_app)or die(mysqli_error($dbconnect));
		return $update_app;
		
	}	
	
	/**
	* Query for Update Additional Approved.
	*
    * @return string Indicates the Query for Update Additional Approved
	*/
	public function QueryUpdateAdditionalApproved($resp_info_holder,$domain_app_id){
		
		$dbconnect = $this -> connectionDB();
		$query_additional = "UPDATE tbldomainsadditionalfields SET value = '$resp_info_holder' WHERE domainid = '$domain_app_id' AND name = 'nichandle'";
		$update_additionl =  mysqli_query($dbconnect,$query_additional)or die(mysqli_error($dbconnect));
		return $update_additionl;
		
	}	

	/**
	* Query for delete poll datas.
	*
    * @return string Indicates the Query for delete poll datas
	*/
	public function QueryDeletePeriodically(){
		
		$dbconnect = $this -> connectionDB();
		date_default_timezone_set('Asia/Tehran');
		
		$now = time();
		$period = 90*24*60*60;// 90 days
		$oldtime = intval($now)-intval($period);
		$oldtime2 = date('Y-m-d H:i:s',$oldtime);
		echo $oldtime2;
		//exit;
		$query_del = "DELETE FROM mod_irnic_poll WHERE date_time <= '$oldtime2' ";
		$delete_app =  mysqli_query($dbconnect,$query_del)or die(mysqli_error($dbconnect));
		return $delete_app;
		
	}

	/**
	* sends request for irnic and gets nichandle and response code.
	*
	* @param string $poll_domain_name domain name
    * @return response_information[] An array of string objects
	*/
	public function RequestDomainApproved($poll_domain_name){
		
		$xml_info = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <info>
		   <domain:info xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
			<domain:name>'.$poll_domain_name.'</domain:name>
			<domain:authInfo>
			 <domain:pw>'.$this->nictoken.'</domain:pw>
			</domain:authInfo>
		   </domain:info>
		  </info>
		  <clTRID>'.$this->trid.'</clTRID>
		 </command>
		</epp>';	
		
		$request_info = $this->request($xml_info,'Poll_Domain_Info');
		$respons_info = xml2ary($request_info);
		$resp_code_info = irNicClass::parseResCode($respons_info);
		
		$response_information[] = $respons_info;
		$response_information[] = $resp_code_info;
		
		return $response_information;
		
	}	
}
?>