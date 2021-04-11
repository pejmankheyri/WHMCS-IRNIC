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

function irnic_config() {
	$configarray = array(
		'name' => 'IRNIC Domain Registrar', 
		'version' => '1.0.1', 
		'author' => 'pejman kheyri', 
		'description' => 'IR Domain Registrar', 
		'language' => 'farsi', 
        'fields' => array( 
            'rowcount' => array("FriendlyName" => "Rows Count", "Type" => "text", "Size" => "30", ), 
        ), 		
	); 
	return $configarray; 
} 

function irnic_activate() { 
	//do noting for now
} 

function irnic_deactivate() { 
	//do noting for now
} 

function irnic_output($vars) { 
    echo "<style>
    ul.setPaginate li.setPage{
	padding:15px 10px;
	font-size:14px;
}

ul.setPaginate{
	margin:0px;
	padding:0px;
	height:100%;
	overflow:hidden;
	font:12px 'Tahoma';
	list-style-type:none;	
	float: right;
}  

ul.setPaginate li.dot{padding: 3px 0;}

ul.setPaginate li{
	float:right;
	margin:0px;
	padding:0px;
	margin-right:5px;
}

ul.setPaginate li a{
	background: none repeat scroll 0 0 #ffffff;
	border: 1px solid #cccccc;
	color: #999999;
	display: inline-block;
	font: 15px/25px Arial,Helvetica,sans-serif;
	margin: 5px 3px 0 0;
	padding: 0 5px;
	text-align: center;
	text-decoration: none;
}	

ul.setPaginate li a:hover,
ul.setPaginate li a.current_page{
	background: none repeat scroll 0 0 #1A4D80;
	border: 1px solid #000000;
	color: #ffffff;
	text-decoration: none;
}

ul.setPaginate li a{
	color:black;
	display:block;
	text-decoration:none;
	padding:5px 8px;
	text-decoration: none;
}
    </style>";
	global $LANG;
	$modulelink = $vars['modulelink']; 
	$rowcount = $vars['rowcount']; 
	$poll = $_GET['poll'];
	$delete = $_GET['delete'];
	$mess = $_GET['mess'];
	if($mess == "Done"){
		echo irnic_delete_success_mess();
	}
	if($mess == "deleteAll"){
		echo irnic_poll_delete_confirmation_js();
		$deleteAll = mysql_query("DELETE FROM mod_irnic_poll")or die(mysql_error());
		if($deleteAll){
			header("Location: $modulelink&mess=Done");
		} else {
			echo irnic_delete_failed_mess();
		}
	}
	if($delete){
		$delete = mysql_query("DELETE FROM mod_irnic_poll WHERE id = $delete")or die(mysql_error());
		if($delete){
			header("Location: $modulelink&mess=Done");
		} else {
			echo irnic_delete_failed_mess();
		}
	}
	if($poll){
		echo irnic_poll_details($poll);
	} else {
		if($rowcount){
			$setLimit = $rowcount;
		} else {
			$setLimit = 50;
		}
		if(isset($_GET["page"])){ $page = (int)$_GET["page"]; } else { $page = 1; }
		$pageLimit = ($page * $setLimit) - $setLimit;
		$select = mysql_query("SELECT * FROM mod_irnic_poll ORDER BY id DESC LIMIT $setLimit OFFSET $pageLimit")or die(mysql_error());
		if($page != 1){
			$i = (($page - 1) * $setLimit) + 1;
		} else {
			$i = 1;
		}
		
		echo irnic_poll_delete_confirmation_js();
		echo '<div class="tablebg" style="direction: rtl">'.irnic_Pagination($modulelink,$page,$setLimit).'
			<table class="datatable" width="100%" 0" cellspacing="1" cellpadding="3">
				<tr>
					<th>'.$LANG['IRNICAddon_row'].'</th>
					<th>'.$LANG['IRNICAddon_poll_code'].'</th>
					<th>'.$LANG['IRNICAddon_msgID'].'</th>
					<th>'.$LANG['IRNICAddon_poll_index'].'</th>
					<th>'.$LANG['IRNICAddon_poll_messages'].'</th>
					<th>'.$LANG['IRNICAddon_poll_xml'].'</th>
					<th>'.$LANG['IRNICAddon_poll_mess_code'].'</th>
					<th>'.$LANG['IRNICAddon_date_time'].'</th>
					<th>'.$LANG['IRNICAddon_configuration'].'</th>
				</tr>';
				while($row = mysql_fetch_array($select)){
				
				echo '<tr>
					<td><a href="'.$modulelink.'&poll='.$row['id'].'">'.$i.'</a></td>
					<td>'.$row['poll_code'].'</td>
					<td><a href="'.$modulelink.'&poll='.$row['id'].'">'.$row['msgID'].'</a></td>
					<td>'.$row['poll_index'].'</td>
					<td>'.$row['poll_messages'].'</td>
					<td>';
					if($row['poll_xml']){
						echo '<a style="direction: ltr;" title="'.htmlentities($row['poll_xml']).'" href="'.$modulelink.'&poll='.$row['id'].'"><pre style="direction: ltr;">';
						if(strlen($row['poll_xml']) > 100){
							echo substr(htmlentities($row['poll_xml']), 0, 100);
							echo " ... ";
						} else {
							echo htmlentities($row['poll_xml']);
						}
						echo '</pre></a>';
					}
					echo '</td>
					<td>'.$row['poll_mess_code'].'</td>
					<td>'.$row['date_time'].'</td>
					<td style="text-align: center;">
						<a onclick="return confirmation();" href="'.$modulelink.'&delete='.$row['id'].'">
							<img src="images/delete.gif" alt="Delete" width="16" border="0" height="16">
						</a>
					</td>
				</tr>';
				$i = $i + 1;
				}
				
		echo '</table> '.irnic_Pagination($modulelink,$page,$setLimit).'
			</div> ';
	}
} 

