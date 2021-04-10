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

include_once( dirname( __FILE__ ) . '/modules/registrars/irnic/functions.php' );
include_once( dirname( __FILE__ ) . '/modules/registrars/irnic/inc/xml2ary.inc.php' );
use WHMCS\ClientArea;
use WHMCS\Database\Capsule;
 
 
define('CLIENTAREA', true);
//define('FORCESSL', true); // Uncomment to force the page to use https://
 
require __DIR__ . '/init.php';
 
$ca = new ClientArea();
 
$ca->setPageTitle($whmcs->get_lang('irnicnewcontacteducation'));
 
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('irnic-handle.php', Lang::trans('irnicnewcontacthandle'));
$ca->addToBreadCrumb('irnic-handle-edu.php', $whmcs->get_lang('irnicnewcontacteducation'));
 
$ca->initPage();
 
$ca->requireLogin(); // Uncomment this line to require a login to access this page
 
// To assign variables to the template system use the following syntax.
// These can then be referenced using {$variablename} in the template.
 
//$ca->assign('variablename', $value);
 
// Check login status
if ($ca->isLoggedIn()) {
 
	date_default_timezone_set('Asia/Tehran');
	$hour = date("H",time());
	$minute = date("i",time());
	// $hour = 00;
	// $minute = 00;
	if((($hour == 00) && ($minute <= 30)) || ($hour == 23)){
		$ca->assign('IrnicTimeError', $whmcs->get_lang('irnictimeerror'));
	} else {

        /**
         * User is logged in - put any code you like here
         *
         * Here's an example to get the currently logged in clients first name
         */
     
        $clientName = Capsule::table('tblclients')->where('id', '=', $ca->getUserID())->pluck('firstname');
        $clientlastname = Capsule::table('tblclients')->where('id', '=', $ca->getUserID())->pluck('lastname');
    
        $ca->assign('clientname', $clientName);
        $ca->assign('clientlastname', $clientlastname);
    	
    	$newcontacteduceofname = $_POST['newcontacteduceofname'];
    	$newcontacteduceolname = $_POST['newcontacteduceolname'];
    	$newcontacteducompanyname = $_POST['newcontacteducompanyname'];
    	$newcontacteducompanyemail = $_POST['newcontacteducompanyemail'];
    	$newcontacteducompanycountry = $_POST['newcontacteducompanycountry'];
    	$newcontacteducompanycity = $_POST['newcontacteducompanycity'];
    	$newcontacteducompanysp = $_POST['newcontacteducompanysp'];
    	$newcontacteducompanycategory = $_POST['newcontacteducompanycategory'];
    	$newcontacteducountry = $_POST['newcontacteducountry'];
    	$newcontactedustate = $_POST['newcontactedustate'];
    	$newcontacteducity = $_POST['newcontacteducity'];
    	$newcontacteduaddress = $_POST['newcontacteduaddress'];
    	$newcontactedupostcode = $_POST['newcontactedupostcode'];
    	$newcontacteduphone = $_POST['newcontacteduphone'];
    	$newcontactedufax = $_POST['newcontactedufax'];
    
    	$_SESSION['newcontacteduceofname'] = $newcontacteduceofname;
    	$_SESSION['newcontacteduceolname'] = $newcontacteduceolname;
    	$_SESSION['newcontacteducompanyname'] = $newcontacteducompanyname;
    	$_SESSION['newcontacteducompanyemail'] = $newcontacteducompanyemail;
    	$_SESSION['newcontacteducompanycountry'] = $newcontacteducompanycountry;
    	$_SESSION['newcontacteducompanycity'] = $newcontacteducompanycity;
    	$_SESSION['newcontacteducompanysp'] = $newcontacteducompanysp;
    	$_SESSION['newcontacteducompanycategory'] = $newcontacteducompanycategory;
    	$_SESSION['newcontacteducountry'] = $newcontacteducountry;
    	$_SESSION['newcontactedustate'] = $newcontactedustate;
    	$_SESSION['newcontacteducity'] = $newcontacteducity;
    	$_SESSION['newcontacteduaddress'] = $newcontacteduaddress;
    	$_SESSION['newcontactedupostcode'] = $newcontactedupostcode;
    	$_SESSION['newcontacteduphone'] = $newcontacteduphone;
    	$_SESSION['newcontactedufax'] = $newcontactedufax;
    	
    	$submited = $_POST['submited'];
    	
    	if($submited == "ok"){
    		if($newcontacteduceofname && $newcontacteduceolname && $newcontacteducompanyname && $newcontacteducompanyemail && $newcontacteducompanycountry && $newcontacteducompanycity && $newcontacteducompanysp && $newcontacteducompanycategory && $newcontacteducountry && $newcontactedustate && $newcontacteducity && $newcontacteduaddress && $newcontactedupostcode && $newcontacteduphone){
    			if (filter_var($newcontacteducompanyemail, FILTER_VALIDATE_EMAIL)) {
    				if(strlen($newcontactedupostcode) == 10){
    
    					$irNic = new irNicClass();
    					
    					$newcontactedu = $irNic->contact_create_edu($newcontacteduceofname, $newcontacteduceolname, $newcontacteducompanyname, $newcontacteducompanyemail, $newcontacteducompanycountry, $newcontacteducompanycity, $newcontacteducompanysp, $newcontacteducompanycategory, $newcontacteducountry, $newcontactedustate, $newcontacteducity, $newcontacteduaddress, $newcontactedupostcode, $newcontacteduphone, $newcontactedufax, $clientName, $clientlastname, $clTrid);
    
    					$response = xml2ary($newcontactedu);
    					$resp_code = irNicClass::parseResCode($response);
    
    					if ($resp_code != 1000) {
    						if($resp_code == 2302){
    							$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalObjectexistserror');
    							$ca->assign('errormessage', $fieldserror);
    						} else {
    							if($resp_code == 2005){
    								$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalparamsyntaxserror');
    								$ca->assign('errormessage', $fieldserror);
    							} else {
    								if(($resp_code == 2102) || ($resp_code == 2101)){
    									$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalUnimplementedserror');
    									$ca->assign('errormessage', $fieldserror);
    								} else {
    									$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalUnimplementedserror');
    									$ca->assign('errormessage', $fieldserror);
    								}
    							}
    						}
    					} else {
    						unset($_SESSION['newcontacteduceofname']);
    						unset($_SESSION['newcontacteduceolname']);
    						unset($_SESSION['newcontacteducompanyname']);
    						unset($_SESSION['newcontacteducompanyemail']);
    						unset($_SESSION['newcontacteducompanycountry']);
    						unset($_SESSION['newcontacteducompanycity']);
    						unset($_SESSION['newcontacteducompanysp']);
    						unset($_SESSION['newcontacteducompanycategory']);
    						unset($_SESSION['newcontacteducountry']);
    						unset($_SESSION['newcontactedustate']);
    						unset($_SESSION['newcontacteducity']);
    						unset($_SESSION['newcontacteduaddress']);
    						unset($_SESSION['newcontactedupostcode']);
    						unset($_SESSION['newcontacteduphone']);
    						unset($_SESSION['newcontactedufax']);
    						
    						$contactid = $response['epp']['_c']['response']['_c']['resData']['_c']['contact:creData']['_c']['contact:id']['_v'];
    						$ca->assign('successmessage', $whmcs->get_lang('irnicnewcontactpersonalsuccess').'<br>'.$whmcs->get_lang('irnicnewcontactpersonalcontactid').' '.$contactid);
    					}
    				} else {
    					$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalpostalerror');
    					$ca->assign('errormessage', $fieldserror);
    				}
    			} else {
    				$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalemailerror');
    				$ca->assign('errormessage', $fieldserror);
    			}
    		} else {
    			$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalfieldserror');
    			$ca->assign('errormessage', $fieldserror);
    		}
    	}
	}
} else {
 
    // User is not logged in
    $ca->assign('clientname', 'Random User');
 
}


/**
 * Set a context for sidebars
 *
 * @link http://docs.whmcs.com/Editing_Client_Area_Menus#Context
 */
Menu::addContext('irnic', 'domainView');
/**
 * Setup the primary and secondary sidebars
 *
 * @link http://docs.whmcs.com/Editing_Client_Area_Menus#Context
 */
Menu::primarySidebar('orderFormView');
Menu::secondarySidebar('domainView');
 
# Define the template filename to be used without the .tpl extension

$ca->setTemplate('irnic-handle-edu');
 
$ca->output();