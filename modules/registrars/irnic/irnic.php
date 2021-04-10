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

function irnic_getConfigArray() {
	$configarray = array(
		"nictoken" => array( "Type" => "text", "Size" => "20", "Description" => "token یا همان گذرواژه اتصال را وارد نمایید", ),
		"trid" => array( "Type" => "text", "Size" => "20", "Description" => "نام مخفف شرکت خود به لاتین جهت ثبت در کلیه درخواست ها" ),
		"test" => array( "Type" => "yesno", "Description" => "در صورتی که تمایل دارید کلیه عملکردها در سامانه آزمایشی انجام شود این قسمت را فعال نمایید.", ),
		'adminContact' => array( 'Type' => 'text', 'Size' => '20', 'Description' => 'شناسه نیک جهت ثبت به عنوان ادمین دامنه' ), 
		'technicalContact' => array( 'Type' => 'text', 'Size' => '20', 'Description' => 'شناسه نیک جهت ثبت به عنوان مسئول فنی دامنه' ), 
		'billingContact' => array( 'Type' => 'text', 'Size' => '20', 'Description' => 'شناسه نیک جهت ثبت به عنوان مسئول مالی دامنه' ), 
	);
	return $configarray;
}

function irnic_GetNameservers($params) {

	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	
	$irnic = new irNicClass();
	
	$req = $irnic->domain_info($domain_name);
	$resp = xml2ary($req);

	$resp_code = irNicClass::parseResCode($resp);

	if ($resp_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
	} else {
		$ns1det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][0]['_c']['domain:hostName']['_v'];
		$ns2det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][1]['_c']['domain:hostName']['_v'];
		$ns3det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][2]['_c']['domain:hostName']['_v'];
		$ns4det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][3]['_c']['domain:hostName']['_v'];
		$values['ns1'] = $ns1det;
		$values['ns2'] = $ns2det;
		if($ns3det){
			$values['ns3'] = $ns3det;
		}
		if($ns4det){
			$values['ns4'] = $ns4det;
		}
	}
	
	return $values;
}

function irnic_SaveNameservers($params) { 
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	$nichandle = $params['additionalfields']['nichandle'];
	$nicadmin = $params['additionalfields']['nicadmin'];
	$nictech = $params['additionalfields']['nictech'];
	$nicbill = $params['additionalfields']['nicbill'];

	if($nicadmin == ""){ $irnicadmin = $adminContact; } else { $irnicadmin = $nicadmin; }	
	if($nictech == ""){ $irnictech = $technicalContact; } else { $irnictech = $nictech; }	
	if($nicbill == ""){ $irnicbill = $billingContact; } else { $irnicbill = $nicbill; }

	$newns1 = $params['ns1'];
	$newns2 = $params['ns2'];
	$newns3 = $params['ns3'];
	$newns4 = $params['ns4'];

	$irnic = new irNicClass();
	
	$req = $irnic->domain_info($domain_name);
	$resp = xml2ary($req);
	$resp_code = irNicClass::parseResCode($resp);
	
	if ($resp_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
	} else {
		$ns1det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][0]['_c']['domain:hostName']['_v'];
		$ns2det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][1]['_c']['domain:hostName']['_v'];
		$ns3det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][2]['_c']['domain:hostName']['_v'];
		$ns4det = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:ns']['_c']['domain:hostAttr'][3]['_c']['domain:hostName']['_v'];
		$oldns1 = $ns1det;
		$oldns2 = $ns2det;
		if($ns3det){
			$oldns3 = $ns3det;
		}
		if($ns4det){
			$oldns4 = $ns4det;
		}
	}	
	if($oldns1 || $newns1){
		if(strtolower($oldns1) != strtolower($newns1)){
			if($newns1 == ""){
				$remnameservers[0] = $oldns1;
			} else {
				$remnameservers[0] = $oldns1;
				$addnameservers[0] = $newns1;
			}
		}
	}
	if($oldns2 || $newns2){
		if(strtolower($oldns2) != strtolower($newns2)){
			if($newns2 == ""){
				$remnameservers[1] = $oldns2;
			} else {
				$remnameservers[1] = $oldns2;
				$addnameservers[1] = $newns2;
			}
		}
	}
	if($oldns3 || $newns3){
		if(strtolower($oldns3) != strtolower($newns3)){
			if($newns3 == ""){
				$remnameservers[2] = $oldns3;
			} else {
				$remnameservers[2] = $oldns3;
				$addnameservers[2] = $newns3;
			}
		}
	}
	if($oldns4 || $newns4){
		if(strtolower($oldns4) != strtolower($newns4)){
			if($newns4 == ""){
				$remnameservers[3] = $oldns4;
			} else {
				$remnameservers[3] = $oldns4;
				$addnameservers[3] = $newns4;
			}
		}
	}

	$resp = $irnic->domain_update( $domain_name, $addnameservers, $remnameservers, $irnictech );
	
	if($resp == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}
	
	$resp = xml2ary( $resp );
	$res_code = irNicClass::parseResCode($resp);

	if ($res_code != 1000) {
		if ($res_code == 2102) {
			$values['error'] = "درخواست ارسال شده اشتباه است";
		} else {
			$error = irNicClass::parseResMessage( $resp );
			$values['error'] = $error;
		}
	} else {
		$values['info'] = "تغییرات نیم سرور با موفقیت انجام شد";
	}

	return $values;
}

