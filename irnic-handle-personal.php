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
 
$ca->setPageTitle($whmcs->get_lang('irnicnewcontactpersonal'));
 
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('irnic-handle.php', Lang::trans('irnicnewcontacthandle'));
$ca->addToBreadCrumb('irnic-handle-personal.php', $whmcs->get_lang('irnicnewcontactpersonal'));
 
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
	
	$newcontactpersonalcompany = $_POST['newcontactpersonalcompany'];
	$newcontactpersonalemail = $_POST['newcontactpersonalemail'];
	$newcontactpersonalfirstname = $_POST['newcontactpersonalfirstname'];
	$newcontactpersonallastname = $_POST['newcontactpersonallastname'];
	$newcontactpersonalmellicode = $_POST['newcontactpersonalmellicode'];
	$newcontactpersonalpassport = $_POST['newcontactpersonalpassport'];
	$newcontactpersonalpassportcc = $_POST['newcontactpersonalpassportcc'];
	$newcontactpersonalpassportissuer = $_POST['newcontactpersonalpassportissuer'];
	$newcontactpersonalstate = $_POST['newcontactpersonalstate'];
	$newcontactpersonalcity = $_POST['newcontactpersonalcity'];
	$newcontactpersonalcountry = $_POST['newcontactpersonalcountry'];
	$newcontactpersonaladdress = $_POST['newcontactpersonaladdress'];
	$newcontactpersonalpostcode = $_POST['newcontactpersonalpostcode'];
	$newcontactpersonalphone = $_POST['newcontactpersonalphone'];
	$newcontactpersonalfax = $_POST['newcontactpersonalfax'];

	$_SESSION['newcontactpersonalcompany'] = $newcontactpersonalcompany;
	$_SESSION['newcontactpersonalemail'] = $newcontactpersonalemail;
	$_SESSION['newcontactpersonalfirstname'] = $newcontactpersonalfirstname;
	$_SESSION['newcontactpersonallastname'] = $newcontactpersonallastname;
	$_SESSION['newcontactpersonalmellicode'] = $newcontactpersonalmellicode;
	$_SESSION['newcontactpersonalpassport'] = $newcontactpersonalpassport;
	$_SESSION['newcontactpersonalpassportcc'] = $newcontactpersonalpassportcc;
	$_SESSION['newcontactpersonalpassportissuer'] = $newcontactpersonalpassportissuer;
	$_SESSION['newcontactpersonalstate'] = $newcontactpersonalstate;
	$_SESSION['newcontactpersonalcity'] = $newcontactpersonalcity;
	$_SESSION['newcontactpersonalcountry'] = $newcontactpersonalcountry;
	$_SESSION['newcontactpersonaladdress'] = $newcontactpersonaladdress;
	$_SESSION['newcontactpersonalpostcode'] = $newcontactpersonalpostcode;
	$_SESSION['newcontactpersonalphone'] = $newcontactpersonalphone;
	$_SESSION['newcontactpersonalfax'] = $newcontactpersonalfax;
	
	$submited = $_POST['submited'];

	if($submited == "ok"){
		if($newcontactpersonalemail && $newcontactpersonalfirstname && $newcontactpersonallastname && $newcontactpersonalstate && $newcontactpersonalcity && $newcontactpersonaladdress && $newcontactpersonalpostcode && $newcontactpersonalphone && $newcontactpersonalpassportcc && $newcontactpersonalcountry){
			if($newcontactpersonalmellicode || ($newcontactpersonalpassport && $newcontactpersonalpassportissuer && $newcontactpersonalpassportcc)){
				if (filter_var($newcontactpersonalemail, FILTER_VALIDATE_EMAIL)) {
					if(strlen($newcontactpersonalpostcode) == 10){

						$irNic = new irNicClass();
						$newcontactpersonal = $irNic->contact_create_personal($newcontactpersonalfirstname, $newcontactpersonallastname, $newcontactpersonalcompany, $newcontactpersonalmellicode, $newcontactpersonalpassport, $newcontactpersonalpassportissuer, $clientName, $clientlastname, $newcontactpersonalemail, $newcontactpersonalphone, $newcontactpersonalfax, $newcontactpersonaladdress, $newcontactpersonalstate, $newcontactpersonalpostcode, $newcontactpersonalcity, $newcontactpersonalpassportcc, $newcontactpersonalcountry, $clTrid);

						$response = xml2ary($newcontactpersonal);
						$resp_code = irNicClass::parseResCode($response);
						
						if ($resp_code != 1000) {
							if($resp_code == 2302){
								$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalObjectexistserror');
								$ca->assign('errormessage', $fieldserror);
							} else {
								if($resp_code == 2005){
									$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalsyntaxserror');
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
							unset($_SESSION['newcontactpersonalcompany']);
							unset($_SESSION['newcontactpersonalemail']);
							unset($_SESSION['newcontactpersonalfirstname']);
							unset($_SESSION['newcontactpersonallastname']);
							unset($_SESSION['newcontactpersonalmellicode']);
							unset($_SESSION['newcontactpersonalpassport']);
							unset($_SESSION['newcontactpersonalpassportcc']);
							unset($_SESSION['newcontactpersonalpassportissuer']);
							unset($_SESSION['newcontactpersonalstate']);
							unset($_SESSION['newcontactpersonalcity']);
							unset($_SESSION['newcontactpersonalcountry']);
							unset($_SESSION['newcontactpersonaladdress']);
							unset($_SESSION['newcontactpersonalpostcode']);
							unset($_SESSION['newcontactpersonalphone']);
							unset($_SESSION['newcontactpersonalfax']);
							
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
				$fieldserror = $whmcs->get_lang('irnicnewcontactpersonalmellierror');
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

$ca->setTemplate('irnic-handle-personal');
 
$ca->output();