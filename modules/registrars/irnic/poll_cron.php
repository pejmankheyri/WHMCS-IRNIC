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

//ini_set('display_startup_errors',1);
//ini_set('display_errors',1);
//error_reporting(-1);

date_default_timezone_set('Asia/Tehran');

include( dirname( __FILE__ ) . '/Poll.php' );

$POLL = new Poll();

$execPer = $POLL->QueryDeletePeriodically();

$poll_value = $POLL->Poll_Request();
$int = $poll_value[1];
$respons_poll_empty = $poll_value[3];			

if ($int == '1300'){
	
	$POLL->log_polls($int,'','',$POLL->message_code_1,$respons_poll_empty,'1');
	echo "<br>Completed successfully!(code = 12 or 13)";
	exit;
	
} else {
	if ($int == '1301'){
							
		$poll_value = $POLL->Poll_Request();
		$counts = $poll_value[0];
		
		while($counts >= 1){
						
			$poll_value = $POLL->Poll_Request();
			$respons_poll = $poll_value[2];
			$respons_poll_xml = $poll_value[3];
					
			@$msgID = $respons_poll['epp']['_c']['response']['_c']['msgQ']['_a']['id'];
			@$poll_index = $respons_poll['epp']['_c']['response']['_c']['msgQ']['_c']['msg']['_c']['index']['_v'];

			if(strpos($poll_index, 'DomainUpdateStatus') !== false){
				
				if(strpos($poll_index, 'DomainNotice') !== false){
					
					$poll_messages = $respons_poll['epp']['_c']['response']['_c']['msgQ']['_c']['msg']['_c']['note']['_v'];
					$POLL->log_polls($int,$msgID,$poll_index,$poll_messages,$respons_poll_xml,'2');
					//continue;
					
				}
				
				$poll_domain_name = $respons_poll['epp']['_c']['response']['_c']['resData']['_c']['domain:polData']['_c']['domain:name']['_v'];
				$poll_domain_roid = $respons_poll['epp']['_c']['response']['_c']['resData']['_c']['domain:polData']['_c']['domain:roid']['_v'];
				$poll_domain_status = $respons_poll['epp']['_c']['response']['_c']['resData']['_c']['domain:polData']['_c']['domain:status'];
				$poll_domain_note = $respons_poll['epp']['_c']['response']['_c']['msgQ']['_c']['msg']['_c']['note']['_v'];
				
				if($dom_status){
					
					unset($dom_status);
					empty($dom_status);
					
				}
				
				foreach($poll_domain_status as $status_key => $status_val){
					
					$dom_status[] = $status_val["_a"]["s"];
					
				}

				if(((in_array("irnicHolderChangeIsWithdrawn",$dom_status)) || (in_array("irnicRegistrationRejected",$dom_status)) || (in_array("irnicRenewalRejected",$dom_status)) || (in_array("irnicHolderChangeRejected",$dom_status))) && (in_array("irnicHolderChangeApproved",$dom_status))){
					
					$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_11,$respons_poll_xml,'11');
					continue;
					
				}

				if((in_array("irnicHolderChangeIsWithdrawn",$dom_status)) || (in_array("irnicRegistrationRejected",$dom_status)) || (in_array("irnicRenewalRejected",$dom_status)) || (in_array("irnicHolderChangeRejected",$dom_status)) || (in_array("irnicSuspended",$dom_status)) || (in_array("Inactive",$dom_status)) || (in_array("irnicRenewalIsWithdrawn",$dom_status)) || (in_array("irnicRegistrationIsWithdrawn",$dom_status))){

					$select = $POLL->QuerySelectDomainRejected($poll_domain_name);

					while($row = mysqli_fetch_array($select)){
						
						$domain_id = $row['id'];
						$update_rej = $POLL->QueryUpdateDomainRejected($domain_id);
						
						if($update_rej){
							
							$insert_rej = $POLL->QueryInsertDomainRejected($poll_domain_name);
						}
					}
					
					if($insert_rej){
						
						$poll_mess_code = '3';
						$poll_messages = $POLL->message_code_3;
						
					} else {
						
						$poll_mess_code = '4';
						$poll_messages = $POLL->message_code_4;
						
					}
					
					$POLL->log_polls($int,$msgID,$poll_index,$poll_messages,$respons_poll_xml,$poll_mess_code);
					continue;
					
				} else {
					
					if(in_array("irnicHolderChangeApproved",$dom_status)){

						$select_app = $POLL->QuerySelectDomainApproved($poll_domain_name);
						
						while($row_app = mysqli_fetch_array($select_app)){
							
							$domain_app_id = $row_app['id'];
							$update_app = $POLL->QueryUpdateDomainApproved($domain_app_id);
							
							if($update_app){
															
								$resp_code_info = $POLL->RequestDomainApproved($poll_domain_name);

								if($resp_code_info[1] == 1000){
									
									$resp_info_holder = $resp_code_info[0]['epp']['_c']['response']['_c']['resData']['_c']['domain:infData']['_c']['domain:contact'][0]['_v'];
									
									if($resp_info_holder){
										
										$update_additionl = $POLL->QueryUpdateAdditionalApproved($resp_info_holder,$domain_app_id);
									}

									$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_5,$respons_poll_xml,'5');
									continue;
									
								} else {
									
									$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_6,$respons_poll_xml,'6');
									continue;
									
								}
							}
						}
					} else {
						if($poll_domain_note){
							$add_todo = $POLL->QueryInsertDomainNoRejectedNote($poll_domain_name,$poll_domain_note);
						}
						$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_10,$respons_poll_xml,'10');
						continue;
						
					}
				}
			} else {
				
				if(strpos($poll_index, 'ContactUpdateStatus') !== false){
					
					if(strpos($poll_index, 'ContactNotice') !== false){
						
						$poll_messages = $respons_poll['epp']['_c']['response']['_c']['msgQ']['_c']['msg']['_c']['note']['_v'];
						$POLL->log_polls($int,$msgID,$poll_index,$poll_messages,$respons_poll_xml,'7');
						continue;
						
					} else {
						
						$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_8,$respons_poll_xml,'8');
						continue;
						
					}
				} 
			}
			
			$counts = $counts - 1;
			
		}
	} else {
		
		$POLL->log_polls($int,$msgID,$poll_index,$POLL->message_code_9,$respons_poll_empty,'9');
		echo "<br>Unsuccessfully(code = 14)";
		exit;
		
	}			
}
?>