function irnic_GetRegistrarLock($params) {
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	/*
	$irnic = new irNicClass();
	$request = $irnic->domain_info($domain_name);
	$respons = xml2ary($request);
	$resp_code = irNicClass::parseResCode($respons);
	
	if ($resp_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
		return $values;
	} else {

		$domaincheck = $respons['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:status'];
		foreach($domaincheck as $key=>$val){
			$domain_status[] = strtolower($val['_a']['s']);
		}
		if(in_array("irniclocked",$domain_status)){
			$lockstatus="locked";
		} else {
			$lockstatus="unlocked";
		}
		return "locked";
	}
	*/
	return "locked";
}

function irnic_SaveRegistrarLock($params) {
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	$irnic = new irNicClass();

	if ($params["lockenabled"] == "locked") {
		$request = $irnic->domain_lock($domain_name);
		
    	if($request == "TimeError"){
    	    $values['error'] = $_LANG['irnictimeerror'];
    	    return $values;
    	}
		
		$respons = xml2ary($request);
		$res_code = irNicClass::parseResCode($respons);
		if ($res_code != 1000) {
			$error = irNicClass::parseResMessage( $respons );
			$values['error'] = $error;
		}
	} else {
		$requ = $irnic->domain_req($domain_name); 
		
    	if($requ == "TimeError"){
    	    $values['error'] = $_LANG['irnictimeerror'];
    	    return $values;
    	}
		
		$resp = xml2ary( $requ );
		$resp_code = irNicClass::parseResCode($resp);
		if ($resp_code != 1000) {
			if($resp_code == 2303){
				$values['error'] = "دامنه برای انتقال وجود ندارد";
			} else {
				if($resp_code == 2306){
					$values['error'] = "نماینده دامنه امکان انتقال دامنه را دارد";
				} else {
					if($resp_code == 2304){
						$values['error'] = "وضعیت دامنه برای انتقال مجاز نیست";
					} else {
						$values['error'] = "خطایی در ارسال درخواست رخ داده است";
					}
				}
			}
		} else {							
			$success = "درخواست بازگشایی قفل با موفقیت انجام شد";
			$values['info'] = $success;
		}
	}

	return $values;
}

function irnic_LockDomain($params) {
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	$irnic = new irNicClass();

		$request = $irnic->domain_lock($domain_name);
		
    	if($request == "TimeError"){
    	    $values['error'] = $_LANG['irnictimeerror'];
    	    return $values;
    	}
		
		$respons = xml2ary($request);
		$res_code = irNicClass::parseResCode($respons);
		if ($res_code != 1000) {
			$error = irNicClass::parseResMessage( $respons );
			$values['error'] = $error;
		} else {
			$success = "درخواست قفل دامنه با موفقیت انجام شد";
			$values['info'] = $success;
		}

	return $values;
}

