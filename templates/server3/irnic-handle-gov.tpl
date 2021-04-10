{if $IrnicTimeError}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$IrnicTimeError}
{else}
    {if $errormessage}
    	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    {if $successmessage}
    	{include file="$template/includes/alert.tpl" type="success" textcenter=true hide=false additionalClasses="my-custom-class" idname="my-alert" msg=$successmessage}
    {/if}
    <p>{$LANG.irnicnewcontactpersonalinfodesc}<br>{$LANG.irnicnewcontactgovinfodesc}<br>{$LANG.irnicnewcontactnicircond}</p>
    <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" role="form">
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontactgovinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovceofname">{$LANG.irnicnewcontactgovceofname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovceofname" pattern="[a-zA-Z ]*" id="newcontactgovceofname" value="{$smarty.session.newcontactgovceofname}" class="form-control" placeholder="{$LANG.newcontactpersonalfirstnameH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovceolname">{$LANG.irnicnewcontactgovceolname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovceolname" pattern="[a-zA-Z ]*" id="newcontactgovceolname" value="{$smarty.session.newcontactgovceofname}" class="form-control" placeholder="{$LANG.newcontactpersonallastnameH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovcompanyname">{$LANG.irnicnewcontactgovcompanyname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovcompanyname" pattern="[a-zA-Z0-9 ,.]*" id="newcontactgovcompanyname" value="{$smarty.session.newcontactgovcompanyname}" class="form-control" placeholder="{$LANG.newcontactpersonalcompanyH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovcompanyemail">{$LANG.supportticketsclientemail} * </label>
    				<input type="email" style="direction: ltr;" name="newcontactgovcompanyemail" id="newcontactgovcompanyemail" value="{$smarty.session.newcontactgovcompanyemail}" class="form-control" placeholder="{$LANG.newcontactpersonalemailH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovcompanycountry">{$LANG.irnicnewcontactprivatecompanycountry} * </label>
    				<select name="newcontactgovcompanycountry" id="newcontactgovcompanycountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontactgovcompanycountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontactgovcompanycountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontactgovcompanycountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontactgovcompanycountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontactgovcompanycountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontactgovcompanycountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontactgovcompanycountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontactgovcompanycountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontactgovcompanycountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontactgovcompanycountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontactgovcompanycountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontactgovcompanycountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontactgovcompanycountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontactgovcompanycountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontactgovcompanycountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontactgovcompanycountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontactgovcompanycountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontactgovcompanycountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontactgovcompanycountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontactgovcompanycountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontactgovcompanycountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontactgovcompanycountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontactgovcompanycountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontactgovcompanycountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontactgovcompanycountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontactgovcompanycountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontactgovcompanycountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontactgovcompanycountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontactgovcompanycountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontactgovcompanycountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontactgovcompanycountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontactgovcompanycountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontactgovcompanycountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontactgovcompanycountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontactgovcompanycountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontactgovcompanycountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontactgovcompanycountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontactgovcompanycountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontactgovcompanycountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontactgovcompanycountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontactgovcompanycountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontactgovcompanycountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontactgovcompanycountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontactgovcompanycountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontactgovcompanycountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontactgovcompanycountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontactgovcompanycountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontactgovcompanycountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontactgovcompanycountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontactgovcompanycountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontactgovcompanycountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontactgovcompanycountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontactgovcompanycountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontactgovcompanycountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontactgovcompanycountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontactgovcompanycountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontactgovcompanycountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontactgovcompanycountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontactgovcompanycountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontactgovcompanycountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontactgovcompanycountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontactgovcompanycountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontactgovcompanycountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontactgovcompanycountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontactgovcompanycountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontactgovcompanycountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontactgovcompanycountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontactgovcompanycountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontactgovcompanycountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontactgovcompanycountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontactgovcompanycountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontactgovcompanycountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontactgovcompanycountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontactgovcompanycountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontactgovcompanycountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontactgovcompanycountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontactgovcompanycountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontactgovcompanycountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontactgovcompanycountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontactgovcompanycountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontactgovcompanycountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontactgovcompanycountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontactgovcompanycountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontactgovcompanycountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontactgovcompanycountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontactgovcompanycountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontactgovcompanycountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontactgovcompanycountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontactgovcompanycountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontactgovcompanycountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontactgovcompanycountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontactgovcompanycountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontactgovcompanycountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontactgovcompanycountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontactgovcompanycountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontactgovcompanycountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontactgovcompanycountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontactgovcompanycountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontactgovcompanycountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontactgovcompanycountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontactgovcompanycountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontactgovcompanycountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontactgovcompanycountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontactgovcompanycountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontactgovcompanycountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontactgovcompanycountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontactgovcompanycountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontactgovcompanycountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontactgovcompanycountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontactgovcompanycountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontactgovcompanycountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontactgovcompanycountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontactgovcompanycountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontactgovcompanycountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontactgovcompanycountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontactgovcompanycountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontactgovcompanycountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontactgovcompanycountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontactgovcompanycountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontactgovcompanycountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontactgovcompanycountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontactgovcompanycountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontactgovcompanycountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontactgovcompanycountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontactgovcompanycountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontactgovcompanycountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontactgovcompanycountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontactgovcompanycountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontactgovcompanycountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontactgovcompanycountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontactgovcompanycountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontactgovcompanycountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontactgovcompanycountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontactgovcompanycountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontactgovcompanycountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontactgovcompanycountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontactgovcompanycountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontactgovcompanycountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontactgovcompanycountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontactgovcompanycountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontactgovcompanycountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontactgovcompanycountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontactgovcompanycountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontactgovcompanycountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontactgovcompanycountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontactgovcompanycountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontactgovcompanycountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontactgovcompanycountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontactgovcompanycountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontactgovcompanycountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontactgovcompanycountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontactgovcompanycountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontactgovcompanycountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontactgovcompanycountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontactgovcompanycountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontactgovcompanycountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontactgovcompanycountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontactgovcompanycountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontactgovcompanycountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontactgovcompanycountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontactgovcompanycountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontactgovcompanycountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontactgovcompanycountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontactgovcompanycountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontactgovcompanycountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontactgovcompanycountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontactgovcompanycountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontactgovcompanycountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontactgovcompanycountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontactgovcompanycountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontactgovcompanycountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontactgovcompanycountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontactgovcompanycountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontactgovcompanycountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontactgovcompanycountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontactgovcompanycountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontactgovcompanycountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontactgovcompanycountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontactgovcompanycountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontactgovcompanycountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontactgovcompanycountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontactgovcompanycountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontactgovcompanycountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontactgovcompanycountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontactgovcompanycountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontactgovcompanycountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontactgovcompanycountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontactgovcompanycountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontactgovcompanycountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontactgovcompanycountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontactgovcompanycountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontactgovcompanycountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontactgovcompanycountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontactgovcompanycountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontactgovcompanycountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontactgovcompanycountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontactgovcompanycountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontactgovcompanycountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontactgovcompanycountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontactgovcompanycountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontactgovcompanycountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontactgovcompanycountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontactgovcompanycountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontactgovcompanycountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontactgovcompanycountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontactgovcompanycountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontactgovcompanycountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontactgovcompanycountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontactgovcompanycountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontactgovcompanycountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontactgovcompanycountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontactgovcompanycountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontactgovcompanycountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontactgovcompanycountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontactgovcompanycountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontactgovcompanycountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontactgovcompanycountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontactgovcompanycountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontactgovcompanycountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontactgovcompanycountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontactgovcompanycountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontactgovcompanycountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontactgovcompanycountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontactgovcompanycountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontactgovcompanycountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontactgovcompanycountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontactgovcompanycountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontactgovcompanycountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontactgovcompanycountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontactgovcompanycountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontactgovcompanycountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontactgovcompanycountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontactgovcompanycountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontactgovcompanycountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontactgovcompanycountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontactgovcompanycountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontactgovcompanycountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontactgovcompanycountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontactgovcompanycountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontactgovcompanycountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontactgovcompanycountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontactgovcompanycountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontactgovcompanycountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovcompanycity">{$LANG.irnicnewcontactprivatecompanycity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovcompanycity" pattern="[a-zA-Z0-9 ]*" id="newcontactgovcompanycity" value="{$smarty.session.newcontactgovcompanycity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovcompanysp">{$LANG.irnicnewcontactgovcompanysp} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovcompanysp" pattern="[a-zA-Z0-9 ]*" id="newcontactgovcompanysp" value="{$smarty.session.newcontactgovcompanysp}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovcompanycategory">{$LANG.irnicnewcontactgovcompanycategory} * </label>
    				<select name="newcontactgovcompanycategory" id="newcontactgovcompanycategory" class="form-control" style="direction: rtl;padding: 0;" required>
    					<option value="" label="لطفا انتخاب کنید...">لطفا انتخاب کنید...</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Leader__Any")}{"selected='selected'"}{/if} value="Leader__Any" label="نهاد رهبری">نهاد رهبری</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Judiciary__Any")}{"selected='selected'"}{/if} value="Judiciary__Any" label="قوه قضائیه">قوه قضائیه</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Legislative__Any")}{"selected='selected'"}{/if} value="Legislative__Any" label="قوه مقننه">قوه مقننه</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__Ministry")}{"selected='selected'"}{/if} value="Executive__Ministry" label="وزارتخانه">وزارتخانه</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__Company")}{"selected='selected'"}{/if} value="Executive__Company" label="شرکت دولتی">شرکت دولتی</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__Organization")}{"selected='selected'"}{/if} value="Executive__Organization" label="سازمان">سازمان</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__President")}{"selected='selected'"}{/if} value="Executive__President" label="نهاد وابسته به ریاست جمهوری">نهاد وابسته به ریاست جمهوری</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__Province")}{"selected='selected'"}{/if} value="Executive__Province" label="استانداری یا فرمانداری">استانداری یا فرمانداری</option>
    					<option {if ($smarty.session.newcontactgovcompanycategory == "Executive__Municipality")}{"selected='selected'"}{/if} value="Executive__Municipality" label="شهرداری">شهرداری</option>
    				</select>			
    			</div>
    		</div>
    	</fieldset>
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontactpersonalplaceinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovcountry">{$LANG.clientareacountry} * </label>
    				<select name="newcontactgovcountry" id="newcontactgovcountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontactgovcountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontactgovcountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontactgovcountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontactgovcountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontactgovcountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontactgovcountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontactgovcountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontactgovcountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontactgovcountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontactgovcountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontactgovcountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontactgovcountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontactgovcountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontactgovcountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontactgovcountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontactgovcountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontactgovcountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontactgovcountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontactgovcountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontactgovcountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontactgovcountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontactgovcountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontactgovcountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontactgovcountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontactgovcountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontactgovcountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontactgovcountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontactgovcountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontactgovcountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontactgovcountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontactgovcountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontactgovcountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontactgovcountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontactgovcountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontactgovcountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontactgovcountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontactgovcountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontactgovcountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontactgovcountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontactgovcountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontactgovcountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontactgovcountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontactgovcountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontactgovcountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontactgovcountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontactgovcountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontactgovcountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontactgovcountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontactgovcountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontactgovcountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontactgovcountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontactgovcountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontactgovcountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontactgovcountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontactgovcountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontactgovcountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontactgovcountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontactgovcountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontactgovcountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontactgovcountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontactgovcountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontactgovcountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontactgovcountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontactgovcountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontactgovcountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontactgovcountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontactgovcountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontactgovcountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontactgovcountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontactgovcountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontactgovcountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontactgovcountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontactgovcountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontactgovcountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontactgovcountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontactgovcountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontactgovcountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontactgovcountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontactgovcountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontactgovcountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontactgovcountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontactgovcountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontactgovcountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontactgovcountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontactgovcountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontactgovcountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontactgovcountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontactgovcountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontactgovcountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontactgovcountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontactgovcountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontactgovcountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontactgovcountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontactgovcountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontactgovcountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontactgovcountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontactgovcountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontactgovcountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontactgovcountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontactgovcountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontactgovcountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontactgovcountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontactgovcountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontactgovcountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontactgovcountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontactgovcountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontactgovcountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontactgovcountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontactgovcountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontactgovcountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontactgovcountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontactgovcountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontactgovcountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontactgovcountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontactgovcountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontactgovcountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontactgovcountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontactgovcountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontactgovcountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontactgovcountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontactgovcountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontactgovcountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontactgovcountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontactgovcountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontactgovcountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontactgovcountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontactgovcountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontactgovcountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontactgovcountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontactgovcountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontactgovcountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontactgovcountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontactgovcountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontactgovcountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontactgovcountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontactgovcountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontactgovcountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontactgovcountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontactgovcountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontactgovcountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontactgovcountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontactgovcountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontactgovcountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontactgovcountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontactgovcountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontactgovcountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontactgovcountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontactgovcountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontactgovcountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontactgovcountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontactgovcountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontactgovcountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontactgovcountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontactgovcountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontactgovcountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontactgovcountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontactgovcountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontactgovcountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontactgovcountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontactgovcountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontactgovcountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontactgovcountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontactgovcountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontactgovcountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontactgovcountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontactgovcountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontactgovcountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontactgovcountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontactgovcountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontactgovcountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontactgovcountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontactgovcountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontactgovcountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontactgovcountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontactgovcountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontactgovcountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontactgovcountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontactgovcountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontactgovcountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontactgovcountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontactgovcountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontactgovcountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontactgovcountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontactgovcountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontactgovcountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontactgovcountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontactgovcountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontactgovcountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontactgovcountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontactgovcountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontactgovcountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontactgovcountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontactgovcountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontactgovcountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontactgovcountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontactgovcountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontactgovcountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontactgovcountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontactgovcountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontactgovcountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontactgovcountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontactgovcountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontactgovcountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontactgovcountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontactgovcountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontactgovcountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontactgovcountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontactgovcountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontactgovcountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontactgovcountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontactgovcountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontactgovcountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontactgovcountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontactgovcountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontactgovcountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontactgovcountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontactgovcountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontactgovcountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontactgovcountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontactgovcountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontactgovcountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontactgovcountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontactgovcountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontactgovcountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontactgovcountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontactgovcountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontactgovcountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontactgovcountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontactgovcountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontactgovcountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontactgovcountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontactgovcountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontactgovcountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontactgovcountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontactgovcountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontactgovcountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontactgovcountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontactgovcountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontactgovcountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontactgovcountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontactgovcountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontactgovcountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontactgovcountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontactgovstate">{$LANG.clientareastate} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovstate" pattern="[a-zA-Z0-9 ]*" id="newcontactgovstate" value="{$smarty.session.newcontactgovstate}" class="form-control" placeholder="{$LANG.newcontactpersonalstateH}" required />
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontactgovcity">{$LANG.clientareacity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovcity" pattern="[a-zA-Z0-9 ]*" id="newcontactgovcity" value="{$smarty.session.newcontactgovcity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovaddress">{$LANG.domaindnsaddress} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactgovaddress" pattern="[a-zA-Z0-9 ,.]*" id="newcontactgovaddress" value="{$smarty.session.newcontactgovaddress}" class="form-control" placeholder="{$LANG.newcontactpersonaladdressH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovpostcode">{$LANG.clientareapostcode} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactgovpostcode" id="newcontactgovpostcode" value="{$smarty.session.newcontactgovpostcode}" class="form-control" placeholder="{$LANG.newcontactpersonalpostcodeH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactgovphone">{$LANG.irnicnewcontactpersonalphone} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactgovphone" id="newcontactgovphone" value="{$smarty.session.newcontactgovphone}" class="form-control" placeholder="{$LANG.newcontactpersonalphoneH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactgovfax">{$LANG.irnicnewcontactpersonalfax}</label>
    				<input type="number" style="direction: ltr;" name="newcontactgovfax" id="newcontactgovfax" value="{$smarty.session.newcontactgovfax}" class="form-control" placeholder="{$LANG.newcontactpersonalfaxH}" />
    			</div>
    		</div>
    	</fieldset>
    	<div class="row">
    		<div class="form-group col-sm-2"></div>
    		<div class="form-group col-sm-4" style="text-align: right;">
    			<span> * {$LANG.irnicnewcontactrequiredfields}</span>
    		</div>
    		<div class="form-group col-sm-4" style="text-align: left;">
    			<input type="submit" value="{$LANG.pwresetsubmit}" class="btn btn-primary" />
    			<a href="irnic-handle.php" class="btn btn-default">{$LANG.cancel}</a>
    			
    		</div>
    		<div class="form-group col-sm-2"></div>
        </div>
    	<input type="hidden" name="submited" value="ok" />
    </form>

{/if}