function irnic_sidebar($vars) { 
	global $LANG;
	$modulelink = $vars['modulelink'];  
	$sidebar = '
		<span class="header"><img src="images/icons/addonmodules.png" class="absmiddle" width="16" height="16" /> '.$LANG['IRNICAddon_menu'].'</span> 
		<ul class="menu"> 
			<li><a href="'.$modulelink.'">'.$LANG['IRNICAddon_polls_list'].'</a></li> 
			<li><a onclick="return confirmation();" href="'.$modulelink.'&mess=deleteAll">'.$LANG['IRNICAddon_delete_all'].'</a></li> 
		</ul>';
	return $sidebar; 
} 

function irnic_upgrade($vars) {
	$version = $vars['version'];  
    if ($version == "1.0") { 
		//$query = "ALTER TABLE mod_customtable ADD extrafield TEXT NOT NULL;"; 
        //mysql_query($query); 
    } 
}

function irnic_poll_details($poll){
	global $LANG;
	$selectpoll = mysql_query("SELECT * FROM mod_irnic_poll WHERE id = $poll")or die(mysql_error());
	$rowpoll = mysql_fetch_array($selectpoll);
	$output = '<div class="tablebg" style="direction: rtl">
		<table class="form" width="100%" border="0" 2" cellpadding="3"> 
		<tr>
			<td width="20%" class="fieldlabel">'.$LANG['IRNICAddon_poll_code'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['poll_code'].'</td>
		</tr> 
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_msgID'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['msgID'].'</td>
		</tr>
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_poll_index'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['poll_index'].'</td>
		</tr>
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_poll_messages'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['poll_messages'].'</td>
		</tr>
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_poll_xml'].'</td>
			<td class="fieldarea"><pre>'.htmlentities($rowpoll['poll_xml']).'</pre></td>
		</tr>
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_poll_mess_code'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['poll_mess_code'].'</td>
		</tr>
		<tr>
			<td class="fieldlabel">'.$LANG['IRNICAddon_date_time'].'</td>
			<td style="text-align: right;" class="fieldarea">'.$rowpoll['date_time'].'</td>
		</tr>
	</table></div>';
	return $output;
}

function irnic_poll_delete_confirmation_js(){
	global $LANG;
	$output = '<script type="text/javascript">
				function confirmation() {
					if (!confirm("'.$LANG['IRNICAddon_you_sure_delete'].'")) {
						return false;
					}
				}	
		</script>';
	return $output;
}

function irnic_delete_success_mess(){
	global $LANG;
	echo '<div class="successbox">
		<strong>
		<span class="title">'.$LANG['IRNICAddon_success_mess_title'].'</span>
		</strong><br>'.$LANG['IRNICAddon_delete_success_message'].'</div>';
}

function irnic_delete_failed_mess(){
	global $LANG;
	echo '<div class="errorbox">
		<strong>
		<span class="title">'.$LANG['IRNICAddon_failed_mess_title'].'</span>
		</strong><br>'.$LANG['IRNICAddon_delete_error'].'</div>';
}