function irnic_AdminCustomButtonArray()
{
	$buttonarray = array('Polling' => 'Polling','Lock Domain' => 'LockDomain','Unlock & Renew' => 'unlockAndRenew','Sync Domain' => 'syncDomainStatusButtonHandle');
	return $buttonarray;
}

function irnic_Polling($params) {
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	$irnic = new irNicClass();
	$request = $irnic->pollRequest();
	
	if($request == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}
	
	$respons = xml2ary($request);
	$resp_code = irNicClass::parseResCode($respons);
	$int = intval($resp_code);

	if ($int == '1300'){
		$success = irNicClass::parseResMessage($respons);
		$values['info'] = $success;
	} else {
		if ($int == '1301'){
			$msgID = $respons['epp']['_c']['response']['_c']['msgQ']['_a']['id'];

			$request = $irnic->pollAck($msgID);
			
        	if($request == "TimeError"){
        	    $values['error'] = $_LANG['irnictimeerror'];
        	    return $values;
        	}
			
			$success = irNicClass::parseResMessage($respons);
			$values['info'] = $success;
		} else {
			$error = irNicClass::parseResMessage($respons);
			$values['error'] = $error;
		}
	}
	return $values;
}

function irnic_RegisterDomain($params) { 
	
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	$domainid = $params["domainid"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	$period = $params['regperiod'] * 12;
	
	$nichandle = $params['additionalfields']['nichandle'];
	$nicadmin = $params['additionalfields']['nicadmin'];
	$nictech = $params['additionalfields']['nictech'];
	$nicbill = $params['additionalfields']['nicbill'];

	if($nicadmin == ""){ $irnicadmin = $adminContact; } else { $irnicadmin = $nicadmin; }	
	if($nictech == ""){ $irnictech = $technicalContact; } else { $irnictech = $nictech; }	
	if($nicbill == ""){ $irnicbill = $billingContact; } else { $irnicbill = $nicbill; }
	
	$dns1 = trim( $params['ns1'] );
	$dns2 = trim( $params['ns2'] );
	$dns3 = trim( $params['ns3'] );
	$dns4 = trim( $params['ns4'] );
	$dns1 = (!empty( $dns1 ) ? $dns1 : 'ns1.yourdomain.com');
	$dns2 = (!empty( $dns2 ) ? $dns2 : null);
	$dns3 = (!empty( $dns3 ) ? $dns3 : null);
	$dns4 = (!empty( $dns4 ) ? $dns4 : null);

	$irnic = new irNicClass();

	while (true) {
		$resp = $irnic->contact_info($nichandle);
		
		if($resp == "TimeError"){
			$values['error'] = "ایرنیک بین ساعت های 11 تا 00:30 شب غیرفعال است.";
			return $values;
		}
		
		$resp = xml2ary( $resp );
		$res_code = irNicClass::parseResCode($resp);

		if ($res_code  == 1000) {
			$contact_id = $resp['epp']['_c']['response']['_c']['resData']['_c']['contact:infData']['_c']['contact:roid']['_v'];
			$nichandle = $contact_id;
			break;
		} else {
			$error = irNicClass::parseResMessage($resp);
			$values['error'] = $error;
			break;
		}
	}

	$resp = $irnic->domain_create( $domain_name, $period, $nichandle, $irnicadmin, $irnictech, $irnicbill, $reseller_id, $dns1, $dns2, null, null, null );

	if($resp == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}

	$resp = xml2ary( $resp );
	$res_code = irNicClass::parseResCode($resp);

	if ($res_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
	} else { 
		$update = mysql_query("UPDATE tbldomains SET status = 'Active' WHERE id = '$domainid'")or die(mysql_error());
		$values['info'] = "ثبت دامنه با موفقیت انجام شد.";
	}

	return $values;
}

function irnic_RenewDomain($params) {

    global $_LANG;

	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	$period = $params['regperiod'] * 12;
	$nichandle = $params['additionalfields']['nichandle'];
	
	$dns1 = trim( $params['ns1'] );
	$dns2 = trim( $params['ns2'] );
	$dns3 = trim( $params['ns3'] );
	$dns4 = trim( $params['ns4'] );
	$dns1 = (!empty( $dns1 ) ? $dns1 : 'ns1.yourdomain.com');
	$dns2 = (!empty( $dns2 ) ? $dns2 : null);
	$dns3 = (!empty( $dns3 ) ? $dns3 : null);
	$dns4 = (!empty( $dns4 ) ? $dns4 : null);
	
	$irnic = new irNicClass();
	
	$req = $irnic->domain_info($domain_name);
	
	$resp = xml2ary($req);
	$exDate = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:exDate']['_v'];
	$exTDate = explode('T',$exDate);
	$expireDateYear = substr($exTDate[0],0,4);
	$expireDateMounthDay = substr($exTDate[0],5,6);

	if(($period == 12) || ($period == 60)){
		if($period == 12){
			//$expDate = ($expireDateYear + 1)."-".$expireDateMounthDay;
			$expDate = $expireDateYear."-".$expireDateMounthDay;
			$periods = 12;
		} else {
			//$expDate = ($expireDateYear + 5)."-".$expireDateMounthDay;
			$expDate = $expireDateYear."-".$expireDateMounthDay;
			$periods = 60;
		}
	} else { 
		$error = 'Domain period time can be 1 or 5 years';
		$values['error'] = "Domain period time can be 1 or 5 years";
		return $values;
	}
	//echo "<pre>";
	////var_dump($exTDate);
	//exit;
	/* for month period renew domain
	if ($period % 12 == 0) {
		$periodZ = $period / 12;
		$expDate = ($expireDateYear + $periodZ)."-".$expireDateMounth."-".$expireDateDay;
	} else {
		$periodM = $period % 12;
		$periodZ = $period / 12;
		$expDate = ($expireDateYear + $periodZ)."-".($expireDateMounth + $periodM)."-".$expireDateDay;
	}
	*/

	$resp_code = irNicClass::parseResCode($resp);
	
	if ($resp_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
	} else {
		foreach ($domain_info['status'] as $status) {
			if (strtolower( $status ) == 'irniclocked') {
				$error = 'Your domain is Locked';
				$values['error'] = $error;
				return $values;
			}
		}
	}

	$resp = $irnic->domain_renew( $domain_name, $periods, $expDate );
	
	if($resp == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}
	
	$resp = xml2ary( $resp );
	$resp_code = irNicClass::parseResCode($resp);


	if ($resp_code != 1001) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
	} else {
		$values['info'] = "تمدید دامنه با موفقیت انجام شد";
	}
	
	return $values;
}

