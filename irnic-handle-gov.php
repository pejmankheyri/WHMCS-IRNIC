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
 
$ca->setPageTitle($whmcs->get_lang('irnicnewcontactgovernment'));
 
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('irnic-handle.php', Lang::trans('irnicnewcontacthandle'));
$ca->addToBreadCrumb('irnic-handle-gov.php', $whmcs->get_lang('irnicnewcontactgovernment'));
 
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
    	
    	$newcontactgovceofname = $_POST['newcontactgovceofname'];
    	$newcontactgovceolname = $_POST['newcontactgovceolname'];
    	$newcontactgovcompanyname = $_POST['newcontactgovcompanyname'];
    	$newcontactgovcompanyemail = $_POST['newcontactgovcompanyemail'];
    	$newcontactgovcompanycountry = $_POST['newcontactgovcompanycountry'];
    	$newcontactgovcompanycity = $_POST['newcontactgovcompanycity'];
    	$newcontactgovcompanysp = $_POST['newcontactgovcompanysp'];
    	$newcontactgovcompanycategory = $_POST['newcontactgovcompanycategory'];
    	$newcontactgovcountry = $_POST['newcontactgovcountry'];
    	$newcontactgovstate = $_POST['newcontactgovstate'];
    	$newcontactgovcity = $_POST['newcontactgovcity'];
    	$newcontactgovaddress = $_POST['newcontactgovaddress'];
    	$newcontactgovpostcode = $_POST['newcontactgovpostcode'];
    	$newcontactgovphone = $_POST['newcontactgovphone'];
    	$newcontactgovfax = $_POST['newcontactgovfax'];
    
    	$_SESSION['newcontactgovceofname'] = $newcontactgovceofname;
    	$_SESSION['newcontactgovceolname'] = $newcontactgovceolname;
    	$_SESSION['newcontactgovcompanyname'] = $newcontactgovcompanyname;
    	$_SESSION['newcontactgovcompanyemail'] = $newcontactgovcompanyemail;
    	$_SESSION['newcontactgovcompanycountry'] = $newcontactgovcompanycountry;
    	$_SESSION['newcontactgovcompanycity'] = $newcontactgovcompanycity;
    	$_SESSION['newcontactgovcompanysp'] = $newcontactgovcompanysp;
    	$_SESSION['newcontactgovcompanycategory'] = $newcontactgovcompanycategory;
    	$_SESSION['newcontactgovcountry'] = $newcontactgovcountry;
    	$_SESSION['newcontactgovstate'] = $newcontactgovstate;
    	$_SESSION['newcontactgovcity'] = $newcontactgovcity;
    	$_SESSION['newcontactgovaddress'] = $newcontactgovaddress;
    	$_SESSION['newcontactgovpostcode'] = $newcontactgovpostcode;
    	$_SESSION['newcontactgovphone'] = $newcontactgovphone;
    	$_SESSION['newcontactgovfax'] = $newcontactgovfax;
    	
    	$submited = $_POST['submited'];
    
    
    	if($submited == "ok"){
    		if($newcontactgovceofname && $newcontactgovceolname && $newcontactgovcompanyname && $newcontactgovcompanyemail && $newcontactgovcompanycountry && $newcontactgovcompanycity && $newcontactgovcompanysp && $newcontactgovcompanycategory && $newcontactgovcountry && $newcontactgovstate && $newcontactgovcity && $newcontactgovaddress && $newcontactgovpostcode && $newcontactgovphone){
    			if (filter_var($newcontactgovcompanyemail, FILTER_VALIDATE_EMAIL)) {
    				if(strlen($newcontactgovpostcode) == 10){
    
    					$irNic = new irNicClass();
    					$newcontactgov = $irNic->contact_create_gov($newcontactgovceofname, $newcontactgovceolname, $newcontactgovcompanyname, $newcontactgovcompanyemail, $newcontactgovcompanycountry, $newcontactgovcompanycity, $newcontactgovcompanysp, $newcontactgovcompanycategory, $newcontactgovcountry, $newcontactgovstate, $newcontactgovcity, $newcontactgovaddress, $newcontactgovpostcode, $newcontactgovphone, $newcontactgovfax, $clientName, $clientlastname, $clTrid);
    
    					$response = xml2ary($newcontactgov);
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
    						unset($_SESSION['newcontactgovceofname']);
    						unset($_SESSION['newcontactgovceolname']);
    						unset($_SESSION['newcontactgovcompanyname']);
    						unset($_SESSION['newcontactgovcompanyemail']);
    						unset($_SESSION['newcontactgovcompanycountry']);
    						unset($_SESSION['newcontactgovcompanycity']);
    						unset($_SESSION['newcontactgovcompanysp']);
    						unset($_SESSION['newcontactgovcompanycategory']);
    						unset($_SESSION['newcontactgovcountry']);
    						unset($_SESSION['newcontactgovstate']);
    						unset($_SESSION['newcontactgovcity']);
    						unset($_SESSION['newcontactgovaddress']);
    						unset($_SESSION['newcontactgovpostcode']);
    						unset($_SESSION['newcontactgovphone']);
    						unset($_SESSION['newcontactgovfax']);
    
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

$ca->setTemplate('irnic-handle-gov');
 
$ca->output();