{if $IrnicTimeError}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$IrnicTimeError}
{else}
	{if $errormessage}
		{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
	{/if}
	{if $successmessage}
		{include file="$template/includes/alert.tpl" type="success" textcenter=true hide=false additionalClasses="my-custom-class" idname="my-alert" msg=$successmessage}
	{/if}
	<p>{$LANG.irnicnewcontactpersonalinfodesc}<br>{$LANG.irnicnewcontactnicircond}</p>
	<form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" role="form">
		<fieldset class="form-group">
			<legend>{$LANG.irnicnewcontactpersonalinfo}</legend>
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalfirstname">{$LANG.clientareafirstname} * </label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalfirstname" pattern="[a-zA-Z ]*" id="newcontactpersonalfirstname" value="{$smarty.session.newcontactpersonalfirstname}" class="form-control" placeholder="{$LANG.newcontactpersonalfirstnameH}" required />
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonallastname">{$LANG.clientarealastname} * </label>
					<input type="text" style="direction: ltr;" name="newcontactpersonallastname" pattern="[a-zA-Z ]*" id="newcontactpersonallastname" value="{$smarty.session.newcontactpersonallastname}" class="form-control" placeholder="{$LANG.newcontactpersonallastnameH}" required />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalcompany">{$LANG.irnicnewcontactpersonalcompany}</label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalcompany" pattern="[a-zA-Z0-9 .,]*" id="newcontactpersonalcompany" value="{$smarty.session.newcontactpersonalcompany}" class="form-control" placeholder="{$LANG.newcontactpersonalcompanyH}" />
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonalemail">{$LANG.supportticketsclientemail} * </label>
					<input type="email" style="direction: ltr;" name="newcontactpersonalemail" id="newcontactpersonalemail" value="{$smarty.session.newcontactpersonalemail}" class="form-control" placeholder="{$LANG.newcontactpersonalemailH}" required />
				</div>
			</div>
		</fieldset>
		<fieldset class="form-group">
			<legend>{$LANG.irnicnewcontactpersonalauthinfo}</legend>
			<p>{$LANG.irnicnewcontactpersonalauthinfodesc}</p>
			 <div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalmellicode">{$LANG.irnicnewcontactpersonalmellicode} * </label>
					<input type="number" style="direction: ltr;" name="newcontactpersonalmellicode" id="newcontactpersonalmellicode" value="{$smarty.session.newcontactpersonalmellicode}" class="form-control" placeholder="{$LANG.newcontactpersonalmellicodeH}" />
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonalpassport">{$LANG.irnicnewcontactpersonalpassport}</label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalpassport" pattern="[a-zA-Z0-9]*" id="newcontactpersonalpassport" value="{$smarty.session.newcontactpersonalpassport}" class="form-control" placeholder="{$LANG.newcontactpersonalpassportH}" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalpassportcc">{$LANG.irnicnewcontactpersonalpassportcc}</label>
					<select name="newcontactpersonalpassportcc" id="newcontactpersonalpassportcc" class="form-control" style="direction: ltr;padding: 0;">
						<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
						<option value="AF" {if ($smarty.session.newcontactpersonalpassportcc == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
						<option value="AL" {if ($smarty.session.newcontactpersonalpassportcc == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
						<option value="DZ" {if ($smarty.session.newcontactpersonalpassportcc == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
						<option value="AS" {if ($smarty.session.newcontactpersonalpassportcc == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
						<option value="AD" {if ($smarty.session.newcontactpersonalpassportcc == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
						<option value="AO" {if ($smarty.session.newcontactpersonalpassportcc == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
						<option value="AI" {if ($smarty.session.newcontactpersonalpassportcc == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
						<option value="AQ" {if ($smarty.session.newcontactpersonalpassportcc == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
						<option value="AG" {if ($smarty.session.newcontactpersonalpassportcc == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
						<option value="AR" {if ($smarty.session.newcontactpersonalpassportcc == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
						<option value="AM" {if ($smarty.session.newcontactpersonalpassportcc == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
						<option value="AW" {if ($smarty.session.newcontactpersonalpassportcc == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
						<option value="AU" {if ($smarty.session.newcontactpersonalpassportcc == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
						<option value="AT" {if ($smarty.session.newcontactpersonalpassportcc == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
						<option value="AZ" {if ($smarty.session.newcontactpersonalpassportcc == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
						<option value="BS" {if ($smarty.session.newcontactpersonalpassportcc == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
						<option value="BH" {if ($smarty.session.newcontactpersonalpassportcc == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
						<option value="BD" {if ($smarty.session.newcontactpersonalpassportcc == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
						<option value="BB" {if ($smarty.session.newcontactpersonalpassportcc == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
						<option value="BY" {if ($smarty.session.newcontactpersonalpassportcc == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
						<option value="BE" {if ($smarty.session.newcontactpersonalpassportcc == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
						<option value="BZ" {if ($smarty.session.newcontactpersonalpassportcc == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
						<option value="BJ" {if ($smarty.session.newcontactpersonalpassportcc == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
						<option value="BM" {if ($smarty.session.newcontactpersonalpassportcc == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
						<option value="BT" {if ($smarty.session.newcontactpersonalpassportcc == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
						<option value="BO" {if ($smarty.session.newcontactpersonalpassportcc == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
						<option value="BA" {if ($smarty.session.newcontactpersonalpassportcc == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
						<option value="BW" {if ($smarty.session.newcontactpersonalpassportcc == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
						<option value="BV" {if ($smarty.session.newcontactpersonalpassportcc == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
						<option value="BR" {if ($smarty.session.newcontactpersonalpassportcc == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
						<option value="IO" {if ($smarty.session.newcontactpersonalpassportcc == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
						<option value="BN" {if ($smarty.session.newcontactpersonalpassportcc == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
						<option value="BG" {if ($smarty.session.newcontactpersonalpassportcc == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
						<option value="BF" {if ($smarty.session.newcontactpersonalpassportcc == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
						<option value="BI" {if ($smarty.session.newcontactpersonalpassportcc == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
						<option value="KH" {if ($smarty.session.newcontactpersonalpassportcc == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
						<option value="CM" {if ($smarty.session.newcontactpersonalpassportcc == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
						<option value="CA" {if ($smarty.session.newcontactpersonalpassportcc == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
						<option value="CV" {if ($smarty.session.newcontactpersonalpassportcc == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
						<option value="KY" {if ($smarty.session.newcontactpersonalpassportcc == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
						<option value="CF" {if ($smarty.session.newcontactpersonalpassportcc == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
						<option value="TD" {if ($smarty.session.newcontactpersonalpassportcc == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
						<option value="CL" {if ($smarty.session.newcontactpersonalpassportcc == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
						<option value="CN" {if ($smarty.session.newcontactpersonalpassportcc == "CN")}{"selected='selected'"}{/if} label="China">China</option>
						<option value="CX" {if ($smarty.session.newcontactpersonalpassportcc == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
						<option value="CC" {if ($smarty.session.newcontactpersonalpassportcc == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
						<option value="CO" {if ($smarty.session.newcontactpersonalpassportcc == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
						<option value="KM" {if ($smarty.session.newcontactpersonalpassportcc == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
						<option value="CG" {if ($smarty.session.newcontactpersonalpassportcc == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
						<option value="CD" {if ($smarty.session.newcontactpersonalpassportcc == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
						<option value="CK" {if ($smarty.session.newcontactpersonalpassportcc == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
						<option value="CR" {if ($smarty.session.newcontactpersonalpassportcc == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
						<option value="CI" {if ($smarty.session.newcontactpersonalpassportcc == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
						<option value="HR" {if ($smarty.session.newcontactpersonalpassportcc == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
						<option value="CU" {if ($smarty.session.newcontactpersonalpassportcc == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
						<option value="CY" {if ($smarty.session.newcontactpersonalpassportcc == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
						<option value="CZ" {if ($smarty.session.newcontactpersonalpassportcc == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
						<option value="CS" {if ($smarty.session.newcontactpersonalpassportcc == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
						<option value="DK" {if ($smarty.session.newcontactpersonalpassportcc == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
						<option value="DJ" {if ($smarty.session.newcontactpersonalpassportcc == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
						<option value="DM" {if ($smarty.session.newcontactpersonalpassportcc == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
						<option value="DO" {if ($smarty.session.newcontactpersonalpassportcc == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
						<option value="TP" {if ($smarty.session.newcontactpersonalpassportcc == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
						<option value="EC" {if ($smarty.session.newcontactpersonalpassportcc == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
						<option value="EG" {if ($smarty.session.newcontactpersonalpassportcc == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
						<option value="SV" {if ($smarty.session.newcontactpersonalpassportcc == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
						<option value="GB" {if ($smarty.session.newcontactpersonalpassportcc == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
						<option value="GQ" {if ($smarty.session.newcontactpersonalpassportcc == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
						<option value="ER" {if ($smarty.session.newcontactpersonalpassportcc == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
						<option value="EE" {if ($smarty.session.newcontactpersonalpassportcc == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
						<option value="ET" {if ($smarty.session.newcontactpersonalpassportcc == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
						<option value="FK" {if ($smarty.session.newcontactpersonalpassportcc == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
						<option value="FO" {if ($smarty.session.newcontactpersonalpassportcc == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
						<option value="FJ" {if ($smarty.session.newcontactpersonalpassportcc == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
						<option value="FI" {if ($smarty.session.newcontactpersonalpassportcc == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
						<option value="FR" {if ($smarty.session.newcontactpersonalpassportcc == "FR")}{"selected='selected'"}{/if} label="France">France</option>
						<option value="GF" {if ($smarty.session.newcontactpersonalpassportcc == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
						<option value="PF" {if ($smarty.session.newcontactpersonalpassportcc == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
						<option value="TF" {if ($smarty.session.newcontactpersonalpassportcc == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
						<option value="GA" {if ($smarty.session.newcontactpersonalpassportcc == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
						<option value="GM" {if ($smarty.session.newcontactpersonalpassportcc == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
						<option value="GE" {if ($smarty.session.newcontactpersonalpassportcc == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
						<option value="DE" {if ($smarty.session.newcontactpersonalpassportcc == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
						<option value="GH" {if ($smarty.session.newcontactpersonalpassportcc == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
						<option value="GI" {if ($smarty.session.newcontactpersonalpassportcc == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
						<option value="GR" {if ($smarty.session.newcontactpersonalpassportcc == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
						<option value="GL" {if ($smarty.session.newcontactpersonalpassportcc == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
						<option value="GD" {if ($smarty.session.newcontactpersonalpassportcc == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
						<option value="GP" {if ($smarty.session.newcontactpersonalpassportcc == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
						<option value="GU" {if ($smarty.session.newcontactpersonalpassportcc == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
						<option value="GT" {if ($smarty.session.newcontactpersonalpassportcc == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
						<option value="GG" {if ($smarty.session.newcontactpersonalpassportcc == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
						<option value="GN" {if ($smarty.session.newcontactpersonalpassportcc == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
						<option value="GW" {if ($smarty.session.newcontactpersonalpassportcc == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
						<option value="GY" {if ($smarty.session.newcontactpersonalpassportcc == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
						<option value="HT" {if ($smarty.session.newcontactpersonalpassportcc == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
						<option value="HM" {if ($smarty.session.newcontactpersonalpassportcc == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
						<option value="HN" {if ($smarty.session.newcontactpersonalpassportcc == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
						<option value="HK" {if ($smarty.session.newcontactpersonalpassportcc == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
						<option value="HU" {if ($smarty.session.newcontactpersonalpassportcc == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
						<option value="IS" {if ($smarty.session.newcontactpersonalpassportcc == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
						<option value="IN" {if ($smarty.session.newcontactpersonalpassportcc == "IN")}{"selected='selected'"}{/if} label="India">India</option>
						<option value="ID" {if ($smarty.session.newcontactpersonalpassportcc == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
						<option value="IQ" {if ($smarty.session.newcontactpersonalpassportcc == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
						<option value="IE" {if ($smarty.session.newcontactpersonalpassportcc == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
						<option value="IM" {if ($smarty.session.newcontactpersonalpassportcc == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
						<option value="IT" {if ($smarty.session.newcontactpersonalpassportcc == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
						<option value="JM" {if ($smarty.session.newcontactpersonalpassportcc == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
						<option value="JP" {if ($smarty.session.newcontactpersonalpassportcc == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
						<option value="JE" {if ($smarty.session.newcontactpersonalpassportcc == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
						<option value="JO" {if ($smarty.session.newcontactpersonalpassportcc == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
						<option value="KZ" {if ($smarty.session.newcontactpersonalpassportcc == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
						<option value="KE" {if ($smarty.session.newcontactpersonalpassportcc == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
						<option value="KI" {if ($smarty.session.newcontactpersonalpassportcc == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
						<option value="KP" {if ($smarty.session.newcontactpersonalpassportcc == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
						<option value="KR" {if ($smarty.session.newcontactpersonalpassportcc == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
						<option value="KW" {if ($smarty.session.newcontactpersonalpassportcc == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
						<option value="KG" {if ($smarty.session.newcontactpersonalpassportcc == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
						<option value="LA" {if ($smarty.session.newcontactpersonalpassportcc == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
						<option value="LV" {if ($smarty.session.newcontactpersonalpassportcc == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
						<option value="LB" {if ($smarty.session.newcontactpersonalpassportcc == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
						<option value="LS" {if ($smarty.session.newcontactpersonalpassportcc == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
						<option value="LR" {if ($smarty.session.newcontactpersonalpassportcc == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
						<option value="LY" {if ($smarty.session.newcontactpersonalpassportcc == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
						<option value="LI" {if ($smarty.session.newcontactpersonalpassportcc == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
						<option value="LT" {if ($smarty.session.newcontactpersonalpassportcc == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
						<option value="LU" {if ($smarty.session.newcontactpersonalpassportcc == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
						<option value="MO" {if ($smarty.session.newcontactpersonalpassportcc == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
						<option value="MK" {if ($smarty.session.newcontactpersonalpassportcc == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
						<option value="MG" {if ($smarty.session.newcontactpersonalpassportcc == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
						<option value="MW" {if ($smarty.session.newcontactpersonalpassportcc == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
						<option value="MY" {if ($smarty.session.newcontactpersonalpassportcc == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
						<option value="MV" {if ($smarty.session.newcontactpersonalpassportcc == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
						<option value="ML" {if ($smarty.session.newcontactpersonalpassportcc == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
						<option value="MT" {if ($smarty.session.newcontactpersonalpassportcc == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
						<option value="MH" {if ($smarty.session.newcontactpersonalpassportcc == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
						<option value="MQ" {if ($smarty.session.newcontactpersonalpassportcc == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
						<option value="MR" {if ($smarty.session.newcontactpersonalpassportcc == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
						<option value="MU" {if ($smarty.session.newcontactpersonalpassportcc == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
						<option value="YT" {if ($smarty.session.newcontactpersonalpassportcc == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
						<option value="MX" {if ($smarty.session.newcontactpersonalpassportcc == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
						<option value="FM" {if ($smarty.session.newcontactpersonalpassportcc == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
						<option value="MD" {if ($smarty.session.newcontactpersonalpassportcc == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
						<option value="MC" {if ($smarty.session.newcontactpersonalpassportcc == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
						<option value="MN" {if ($smarty.session.newcontactpersonalpassportcc == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
						<option value="MS" {if ($smarty.session.newcontactpersonalpassportcc == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
						<option value="MA" {if ($smarty.session.newcontactpersonalpassportcc == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
						<option value="MZ" {if ($smarty.session.newcontactpersonalpassportcc == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
						<option value="MM" {if ($smarty.session.newcontactpersonalpassportcc == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
						<option value="NA" {if ($smarty.session.newcontactpersonalpassportcc == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
						<option value="NR" {if ($smarty.session.newcontactpersonalpassportcc == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
						<option value="NP" {if ($smarty.session.newcontactpersonalpassportcc == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
						<option value="NL" {if ($smarty.session.newcontactpersonalpassportcc == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
						<option value="AN" {if ($smarty.session.newcontactpersonalpassportcc == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
						<option value="NT" {if ($smarty.session.newcontactpersonalpassportcc == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
						<option value="NC" {if ($smarty.session.newcontactpersonalpassportcc == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
						<option value="NZ" {if ($smarty.session.newcontactpersonalpassportcc == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
						<option value="NI" {if ($smarty.session.newcontactpersonalpassportcc == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
						<option value="NE" {if ($smarty.session.newcontactpersonalpassportcc == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
						<option value="NG" {if ($smarty.session.newcontactpersonalpassportcc == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
						<option value="NU" {if ($smarty.session.newcontactpersonalpassportcc == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
						<option value="NF" {if ($smarty.session.newcontactpersonalpassportcc == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
						<option value="MP" {if ($smarty.session.newcontactpersonalpassportcc == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
						<option value="NO" {if ($smarty.session.newcontactpersonalpassportcc == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
						<option value="OM" {if ($smarty.session.newcontactpersonalpassportcc == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
						<option value="PK" {if ($smarty.session.newcontactpersonalpassportcc == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
						<option value="PW" {if ($smarty.session.newcontactpersonalpassportcc == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
						<option value="PA" {if ($smarty.session.newcontactpersonalpassportcc == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
						<option value="PG" {if ($smarty.session.newcontactpersonalpassportcc == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
						<option value="PY" {if ($smarty.session.newcontactpersonalpassportcc == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
						<option value="PE" {if ($smarty.session.newcontactpersonalpassportcc == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
						<option value="PH" {if ($smarty.session.newcontactpersonalpassportcc == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
						<option value="PN" {if ($smarty.session.newcontactpersonalpassportcc == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
						<option value="PL" {if ($smarty.session.newcontactpersonalpassportcc == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
						<option value="PT" {if ($smarty.session.newcontactpersonalpassportcc == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
						<option value="QA" {if ($smarty.session.newcontactpersonalpassportcc == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
						<option value="RE" {if ($smarty.session.newcontactpersonalpassportcc == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
						<option value="RO" {if ($smarty.session.newcontactpersonalpassportcc == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
						<option value="RU" {if ($smarty.session.newcontactpersonalpassportcc == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
						<option value="RW" {if ($smarty.session.newcontactpersonalpassportcc == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
						<option value="SH" {if ($smarty.session.newcontactpersonalpassportcc == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
						<option value="KN" {if ($smarty.session.newcontactpersonalpassportcc == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
						<option value="LC" {if ($smarty.session.newcontactpersonalpassportcc == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
						<option value="PM" {if ($smarty.session.newcontactpersonalpassportcc == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
						<option value="VC" {if ($smarty.session.newcontactpersonalpassportcc == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
						<option value="WS" {if ($smarty.session.newcontactpersonalpassportcc == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
						<option value="SM" {if ($smarty.session.newcontactpersonalpassportcc == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
						<option value="ST" {if ($smarty.session.newcontactpersonalpassportcc == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
						<option value="SA" {if ($smarty.session.newcontactpersonalpassportcc == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
						<option value="SN" {if ($smarty.session.newcontactpersonalpassportcc == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
						<option value="SC" {if ($smarty.session.newcontactpersonalpassportcc == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
						<option value="SL" {if ($smarty.session.newcontactpersonalpassportcc == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
						<option value="SG" {if ($smarty.session.newcontactpersonalpassportcc == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
						<option value="SK" {if ($smarty.session.newcontactpersonalpassportcc == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
						<option value="SI" {if ($smarty.session.newcontactpersonalpassportcc == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
						<option value="SB" {if ($smarty.session.newcontactpersonalpassportcc == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
						<option value="SO" {if ($smarty.session.newcontactpersonalpassportcc == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
						<option value="ZA" {if ($smarty.session.newcontactpersonalpassportcc == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
						<option value="GS" {if ($smarty.session.newcontactpersonalpassportcc == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
						<option value="ES" {if ($smarty.session.newcontactpersonalpassportcc == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
						<option value="LK" {if ($smarty.session.newcontactpersonalpassportcc == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
						<option value="SD" {if ($smarty.session.newcontactpersonalpassportcc == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
						<option value="SR" {if ($smarty.session.newcontactpersonalpassportcc == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
						<option value="SJ" {if ($smarty.session.newcontactpersonalpassportcc == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
						<option value="SZ" {if ($smarty.session.newcontactpersonalpassportcc == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
						<option value="SE" {if ($smarty.session.newcontactpersonalpassportcc == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
						<option value="CH" {if ($smarty.session.newcontactpersonalpassportcc == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
						<option value="SY" {if ($smarty.session.newcontactpersonalpassportcc == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
						<option value="TW" {if ($smarty.session.newcontactpersonalpassportcc == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
						<option value="TJ" {if ($smarty.session.newcontactpersonalpassportcc == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
						<option value="TZ" {if ($smarty.session.newcontactpersonalpassportcc == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
						<option value="TH" {if ($smarty.session.newcontactpersonalpassportcc == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
						<option value="TG" {if ($smarty.session.newcontactpersonalpassportcc == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
						<option value="TK" {if ($smarty.session.newcontactpersonalpassportcc == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
						<option value="TO" {if ($smarty.session.newcontactpersonalpassportcc == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
						<option value="TT" {if ($smarty.session.newcontactpersonalpassportcc == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
						<option value="TN" {if ($smarty.session.newcontactpersonalpassportcc == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
						<option value="TR" {if ($smarty.session.newcontactpersonalpassportcc == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
						<option value="TM" {if ($smarty.session.newcontactpersonalpassportcc == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
						<option value="TC" {if ($smarty.session.newcontactpersonalpassportcc == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
						<option value="TV" {if ($smarty.session.newcontactpersonalpassportcc == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
						<option value="UG" {if ($smarty.session.newcontactpersonalpassportcc == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
						<option value="UA" {if ($smarty.session.newcontactpersonalpassportcc == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
						<option value="AE" {if ($smarty.session.newcontactpersonalpassportcc == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
						<option value="UK" {if ($smarty.session.newcontactpersonalpassportcc == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
						<option value="US" {if ($smarty.session.newcontactpersonalpassportcc == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
						<option value="UM" {if ($smarty.session.newcontactpersonalpassportcc == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
						<option value="UY" {if ($smarty.session.newcontactpersonalpassportcc == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
						<option value="SU" {if ($smarty.session.newcontactpersonalpassportcc == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
						<option value="UZ" {if ($smarty.session.newcontactpersonalpassportcc == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
						<option value="VU" {if ($smarty.session.newcontactpersonalpassportcc == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
						<option value="VA" {if ($smarty.session.newcontactpersonalpassportcc == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
						<option value="VE" {if ($smarty.session.newcontactpersonalpassportcc == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
						<option value="VN" {if ($smarty.session.newcontactpersonalpassportcc == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
						<option value="VG" {if ($smarty.session.newcontactpersonalpassportcc == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
						<option value="VI" {if ($smarty.session.newcontactpersonalpassportcc == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
						<option value="WF" {if ($smarty.session.newcontactpersonalpassportcc == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
						<option value="EH" {if ($smarty.session.newcontactpersonalpassportcc == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
						<option value="YE" {if ($smarty.session.newcontactpersonalpassportcc == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
						<option value="YU" {if ($smarty.session.newcontactpersonalpassportcc == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
						<option value="ZR" {if ($smarty.session.newcontactpersonalpassportcc == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
						<option value="ZM" {if ($smarty.session.newcontactpersonalpassportcc == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
						<option value="ZW" {if ($smarty.session.newcontactpersonalpassportcc == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
					</select>
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonalpassportissuer">{$LANG.irnicnewcontactpersonalpassportissuer}</label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalpassportissuer" pattern="[a-zA-Z0-9 ]*" id="newcontactpersonalpassportissuer" value="{$smarty.session.newcontactpersonalpassportissuer}" class="form-control" placeholder="{$LANG.newcontactpersonalpassportissuerH}" />
				</div>
			</div>
		</fieldset>
		<fieldset class="form-group">
			<legend>{$LANG.irnicnewcontactpersonalplaceinfo}</legend>
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalcountry">{$LANG.clientareacountry} * </label>
					<select name="newcontactpersonalcountry" id="newcontactpersonalcountry" class="form-control" style="direction: ltr;padding: 0;">
						<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
						<option value="AF" {if ($smarty.session.newcontactpersonalcountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
						<option value="AL" {if ($smarty.session.newcontactpersonalcountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
						<option value="DZ" {if ($smarty.session.newcontactpersonalcountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
						<option value="AS" {if ($smarty.session.newcontactpersonalcountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
						<option value="AD" {if ($smarty.session.newcontactpersonalcountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
						<option value="AO" {if ($smarty.session.newcontactpersonalcountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
						<option value="AI" {if ($smarty.session.newcontactpersonalcountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
						<option value="AQ" {if ($smarty.session.newcontactpersonalcountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
						<option value="AG" {if ($smarty.session.newcontactpersonalcountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
						<option value="AR" {if ($smarty.session.newcontactpersonalcountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
						<option value="AM" {if ($smarty.session.newcontactpersonalcountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
						<option value="AW" {if ($smarty.session.newcontactpersonalcountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
						<option value="AU" {if ($smarty.session.newcontactpersonalcountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
						<option value="AT" {if ($smarty.session.newcontactpersonalcountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
						<option value="AZ" {if ($smarty.session.newcontactpersonalcountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
						<option value="BS" {if ($smarty.session.newcontactpersonalcountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
						<option value="BH" {if ($smarty.session.newcontactpersonalcountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
						<option value="BD" {if ($smarty.session.newcontactpersonalcountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
						<option value="BB" {if ($smarty.session.newcontactpersonalcountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
						<option value="BY" {if ($smarty.session.newcontactpersonalcountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
						<option value="BE" {if ($smarty.session.newcontactpersonalcountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
						<option value="BZ" {if ($smarty.session.newcontactpersonalcountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
						<option value="BJ" {if ($smarty.session.newcontactpersonalcountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
						<option value="BM" {if ($smarty.session.newcontactpersonalcountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
						<option value="BT" {if ($smarty.session.newcontactpersonalcountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
						<option value="BO" {if ($smarty.session.newcontactpersonalcountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
						<option value="BA" {if ($smarty.session.newcontactpersonalcountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
						<option value="BW" {if ($smarty.session.newcontactpersonalcountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
						<option value="BV" {if ($smarty.session.newcontactpersonalcountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
						<option value="BR" {if ($smarty.session.newcontactpersonalcountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
						<option value="IO" {if ($smarty.session.newcontactpersonalcountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
						<option value="BN" {if ($smarty.session.newcontactpersonalcountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
						<option value="BG" {if ($smarty.session.newcontactpersonalcountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
						<option value="BF" {if ($smarty.session.newcontactpersonalcountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
						<option value="BI" {if ($smarty.session.newcontactpersonalcountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
						<option value="KH" {if ($smarty.session.newcontactpersonalcountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
						<option value="CM" {if ($smarty.session.newcontactpersonalcountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
						<option value="CA" {if ($smarty.session.newcontactpersonalcountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
						<option value="CV" {if ($smarty.session.newcontactpersonalcountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
						<option value="KY" {if ($smarty.session.newcontactpersonalcountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
						<option value="CF" {if ($smarty.session.newcontactpersonalcountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
						<option value="TD" {if ($smarty.session.newcontactpersonalcountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
						<option value="CL" {if ($smarty.session.newcontactpersonalcountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
						<option value="CN" {if ($smarty.session.newcontactpersonalcountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
						<option value="CX" {if ($smarty.session.newcontactpersonalcountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
						<option value="CC" {if ($smarty.session.newcontactpersonalcountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
						<option value="CO" {if ($smarty.session.newcontactpersonalcountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
						<option value="KM" {if ($smarty.session.newcontactpersonalcountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
						<option value="CG" {if ($smarty.session.newcontactpersonalcountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
						<option value="CD" {if ($smarty.session.newcontactpersonalcountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
						<option value="CK" {if ($smarty.session.newcontactpersonalcountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
						<option value="CR" {if ($smarty.session.newcontactpersonalcountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
						<option value="CI" {if ($smarty.session.newcontactpersonalcountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
						<option value="HR" {if ($smarty.session.newcontactpersonalcountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
						<option value="CU" {if ($smarty.session.newcontactpersonalcountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
						<option value="CY" {if ($smarty.session.newcontactpersonalcountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
						<option value="CZ" {if ($smarty.session.newcontactpersonalcountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
						<option value="CS" {if ($smarty.session.newcontactpersonalcountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
						<option value="DK" {if ($smarty.session.newcontactpersonalcountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
						<option value="DJ" {if ($smarty.session.newcontactpersonalcountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
						<option value="DM" {if ($smarty.session.newcontactpersonalcountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
						<option value="DO" {if ($smarty.session.newcontactpersonalcountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
						<option value="TP" {if ($smarty.session.newcontactpersonalcountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
						<option value="EC" {if ($smarty.session.newcontactpersonalcountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
						<option value="EG" {if ($smarty.session.newcontactpersonalcountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
						<option value="SV" {if ($smarty.session.newcontactpersonalcountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
						<option value="GB" {if ($smarty.session.newcontactpersonalcountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
						<option value="GQ" {if ($smarty.session.newcontactpersonalcountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
						<option value="ER" {if ($smarty.session.newcontactpersonalcountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
						<option value="EE" {if ($smarty.session.newcontactpersonalcountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
						<option value="ET" {if ($smarty.session.newcontactpersonalcountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
						<option value="FK" {if ($smarty.session.newcontactpersonalcountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
						<option value="FO" {if ($smarty.session.newcontactpersonalcountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
						<option value="FJ" {if ($smarty.session.newcontactpersonalcountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
						<option value="FI" {if ($smarty.session.newcontactpersonalcountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
						<option value="FR" {if ($smarty.session.newcontactpersonalcountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
						<option value="GF" {if ($smarty.session.newcontactpersonalcountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
						<option value="PF" {if ($smarty.session.newcontactpersonalcountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
						<option value="TF" {if ($smarty.session.newcontactpersonalcountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
						<option value="GA" {if ($smarty.session.newcontactpersonalcountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
						<option value="GM" {if ($smarty.session.newcontactpersonalcountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
						<option value="GE" {if ($smarty.session.newcontactpersonalcountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
						<option value="DE" {if ($smarty.session.newcontactpersonalcountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
						<option value="GH" {if ($smarty.session.newcontactpersonalcountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
						<option value="GI" {if ($smarty.session.newcontactpersonalcountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
						<option value="GR" {if ($smarty.session.newcontactpersonalcountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
						<option value="GL" {if ($smarty.session.newcontactpersonalcountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
						<option value="GD" {if ($smarty.session.newcontactpersonalcountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
						<option value="GP" {if ($smarty.session.newcontactpersonalcountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
						<option value="GU" {if ($smarty.session.newcontactpersonalcountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
						<option value="GT" {if ($smarty.session.newcontactpersonalcountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
						<option value="GG" {if ($smarty.session.newcontactpersonalcountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
						<option value="GN" {if ($smarty.session.newcontactpersonalcountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
						<option value="GW" {if ($smarty.session.newcontactpersonalcountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
						<option value="GY" {if ($smarty.session.newcontactpersonalcountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
						<option value="HT" {if ($smarty.session.newcontactpersonalcountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
						<option value="HM" {if ($smarty.session.newcontactpersonalcountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
						<option value="HN" {if ($smarty.session.newcontactpersonalcountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
						<option value="HK" {if ($smarty.session.newcontactpersonalcountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
						<option value="HU" {if ($smarty.session.newcontactpersonalcountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
						<option value="IS" {if ($smarty.session.newcontactpersonalcountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
						<option value="IN" {if ($smarty.session.newcontactpersonalcountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
						<option value="ID" {if ($smarty.session.newcontactpersonalcountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
						<option value="IQ" {if ($smarty.session.newcontactpersonalcountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
						<option value="IE" {if ($smarty.session.newcontactpersonalcountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
						<option value="IM" {if ($smarty.session.newcontactpersonalcountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
						<option value="IT" {if ($smarty.session.newcontactpersonalcountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
						<option value="JM" {if ($smarty.session.newcontactpersonalcountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
						<option value="JP" {if ($smarty.session.newcontactpersonalcountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
						<option value="JE" {if ($smarty.session.newcontactpersonalcountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
						<option value="JO" {if ($smarty.session.newcontactpersonalcountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
						<option value="KZ" {if ($smarty.session.newcontactpersonalcountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
						<option value="KE" {if ($smarty.session.newcontactpersonalcountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
						<option value="KI" {if ($smarty.session.newcontactpersonalcountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
						<option value="KP" {if ($smarty.session.newcontactpersonalcountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
						<option value="KR" {if ($smarty.session.newcontactpersonalcountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
						<option value="KW" {if ($smarty.session.newcontactpersonalcountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
						<option value="KG" {if ($smarty.session.newcontactpersonalcountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
						<option value="LA" {if ($smarty.session.newcontactpersonalcountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
						<option value="LV" {if ($smarty.session.newcontactpersonalcountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
						<option value="LB" {if ($smarty.session.newcontactpersonalcountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
						<option value="LS" {if ($smarty.session.newcontactpersonalcountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
						<option value="LR" {if ($smarty.session.newcontactpersonalcountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
						<option value="LY" {if ($smarty.session.newcontactpersonalcountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
						<option value="LI" {if ($smarty.session.newcontactpersonalcountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
						<option value="LT" {if ($smarty.session.newcontactpersonalcountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
						<option value="LU" {if ($smarty.session.newcontactpersonalcountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
						<option value="MO" {if ($smarty.session.newcontactpersonalcountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
						<option value="MK" {if ($smarty.session.newcontactpersonalcountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
						<option value="MG" {if ($smarty.session.newcontactpersonalcountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
						<option value="MW" {if ($smarty.session.newcontactpersonalcountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
						<option value="MY" {if ($smarty.session.newcontactpersonalcountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
						<option value="MV" {if ($smarty.session.newcontactpersonalcountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
						<option value="ML" {if ($smarty.session.newcontactpersonalcountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
						<option value="MT" {if ($smarty.session.newcontactpersonalcountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
						<option value="MH" {if ($smarty.session.newcontactpersonalcountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
						<option value="MQ" {if ($smarty.session.newcontactpersonalcountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
						<option value="MR" {if ($smarty.session.newcontactpersonalcountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
						<option value="MU" {if ($smarty.session.newcontactpersonalcountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
						<option value="YT" {if ($smarty.session.newcontactpersonalcountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
						<option value="MX" {if ($smarty.session.newcontactpersonalcountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
						<option value="FM" {if ($smarty.session.newcontactpersonalcountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
						<option value="MD" {if ($smarty.session.newcontactpersonalcountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
						<option value="MC" {if ($smarty.session.newcontactpersonalcountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
						<option value="MN" {if ($smarty.session.newcontactpersonalcountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
						<option value="MS" {if ($smarty.session.newcontactpersonalcountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
						<option value="MA" {if ($smarty.session.newcontactpersonalcountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
						<option value="MZ" {if ($smarty.session.newcontactpersonalcountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
						<option value="MM" {if ($smarty.session.newcontactpersonalcountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
						<option value="NA" {if ($smarty.session.newcontactpersonalcountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
						<option value="NR" {if ($smarty.session.newcontactpersonalcountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
						<option value="NP" {if ($smarty.session.newcontactpersonalcountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
						<option value="NL" {if ($smarty.session.newcontactpersonalcountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
						<option value="AN" {if ($smarty.session.newcontactpersonalcountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
						<option value="NT" {if ($smarty.session.newcontactpersonalcountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
						<option value="NC" {if ($smarty.session.newcontactpersonalcountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
						<option value="NZ" {if ($smarty.session.newcontactpersonalcountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
						<option value="NI" {if ($smarty.session.newcontactpersonalcountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
						<option value="NE" {if ($smarty.session.newcontactpersonalcountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
						<option value="NG" {if ($smarty.session.newcontactpersonalcountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
						<option value="NU" {if ($smarty.session.newcontactpersonalcountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
						<option value="NF" {if ($smarty.session.newcontactpersonalcountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
						<option value="MP" {if ($smarty.session.newcontactpersonalcountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
						<option value="NO" {if ($smarty.session.newcontactpersonalcountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
						<option value="OM" {if ($smarty.session.newcontactpersonalcountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
						<option value="PK" {if ($smarty.session.newcontactpersonalcountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
						<option value="PW" {if ($smarty.session.newcontactpersonalcountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
						<option value="PA" {if ($smarty.session.newcontactpersonalcountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
						<option value="PG" {if ($smarty.session.newcontactpersonalcountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
						<option value="PY" {if ($smarty.session.newcontactpersonalcountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
						<option value="PE" {if ($smarty.session.newcontactpersonalcountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
						<option value="PH" {if ($smarty.session.newcontactpersonalcountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
						<option value="PN" {if ($smarty.session.newcontactpersonalcountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
						<option value="PL" {if ($smarty.session.newcontactpersonalcountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
						<option value="PT" {if ($smarty.session.newcontactpersonalcountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
						<option value="QA" {if ($smarty.session.newcontactpersonalcountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
						<option value="RE" {if ($smarty.session.newcontactpersonalcountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
						<option value="RO" {if ($smarty.session.newcontactpersonalcountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
						<option value="RU" {if ($smarty.session.newcontactpersonalcountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
						<option value="RW" {if ($smarty.session.newcontactpersonalcountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
						<option value="SH" {if ($smarty.session.newcontactpersonalcountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
						<option value="KN" {if ($smarty.session.newcontactpersonalcountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
						<option value="LC" {if ($smarty.session.newcontactpersonalcountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
						<option value="PM" {if ($smarty.session.newcontactpersonalcountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
						<option value="VC" {if ($smarty.session.newcontactpersonalcountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
						<option value="WS" {if ($smarty.session.newcontactpersonalcountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
						<option value="SM" {if ($smarty.session.newcontactpersonalcountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
						<option value="ST" {if ($smarty.session.newcontactpersonalcountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
						<option value="SA" {if ($smarty.session.newcontactpersonalcountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
						<option value="SN" {if ($smarty.session.newcontactpersonalcountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
						<option value="SC" {if ($smarty.session.newcontactpersonalcountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
						<option value="SL" {if ($smarty.session.newcontactpersonalcountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
						<option value="SG" {if ($smarty.session.newcontactpersonalcountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
						<option value="SK" {if ($smarty.session.newcontactpersonalcountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
						<option value="SI" {if ($smarty.session.newcontactpersonalcountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
						<option value="SB" {if ($smarty.session.newcontactpersonalcountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
						<option value="SO" {if ($smarty.session.newcontactpersonalcountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
						<option value="ZA" {if ($smarty.session.newcontactpersonalcountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
						<option value="GS" {if ($smarty.session.newcontactpersonalcountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
						<option value="ES" {if ($smarty.session.newcontactpersonalcountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
						<option value="LK" {if ($smarty.session.newcontactpersonalcountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
						<option value="SD" {if ($smarty.session.newcontactpersonalcountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
						<option value="SR" {if ($smarty.session.newcontactpersonalcountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
						<option value="SJ" {if ($smarty.session.newcontactpersonalcountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
						<option value="SZ" {if ($smarty.session.newcontactpersonalcountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
						<option value="SE" {if ($smarty.session.newcontactpersonalcountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
						<option value="CH" {if ($smarty.session.newcontactpersonalcountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
						<option value="SY" {if ($smarty.session.newcontactpersonalcountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
						<option value="TW" {if ($smarty.session.newcontactpersonalcountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
						<option value="TJ" {if ($smarty.session.newcontactpersonalcountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
						<option value="TZ" {if ($smarty.session.newcontactpersonalcountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
						<option value="TH" {if ($smarty.session.newcontactpersonalcountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
						<option value="TG" {if ($smarty.session.newcontactpersonalcountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
						<option value="TK" {if ($smarty.session.newcontactpersonalcountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
						<option value="TO" {if ($smarty.session.newcontactpersonalcountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
						<option value="TT" {if ($smarty.session.newcontactpersonalcountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
						<option value="TN" {if ($smarty.session.newcontactpersonalcountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
						<option value="TR" {if ($smarty.session.newcontactpersonalcountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
						<option value="TM" {if ($smarty.session.newcontactpersonalcountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
						<option value="TC" {if ($smarty.session.newcontactpersonalcountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
						<option value="TV" {if ($smarty.session.newcontactpersonalcountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
						<option value="UG" {if ($smarty.session.newcontactpersonalcountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
						<option value="UA" {if ($smarty.session.newcontactpersonalcountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
						<option value="AE" {if ($smarty.session.newcontactpersonalcountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
						<option value="UK" {if ($smarty.session.newcontactpersonalcountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
						<option value="US" {if ($smarty.session.newcontactpersonalcountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
						<option value="UM" {if ($smarty.session.newcontactpersonalcountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
						<option value="UY" {if ($smarty.session.newcontactpersonalcountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
						<option value="SU" {if ($smarty.session.newcontactpersonalcountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
						<option value="UZ" {if ($smarty.session.newcontactpersonalcountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
						<option value="VU" {if ($smarty.session.newcontactpersonalcountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
						<option value="VA" {if ($smarty.session.newcontactpersonalcountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
						<option value="VE" {if ($smarty.session.newcontactpersonalcountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
						<option value="VN" {if ($smarty.session.newcontactpersonalcountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
						<option value="VG" {if ($smarty.session.newcontactpersonalcountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
						<option value="VI" {if ($smarty.session.newcontactpersonalcountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
						<option value="WF" {if ($smarty.session.newcontactpersonalcountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
						<option value="EH" {if ($smarty.session.newcontactpersonalcountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
						<option value="YE" {if ($smarty.session.newcontactpersonalcountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
						<option value="YU" {if ($smarty.session.newcontactpersonalcountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
						<option value="ZR" {if ($smarty.session.newcontactpersonalcountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
						<option value="ZM" {if ($smarty.session.newcontactpersonalcountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
						<option value="ZW" {if ($smarty.session.newcontactpersonalcountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
					</select>
				</div>
				<div class="form-group col-sm-2">
					<label for="newcontactpersonalstate">{$LANG.clientareastate} * </label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalstate" pattern="[a-zA-Z0-9 ]*" id="newcontactpersonalstate" value="{$smarty.session.newcontactpersonalstate}" class="form-control" placeholder="{$LANG.newcontactpersonalstateH}" required />
				</div>
				<div class="form-group col-sm-2">
					<label for="newcontactpersonalcity">{$LANG.clientareacity} * </label>
					<input type="text" style="direction: ltr;" name="newcontactpersonalcity" pattern="[a-zA-Z0-9 ]*" id="newcontactpersonalcity" value="{$smarty.session.newcontactpersonalcity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonaladdress">{$LANG.domaindnsaddress} * </label>
					<input type="text" style="direction: ltr;" name="newcontactpersonaladdress" pattern="[a-zA-Z0-9 ,.]*" id="newcontactpersonaladdress" value="{$smarty.session.newcontactpersonaladdress}" class="form-control" placeholder="{$LANG.newcontactpersonaladdressH}" required />
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonalpostcode">{$LANG.clientareapostcode} * </label>
					<input type="number" style="direction: ltr;" name="newcontactpersonalpostcode" id="newcontactpersonalpostcode" value="{$smarty.session.newcontactpersonalpostcode}" class="form-control" placeholder="{$LANG.newcontactpersonalpostcodeH}" required />
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-sm-4 col-sm-offset-2">
					<label for="newcontactpersonalphone">{$LANG.irnicnewcontactpersonalphone} * </label>
					<input type="number" style="direction: ltr;" name="newcontactpersonalphone" id="newcontactpersonalphone" value="{$smarty.session.newcontactpersonalphone}" class="form-control" placeholder="{$LANG.newcontactpersonalphoneH}" required />
				</div>
				<div class="form-group col-sm-4">
					<label for="newcontactpersonalfax">{$LANG.irnicnewcontactpersonalfax}</label>
					<input type="number" style="direction: ltr;" name="newcontactpersonalfax" id="newcontactpersonalfax" value="{$smarty.session.newcontactpersonalfax}" class="form-control" placeholder="{$LANG.newcontactpersonalfaxH}" />
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