function irnic_TransferDomain($params) {

    global $_LANG;
    
    $nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	$pincode = $params["eppcode"];
	$domainid = $params["domainid"];
	
	$nichandle = $params['additionalfields']['nichandle'];
	
	$special_pincode = htmlspecialchars($pincode);
	$strlow_pincode = strtolower($special_pincode);

	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	if( (strpos( $strlow_pincode, "server.ir" ) !== false) || (strpos( $strlow_pincode, "tamdid" ) !== false) ) {
	
		$period = 12;
		
		$dns1 = trim( $params['ns1'] );
		$dns2 = trim( $params['ns2'] );
		$dns3 = trim( $params['ns3'] );
		$dns4 = trim( $params['ns4'] );
		$dns1 = (!empty( $dns1 ) ? $dns1 : 'ns1.yourdomain.com');
		$dns2 = (!empty( $dns2 ) ? $dns2 : null);
		$dns3 = (!empty( $dns3 ) ? $dns3 : null);
		$dns4 = (!empty( $dns4 ) ? $dns4 : null);
		
		$irnic = new irNicClass();
		
		$req = $irnic->domain_info($domain_name);
		
		$resp = xml2ary($req);
		$exDate = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:exDate']['_v'];
		$exTDate = explode('T',$exDate);
		$expireDateYear = substr($exTDate[0],0,4);
		$expireDateMounthDay = substr($exTDate[0],5,6);

		if(($period == 12) || ($period == 60)){
			if($period == 12){
				$expDate = $expireDateYear."-".$expireDateMounthDay;
				$periods = 12;
			} else {
				$expDate = $expireDateYear."-".$expireDateMounthDay;
				$periods = 60;
			}
		} else { 
			$error = 'Domain period time can be 1 or 5 years';
			$values['error'] = "Domain period time can be 1 or 5 years";
			return $values;
		}
		$resp_code = irNicClass::parseResCode($resp);
		
		if ($resp_code != 1000) {
			$error = irNicClass::parseResMessage($resp);
			$values['error'] = $error;
		} else {
			foreach ($domain_info['status'] as $status) {
				if (strtolower( $status ) == 'irniclocked') {
					$error = 'Your domain is Locked';
					$values['error'] = $error;
					return $values;
				}
			}
		}

		$resp = $irnic->domain_renew( $domain_name, $periods, $expDate );
		
    	if($resp == "TimeError"){
    	    $values['error'] = $_LANG['irnictimeerror'];
    	    return $values;
    	    //break;
    	}
	
		$resp = xml2ary( $resp );
		$resp_code = irNicClass::parseResCode($resp);

		if ($resp_code != 1001) {
			$error = irNicClass::parseResMessage($resp);
			$values['error'] = $error;
		} else {
			$newexpdate = $expireDateYear + 1;
			$nexpDate = $newexpdate."-".$expireDateMounthDay;
			//$update = mysql_query("UPDATE tbldomains SET status = 'Active',expirydate = '$expDate' WHERE id = '$domainid'")or die(mysql_error());
			$update = mysql_query("UPDATE tbldomains SET expirydate = '$nexpDate' WHERE id = '$domainid'")or die(mysql_error());
			/*if($update){
				$select = mysql_query("SELECT orderid FROM tbldomains WHERE id = '$domainid' ORDER BY id DESC LIMIT 1 ")or die(mysql_error());
				$row = mysql_fetch_array($select);
				$orderid = $row['orderid'];
				$selectorder = mysql_query("SELECT ordernum FROM tblorders WHERE id = '$orderid' ORDER BY id DESC LIMIT 1 ")or die(mysql_error());
				$roworder = mysql_fetch_array($selectorder);
				$ordernum = $roworder['ordernum'];
				header("Location: irnic-rules.php?trid=$ordernum");
				exit;	
			} else {
				return false;
			}*/
			return NULL;
		}
		
		return $values;
				
	} else {
		$irnic = new irNicClass();
		if( strpos( $strlow_pincode, " " ) !== false ) {
			$pincode_array = explode(" ",$strlow_pincode);
			
			foreach($pincode_array as $pin_key=>$pin_val){
				if (!filter_var($pin_val, FILTER_VALIDATE_EMAIL) === false) {
					$nichandle = $pin_val;
					
					$respo = $irnic->contact_info($nichandle);

					if($respo == "TimeError"){
						$values['error'] = $_LANG['irnictimeerror'];
						return $values;
					}

					$respo = xml2ary( $respo );
					$res_code = irNicClass::parseResCode($respo);

					if ($res_code  == 1000) {
						$contact_id = $respo['epp']['_c']['response']['_c']['resData']['_c']['contact:infData']['_c']['contact:roid']['_v'];
						$nichandle = $contact_id;
						break;
					} else {
						$error = irNicClass::parseResMessage($respo);
						$values['error'] = $error;
						break;
					}
				} elseif(strpos($pin_val, "irnic" ) !== false){
					$nichandle = $pin_val;
				} else {
					$pincode = $pin_val;
				}
			}
		} else {
			while (true) {
				$respo = $irnic->contact_info($nichandle);
				
				if($respo == "TimeError"){
					$values['error'] = $_LANG['irnictimeerror'];
					return $values;
				}
	
				$respo = xml2ary( $respo );
				$res_code = irNicClass::parseResCode($respo);

				if ($res_code  == 1000) {
					$contact_id = $respo['epp']['_c']['response']['_c']['resData']['_c']['contact:infData']['_c']['contact:roid']['_v'];
					$nichandle = $contact_id;
					break;
				} else {
					$error = irNicClass::parseResMessage($respo);
					$values['error'] = $error;
					break;
				}
			}
		}

		$request = $irnic->domain_transfer( $domain_name, $nichandle, $adminContact, $technicalContact, $billingContact, $pincode );
		
    	if($resp == "TimeError"){
    	    $values['error'] = $_LANG['irnictimeerror'];
    	    return $values;
    	}
		
		$resp = xml2ary( $request );
		$res_code_transfer = irNicClass::parseResCode($resp);

		if ($res_code_transfer != 1000) {
			$error = irNicClass::parseResMessage( $resp );
			$values['error'] = $error;
		} else {
			$update = mysql_query("UPDATE tbldomains SET status = 'Pending Transfer' WHERE id = '$domainid'")or die(mysql_error());
			$values['info'] = "انتقال دامنه با موفقیت انجام شد.";
		}
		return $values;
	}
}

