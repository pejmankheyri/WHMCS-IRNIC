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
 
$ca->setPageTitle($whmcs->get_lang('irnicnewcontactorganization'));
 
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('irnic-handle.php', Lang::trans('irnicnewcontacthandle'));
$ca->addToBreadCrumb('irnic-handle-private.php', $whmcs->get_lang('irnicnewcontactorganization'));
 
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
    	
    	$newcontactprivateceofname = $_POST['newcontactprivateceofname'];
    	$newcontactprivateceolname = $_POST['newcontactprivateceolname'];
    	$newcontactprivatecompanyname = $_POST['newcontactprivatecompanyname'];
    	$newcontactprivatecompanyemail = $_POST['newcontactprivatecompanyemail'];
    	$newcontactprivatecompanycountry = $_POST['newcontactprivatecompanycountry'];
    	$newcontactprivatecompanycity = $_POST['newcontactprivatecompanycity'];
    	$newcontactprivatecompanyissuer = $_POST['newcontactprivatecompanyissuer'];
    	$newcontactprivatecompanynumber = $_POST['newcontactprivatecompanynumber'];
    	$newcontactprivatecompanynumber2 = $_POST['newcontactprivatecompanynumber2'];
    	$newcontactprivatecompanycategory = $_POST['newcontactprivatecompanycategory'];
    	$newcontactprivatecountry = $_POST['newcontactprivatecountry'];
    	$newcontactprivatestate = $_POST['newcontactprivatestate'];
    	$newcontactprivatecity = $_POST['newcontactprivatecity'];
    	$newcontactprivateaddress = $_POST['newcontactprivateaddress'];
    	$newcontactprivatepostcode = $_POST['newcontactprivatepostcode'];
    	$newcontactprivatephone = $_POST['newcontactprivatephone'];
    	$newcontactprivatefax = $_POST['newcontactprivatefax'];
    
    	$_SESSION['newcontactprivateceofname'] = $newcontactprivateceofname;
    	$_SESSION['newcontactprivateceolname'] = $newcontactprivateceolname;
    	$_SESSION['newcontactprivatecompanyname'] = $newcontactprivatecompanyname;
    	$_SESSION['newcontactprivatecompanyemail'] = $newcontactprivatecompanyemail;
    	$_SESSION['newcontactprivatecompanycountry'] = $newcontactprivatecompanycountry;
    	$_SESSION['newcontactprivatecompanycity'] = $newcontactprivatecompanycity;
    	$_SESSION['newcontactprivatecompanyissuer'] = $newcontactprivatecompanyissuer;
    	$_SESSION['newcontactprivatecompanynumber'] = $newcontactprivatecompanynumber;
    	$_SESSION['newcontactprivatecompanynumber2'] = $newcontactprivatecompanynumber2;
    	$_SESSION['newcontactprivatecompanycategory'] = $newcontactprivatecompanycategory;
    	$_SESSION['newcontactprivatecountry'] = $newcontactprivatecountry;
    	$_SESSION['newcontactprivatestate'] = $newcontactprivatestate;
    	$_SESSION['newcontactprivatecity'] = $newcontactprivatecity;
    	$_SESSION['newcontactprivateaddress'] = $newcontactprivateaddress;
    	$_SESSION['newcontactprivatepostcode'] = $newcontactprivatepostcode;
    	$_SESSION['newcontactprivatephone'] = $newcontactprivatephone;
    	$_SESSION['newcontactprivatefax'] = $newcontactprivatefax;
    	
    	$submited = $_POST['submited'];
    
    	if($submited == "ok"){
    		if($newcontactprivateceofname && $newcontactprivateceolname && $newcontactprivatecompanyname && $newcontactprivatecompanyemail && $newcontactprivatecompanycountry && $newcontactprivatecompanycity && $newcontactprivatecompanyissuer && $newcontactprivatecompanynumber && $newcontactprivatecompanycategory && $newcontactprivatecountry && $newcontactprivatestate && $newcontactprivatecity && $newcontactprivateaddress && $newcontactprivatepostcode && $newcontactprivatephone){
    			if (filter_var($newcontactprivatecompanyemail, FILTER_VALIDATE_EMAIL)) {
    				if(strlen($newcontactprivatepostcode) == 10){
    
    					$irNic = new irNicClass();
    					$newcontactprivate = $irNic->contact_create_private($newcontactprivateceofname, $newcontactprivateceolname, $newcontactprivatecompanyname, $newcontactprivatecompanyemail, $newcontactprivatecompanycountry, $newcontactprivatecompanycity, $newcontactprivatecompanyissuer, $newcontactprivatecompanynumber, $newcontactprivatecompanynumber2, $newcontactprivatecompanycategory, $newcontactprivatecountry, $newcontactprivatestate, $newcontactprivatecity, $newcontactprivateaddress, $newcontactprivatepostcode, $newcontactprivatephone, $newcontactprivatefax, $clientName, $clientlastname, $clTrid);
    
    					$response = xml2ary($newcontactprivate);
    					$resp_code = irNicClass::parseResCode($response);
    
    					if ($resp_code != 1000) {
    						if($resp_code == 2302){
    							$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalObjectexistserror');
    							$ca->assign('errormessage', $fieldserror);
    						} else {
    							if(($resp_code == 2102) || ($resp_code == 2101)){
    								$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalUnimplementedserror');
    								$ca->assign('errormessage', $fieldserror);
    							} else {
    								if($resp_code == 2005){
    									$numbererr = $response['epp']['_c']['response']['_c']['result']['_c']['extValue']['_c']['reason']['_v'];
    									$pos = strpos($numbererr, "number2");
    									if($pos == 0){
    										$ca->assign('errormessage', $whmcs->get_lang('irnicnewcontactprivatenum2err'));
    									} else {
    										$error = irNicClass::parseResMessage($response);
    										$errormessage = $error;
    										$ca->assign('errormessage', $errormessage);
    									}
    								} else {
    									$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalUnimplementedserror');
    									$ca->assign('errormessage', $fieldserror);
    								}
    							}
    						}
    					} else {
    						unset($_SESSION['newcontactprivateceofname']);
    						unset($_SESSION['newcontactprivateceolname']);
    						unset($_SESSION['newcontactprivatecompanyname']);
    						unset($_SESSION['newcontactprivatecompanyemail']);
    						unset($_SESSION['newcontactprivatecompanycountry']);
    						unset($_SESSION['newcontactprivatecompanycity']);
    						unset($_SESSION['newcontactprivatecompanyissuer']);
    						unset($_SESSION['newcontactprivatecompanynumber']);
    						unset($_SESSION['newcontactprivatecompanynumber2']);
    						unset($_SESSION['newcontactprivatecompanycategory']);
    						unset($_SESSION['newcontactprivatecountry']);
    						unset($_SESSION['newcontactprivatestate']);
    						unset($_SESSION['newcontactprivatecity']);
    						unset($_SESSION['newcontactprivateaddress']);
    						unset($_SESSION['newcontactprivatepostcode']);
    						unset($_SESSION['newcontactprivatephone']);
    						unset($_SESSION['newcontactprivatefax']);
    
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

$ca->setTemplate('irnic-handle-private');
 
$ca->output();