function irnic_Pagination($modulelink,$page,$setLimit){
	global $LANG;
	$page_url=$modulelink."&";
	$query = mysql_query("SELECT COUNT(*) as totalCount FROM mod_irnic_poll")or die(mysql_error());
	$rec = mysql_fetch_array($query);
	$total = $rec['totalCount'];
	$adjacents = "2"; 

	$page = ($page == 0 ? 1 : $page);  
	$start = ($page - 1) * $setLimit;								
	
	$prev = $page - 1;							
	$next = $page + 1;
	$setLastpage = ceil($total/$setLimit);
	$lpm1 = $setLastpage - 1;
	
	$setPaginate = "";
	if($setLastpage > 1)
	{	
		$setPaginate .= "<ul class='setPaginate'>";
				$setPaginate .= "<li class='setPage'>".$LANG['IRNICAddon_page']." $page ".$LANG['IRNICAddon_from']." $setLastpage</li>";
		if ($setLastpage < 7 + ($adjacents * 2))
		{	
			for ($counter = 1; $counter <= $setLastpage; $counter++)
			{
				if ($counter == $page)
					$setPaginate.= "<li><a class='current_page'>$counter</a></li>";
				else
					$setPaginate.= "<li><a href='{$page_url}page=$counter'>$counter</a></li>";					
			}
		}
		elseif($setLastpage > 5 + ($adjacents * 2))
		{
			if($page < 1 + ($adjacents * 2))		
			{
				for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
				{
					if ($counter == $page)
						$setPaginate.= "<li><a class='current_page'>$counter</a></li>";
					else
						$setPaginate.= "<li><a href='{$page_url}page=$counter'>$counter</a></li>";					
				}
				$setPaginate.= "<li class='dot'>...</li>";
				$setPaginate.= "<li><a href='{$page_url}page=$lpm1'>$lpm1</a></li>";
				$setPaginate.= "<li><a href='{$page_url}page=$setLastpage'>$setLastpage</a></li>";		
			}
			elseif($setLastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
			{
				$setPaginate.= "<li><a href='{$page_url}page=1'>1</a></li>";
				$setPaginate.= "<li><a href='{$page_url}page=2'>2</a></li>";
				$setPaginate.= "<li class='dot'>...</li>";
				for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
				{
					if ($counter == $page)
						$setPaginate.= "<li><a class='current_page'>$counter</a></li>";
					else
						$setPaginate.= "<li><a href='{$page_url}page=$counter'>$counter</a></li>";					
				}
				$setPaginate.= "<li class='dot'>..</li>";
				$setPaginate.= "<li><a href='{$page_url}page=$lpm1'>$lpm1</a></li>";
				$setPaginate.= "<li><a href='{$page_url}page=$setLastpage'>$setLastpage</a></li>";		
			}
			else
			{
				$setPaginate.= "<li><a href='{$page_url}page=1'>1</a></li>";
				$setPaginate.= "<li><a href='{$page_url}page=2'>2</a></li>";
				$setPaginate.= "<li class='dot'>..</li>";
				for ($counter = $setLastpage - (2 + ($adjacents * 2)); $counter <= $setLastpage; $counter++)
				{
					if ($counter == $page)
						$setPaginate.= "<li><a class='current_page'>$counter</a></li>";
					else
						$setPaginate.= "<li><a href='{$page_url}page=$counter'>$counter</a></li>";					
				}
			}
		}
		
		if ($page < $counter - 1){ 
			$setPaginate.= "<li><a href='{$page_url}page=$next'>".$LANG['IRNICAddon_next']."</a></li>";
			$setPaginate.= "<li><a href='{$page_url}page=$setLastpage'>".$LANG['IRNICAddon_last']."</a></li>";
			if($total){
				$setPaginate.= "<li><a href=''>".$LANG['IRNICAddon_total'].": ".$total."</a></li>";
			}
		}else{
			$setPaginate.= "<li><a class='current_page'>".$LANG['IRNICAddon_next']."</a></li>";
			$setPaginate.= "<li><a class='current_page'>".$LANG['IRNICAddon_last']."</a></li>";
			if($total){
				$setPaginate.= "<li><a href=''>".$LANG['IRNICAddon_total'].": ".$total."</a></li>";
			}
		}

		$setPaginate.= "</ul>\n";		
	}


	return $setPaginate;
} 

?>