function irnic_GetEPPCode($params) {
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	$pincode = $params["eppcode"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	$irnic = new irNicClass();
	

	$request = $irnic->domain_req($domain_name); 
	
	if($request == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}

	$resp = xml2ary( $request );
	$res_code = irNicClass::parseResCode($resp);
	if ($res_code != 1000) {
		if($res_code == 2303){
			$values['error'] = "دامنه برای انتقال وجود ندارد";
		} else {
			if($res_code == 2306){
				$values['error'] = "نماینده دامنه امکان انتقال دامنه را دارد";
			} else {
				if($res_code == 2304){
					$values['error'] = "وضعیت دامنه برای انتقال مجاز نیست";
				} else {
					$values['error'] = "خطایی در ارسال درخواست رخ داده است";
				}
			}
		}
	} else {							
		$success = "درخواست با موفقیت انجام شد و کد انتقال دامنه به ایمیل شما ارسال شد";
		$values['info'] = $success;
	}
	return $values;
}

function irnic_GetContactDetails($params) {
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	$nichandle = $params['additionalfields']['nichandle'];
	$nicadmin = $params['additionalfields']['nicadmin'];
	$nictech = $params['additionalfields']['nictech'];
	$nicbill = $params['additionalfields']['nicbill'];
	
	$irnic = new irNicClass();	
	$req = $irnic->domain_info($domain_name);
	$resp = xml2ary($req);
	$admindet = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:contact'][1]['_v'];
	$techdet = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:contact'][2]['_v'];
	$billdet = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:contact'][3]['_v'];
	
	$values['Handles']['Holder Handle'] = $nichandle;
	$values['Handles']['Admin Handle'] = $admindet;
	$values['Handles']['Technical Handle'] = $techdet;
	$values['Handles']['Billing Handle'] = $billdet;
	return $values;
}

function irnic_SaveContactDetails($params) {
    
    global $_LANG;
    
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	# Data is returned as specified in the GetContactDetails() function
	$nicadmin = $params["contactdetails"]["Handles"]["Admin Handle"];
	$nictech = $params["contactdetails"]["Handles"]["Technical Handle"];
	$nicbill = $params["contactdetails"]["Handles"]["Billing Handle"];

	if($nicadmin == ""){ $irnicadmin = $adminContact; } else { $irnicadmin = $nicadmin; }	
	if($nictech == ""){ $irnictech = $technicalContact; } else { $irnictech = $nictech; }	
	if($nicbill == ""){ $irnicbill = $billingContact; } else { $irnicbill = $nicbill; }
	
	$irnic = new irNicClass();
	$response = $irnic->domain_contact_update( $domain_name, $nicadmin, $irnictech, $irnicbill );

	if($response == "TimeError"){
	    $values['error'] = $_LANG['irnictimeerror'];
	    return $values;
	}
	
	$resp = xml2ary( $response );
	$res_code = irNicClass::parseResCode($resp);

	if ($res_code != 1000) {
		if($res_code == 2306){
			$values['error'] = "شما امکان تغییر رابط ادمین را ندارید";
		} else 
		if($res_code == 2303){
			$values['error'] = "دامنه برای تغییرات رابط موجود نیست";
		} else {
			$error = irNicClass::parseResMessage( $resp );
			$values['error'] = $error;
		}
	} 

	return $values;
}
function irnic_AdminDomainsTabFields($params)
{
	global $_LANG;
	
	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	$adminContact = $params["adminContact"];
	$technicalContact = $params["technicalContact"];
	$billingContact = $params["billingContact"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
		
	$irnic = new irNicClass();
	
	$req = $irnic->domain_info($domain_name);
	$resp = xml2ary($req);
	$resp_code = irNicClass::parseResCode($resp);

	if ($resp_code != 1000) {
		$error = irNicClass::parseResMessage($resp);
		$values['error'] = $error;
		//return $values;
	} else {

		$domaincheck = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:status'];
		$i = 0;
		foreach($domaincheck as $key=>$val){
			$i = $i+1;
			$domain_status = $val['_a']['s'];
			if($domain_status){
				$domain_all_status .= $i.") ".$_LANG['IRNIC_DOMAIN_STATUS_'.$domain_status].'<br>';
			} else {
				$domain_all_status = ' ';
			}
		}
		$fieldsarray = array('IRNIC Domain Status' => $domain_all_status);
		return $fieldsarray;
	}
}

function irnic_unlockAndRenew($params)
{

	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);
	$period = $params['regperiod'] * 12;

	$unlock_params['tld'] = $tld;
	$unlock_params['sld'] = $sld;
	
	$unlock = irnic_SaveRegistrarLock($unlock_params);
	if($unlock){
		$renew_parameters['nictoken'] = $nictoken;
		$renew_parameters['trid'] = $trid;
		$renew_parameters['test'] = $test;
		$renew_parameters['tld'] = $tld;
		$renew_parameters['sld'] = $sld;
		$renew_parameters['regperiod'] = 1;
		$renew = irnic_RenewDomain($renew_parameters);
		if($renew){
			$values['info'] = "بازگشایی و تمدید دامنه با موفقیت انجام شد";
		} else {
			$values['error'] = "تمدید دامنه انجام نشد";
		}
	} else {
		$values['error'] = "بازگشایی و تمدید دامنه انجام نشد";
	}

	return $values;
}

function irnic_syncDomainStatusButtonHandle($params){
	$username = $params["Username"];
	$password = $params["Password"];
	$testmode = $params["TestMode"];
	$tld = $params["tld"];
	$sld = $params["sld"];
	# Data is returned as specified in the GetContactDetails() function
	$firstname = $params["contactdetails"]["Registrant"]["First Name"];
	$lastname = $params["contactdetails"]["Registrant"]["Last Name"];
	$adminfirstname = $params["contactdetails"]["Admin"]["First Name"];
	$adminlastname = $params["contactdetails"]["Admin"]["Last Name"];
	$techfirstname = $params["contactdetails"]["Tech"]["First Name"];
	$techlastname = $params["contactdetails"]["Tech"]["Last Name"];
	# Put your code to save new WHOIS data here
	# If error, return the error message in the value below
	$values["error"] = $error;
	return $values;
}

function irnic_Sync($params) {

	$nictoken = $params["nictoken"];
	$trid = $params["trid"];
	$test = $params["test"];
	
	if($test == 'on') {$trid = 'TEST';}
	$tld = $params['tld'];
	$sld = $params['sld'];
	$domain_name = strtolower($sld.'.'.$tld);

	date_default_timezone_set('Asia/Tehran');
	$now_date = date("Y-m-d");

	$irnic = new irNicClass();
	
	$req = $irnic->domain_info($domain_name);
	
	$resp = xml2ary($req);
	$resp_code = irNicClass::parseResCode($resp);
	if ($resp_code != 1000) {
		$active = false;
	} else {
		$active = true;
		$exDate = $resp['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:exDate']['_v'];
		$exTDate = explode('T',$exDate);
		$expDate = $exTDate[0];
		if($expDate < $now_date){
			$expired = true;
		} else {
			$expired = false;
		}
	}
    return array(
        'active' => $active, // Return true if the domain is active
        'expired' => $expired, // Return true if the domain has expired
        'expirydate' => $expDate, // Return the current expiry date for the domain
    );
}

?>