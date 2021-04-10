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

use WHMCS\ClientArea;
use WHMCS\Database\Capsule;
 
 
define('CLIENTAREA', true);
//define('FORCESSL', true); // Uncomment to force the page to use https://
 
require __DIR__ . '/init.php';
 
$ca = new ClientArea();
 
$ca->setPageTitle($whmcs->get_lang('irnicnewcontacthandle'));
 
$ca->addToBreadCrumb('index.php', Lang::trans('globalsystemname'));
$ca->addToBreadCrumb('irnic-handle.php', $whmcs->get_lang('irnicnewcontacthandle'));
 
$ca->initPage();
 
//$ca->requireLogin(); // Uncomment this line to require a login to access this page
 
// To assign variables to the template system use the following syntax.
// These can then be referenced using {$variablename} in the template.
 
//$ca->assign('variablename', $value);

// Check login status
if ($ca->isLoggedIn()) {
 
    /**
     * User is logged in - put any code you like here
     *
     * Here's an example to get the currently logged in clients first name
     */
 
    $clientName = Capsule::table('tblclients')
        ->where('id', '=', $ca->getUserID())->pluck('firstname');
        // 'pluck' was renamed within WHMCS 7.0.  Replace it with 'value' instead.
        // ->where('id', '=', $ca->getUserID())->value('firstname');
    $ca->assign('clientname', $clientName);
 
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

$ca->setTemplate('irnic-handle');
 
$ca->output();