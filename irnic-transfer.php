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
 
$ca->setPageTitle($whmcs->get_lang('irnicdomaintransfer'));
 
$ca->addToBreadCrumb('irnic-transfer.php', Lang::trans('irnicdomaintransfer'));
 
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
    	
    	$irnictransfer = $_POST['irnictransfer'];
    	
    	$submited = $_POST['submited'];
    
    function is_valid_domain_name($domain_name)
    {
        return (preg_match("/^([a-z\d](-*[a-z\d])*)(\.([a-z\d](-*[a-z\d])*))*$/i", $domain_name) //valid chars check
                && preg_match("/^.{1,253}$/", $domain_name) //overall length check
                && preg_match("/^[^\.]{1,63}(\.[^\.]{1,63})*$/", $domain_name)   ); //length of each label
    }
    
    	if($submited == "ok"){
    		if($irnictransfer){
    				if (is_valid_domain_name($irnictransfer)) {
    
    					$irNic = new irNicClass();
    					$newtransfer = $irNic->domain_req($irnictransfer, $clTrid);
    
    					$response = xml2ary($newtransfer);
    					$resp_code = irNicClass::parseResCode($response);
    					
    					if ($resp_code != 1000) {
    						if($resp_code == 2303){
    							$fieldserror = $whmcs->get_lang('irnictransferObjectexistserror');
    							$ca->assign('errormessage', $fieldserror);
    						} else {
    							if($resp_code == 2306){
    								$fieldserror = $whmcs->get_lang('irnictransferpolicyerror');
    								$ca->assign('errormessage', $fieldserror);
    							} else {
    								if($resp_code == 2304){
    									$fieldserror = $whmcs->get_lang('irnictransferoperationerror');
    									$ca->assign('errormessage', $fieldserror);
    								} else {
    									$fieldserror = $whmcs->get_lang('irnictransferanyerror');
    									$ca->assign('errormessage', $fieldserror);
    								}
    							}
    						}
    					} else {							
    						$contactid = $response['epp']['_c']['response']['_c']['resData']['_c']['contact:creData']['_c']['contact:id']['_v'];
    						$ca->assign('successmessage', $whmcs->get_lang('irnictransfersuccess'));
    					}
    				} else {
    					$fieldserror = $whmcs->get_lang('irnictransferdomainvaliderror');
    					$ca->assign('errormessage', $fieldserror);
    				}
    		} else {
    			$fieldserror = $whmcs->get_lang('irnictransferfieldserror');
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

$ca->setTemplate('irnic-transfer');
 
$ca->output();