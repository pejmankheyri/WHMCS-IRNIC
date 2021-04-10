{if $IrnicTimeError}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$IrnicTimeError}
{else}
    {if $errormessage}
    	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    {if $successmessage}
    	{include file="$template/includes/alert.tpl" type="success" textcenter=true hide=false additionalClasses="my-custom-class" idname="my-alert" msg=$successmessage}
    {/if}
    <p>{$LANG.irnicnewcontactpersonalinfodesc}<br>{$LANG.irnicnewcontactprivateinfodesc}<br>{$LANG.irnicnewcontactnicircond}</p>
    <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" role="form">
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontactprivateinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivateceofname">{$LANG.irnicnewcontactprivateceofname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivateceofname" pattern="[a-zA-Z ]*" id="newcontactprivateceofname" value="{$smarty.session.newcontactprivateceofname}" class="form-control" placeholder="{$LANG.newcontactpersonalfirstnameH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivateceolname">{$LANG.irnicnewcontactprivateceolname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivateceolname" pattern="[a-zA-Z ]*" id="newcontactprivateceolname" value="{$smarty.session.newcontactprivateceolname}" class="form-control" placeholder="{$LANG.newcontactpersonallastnameH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatecompanyname">{$LANG.irnicnewcontactprivatecompanyname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivatecompanyname" pattern="[a-zA-Z0-9 .,]*" id="newcontactprivatecompanyname" value="{$smarty.session.newcontactprivatecompanyname}" class="form-control" placeholder="{$LANG.newcontactpersonalcompanyH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatecompanyemail">{$LANG.supportticketsclientemail} * </label>
    				<input type="email" style="direction: ltr;" name="newcontactprivatecompanyemail" id="newcontactprivatecompanyemail" value="{$smarty.session.newcontactprivatecompanyemail}" class="form-control" placeholder="{$LANG.newcontactpersonalemailH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatecompanycountry">{$LANG.irnicnewcontactprivatecompanycountry} * </label>
    				<select name="newcontactprivatecompanycountry" id="newcontactprivatecompanycountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontactprivatecompanycountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontactprivatecompanycountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontactprivatecompanycountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontactprivatecompanycountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontactprivatecompanycountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontactprivatecompanycountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontactprivatecompanycountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontactprivatecompanycountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontactprivatecompanycountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontactprivatecompanycountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontactprivatecompanycountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontactprivatecompanycountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontactprivatecompanycountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontactprivatecompanycountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontactprivatecompanycountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontactprivatecompanycountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontactprivatecompanycountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontactprivatecompanycountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontactprivatecompanycountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontactprivatecompanycountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontactprivatecompanycountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontactprivatecompanycountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontactprivatecompanycountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontactprivatecompanycountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontactprivatecompanycountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontactprivatecompanycountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontactprivatecompanycountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontactprivatecompanycountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontactprivatecompanycountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontactprivatecompanycountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontactprivatecompanycountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontactprivatecompanycountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontactprivatecompanycountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontactprivatecompanycountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontactprivatecompanycountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontactprivatecompanycountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontactprivatecompanycountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontactprivatecompanycountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontactprivatecompanycountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontactprivatecompanycountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontactprivatecompanycountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontactprivatecompanycountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontactprivatecompanycountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontactprivatecompanycountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontactprivatecompanycountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontactprivatecompanycountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontactprivatecompanycountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontactprivatecompanycountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontactprivatecompanycountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontactprivatecompanycountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontactprivatecompanycountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontactprivatecompanycountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontactprivatecompanycountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontactprivatecompanycountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontactprivatecompanycountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontactprivatecompanycountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontactprivatecompanycountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontactprivatecompanycountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontactprivatecompanycountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontactprivatecompanycountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontactprivatecompanycountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontactprivatecompanycountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontactprivatecompanycountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontactprivatecompanycountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontactprivatecompanycountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontactprivatecompanycountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontactprivatecompanycountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontactprivatecompanycountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontactprivatecompanycountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontactprivatecompanycountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontactprivatecompanycountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontactprivatecompanycountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontactprivatecompanycountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontactprivatecompanycountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontactprivatecompanycountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontactprivatecompanycountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontactprivatecompanycountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontactprivatecompanycountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontactprivatecompanycountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontactprivatecompanycountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontactprivatecompanycountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontactprivatecompanycountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontactprivatecompanycountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontactprivatecompanycountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontactprivatecompanycountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontactprivatecompanycountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontactprivatecompanycountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontactprivatecompanycountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontactprivatecompanycountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontactprivatecompanycountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontactprivatecompanycountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontactprivatecompanycountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontactprivatecompanycountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontactprivatecompanycountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontactprivatecompanycountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontactprivatecompanycountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontactprivatecompanycountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontactprivatecompanycountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontactprivatecompanycountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontactprivatecompanycountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontactprivatecompanycountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontactprivatecompanycountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontactprivatecompanycountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontactprivatecompanycountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontactprivatecompanycountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontactprivatecompanycountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontactprivatecompanycountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontactprivatecompanycountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontactprivatecompanycountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontactprivatecompanycountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontactprivatecompanycountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontactprivatecompanycountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontactprivatecompanycountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontactprivatecompanycountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontactprivatecompanycountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontactprivatecompanycountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontactprivatecompanycountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontactprivatecompanycountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontactprivatecompanycountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontactprivatecompanycountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontactprivatecompanycountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontactprivatecompanycountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontactprivatecompanycountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontactprivatecompanycountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontactprivatecompanycountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontactprivatecompanycountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontactprivatecompanycountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontactprivatecompanycountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontactprivatecompanycountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontactprivatecompanycountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontactprivatecompanycountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontactprivatecompanycountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontactprivatecompanycountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontactprivatecompanycountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontactprivatecompanycountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontactprivatecompanycountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontactprivatecompanycountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontactprivatecompanycountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontactprivatecompanycountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontactprivatecompanycountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontactprivatecompanycountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontactprivatecompanycountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontactprivatecompanycountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontactprivatecompanycountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontactprivatecompanycountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontactprivatecompanycountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontactprivatecompanycountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontactprivatecompanycountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontactprivatecompanycountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontactprivatecompanycountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontactprivatecompanycountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontactprivatecompanycountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontactprivatecompanycountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontactprivatecompanycountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontactprivatecompanycountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontactprivatecompanycountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontactprivatecompanycountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontactprivatecompanycountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontactprivatecompanycountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontactprivatecompanycountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontactprivatecompanycountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontactprivatecompanycountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontactprivatecompanycountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontactprivatecompanycountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontactprivatecompanycountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontactprivatecompanycountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontactprivatecompanycountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontactprivatecompanycountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontactprivatecompanycountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontactprivatecompanycountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontactprivatecompanycountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontactprivatecompanycountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontactprivatecompanycountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontactprivatecompanycountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontactprivatecompanycountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontactprivatecompanycountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontactprivatecompanycountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontactprivatecompanycountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontactprivatecompanycountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontactprivatecompanycountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontactprivatecompanycountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontactprivatecompanycountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontactprivatecompanycountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontactprivatecompanycountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontactprivatecompanycountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontactprivatecompanycountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontactprivatecompanycountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontactprivatecompanycountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontactprivatecompanycountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontactprivatecompanycountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontactprivatecompanycountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontactprivatecompanycountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontactprivatecompanycountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontactprivatecompanycountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontactprivatecompanycountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontactprivatecompanycountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontactprivatecompanycountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontactprivatecompanycountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontactprivatecompanycountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontactprivatecompanycountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontactprivatecompanycountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontactprivatecompanycountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontactprivatecompanycountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontactprivatecompanycountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontactprivatecompanycountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontactprivatecompanycountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontactprivatecompanycountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontactprivatecompanycountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontactprivatecompanycountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontactprivatecompanycountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontactprivatecompanycountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontactprivatecompanycountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontactprivatecompanycountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontactprivatecompanycountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontactprivatecompanycountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontactprivatecompanycountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontactprivatecompanycountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontactprivatecompanycountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontactprivatecompanycountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontactprivatecompanycountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontactprivatecompanycountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontactprivatecompanycountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontactprivatecompanycountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontactprivatecompanycountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontactprivatecompanycountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontactprivatecompanycountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontactprivatecompanycountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontactprivatecompanycountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontactprivatecompanycountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontactprivatecompanycountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontactprivatecompanycountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontactprivatecompanycountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontactprivatecompanycountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontactprivatecompanycountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontactprivatecompanycountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontactprivatecompanycountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontactprivatecompanycountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontactprivatecompanycountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontactprivatecompanycountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontactprivatecompanycountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontactprivatecompanycountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontactprivatecompanycountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontactprivatecompanycountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatecompanycity">{$LANG.irnicnewcontactprivatecompanycity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivatecompanycity" pattern="[a-zA-Z0-9 ]*" id="newcontactprivatecompanycity" value="{$smarty.session.newcontactprivatecompanycity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatecompanyissuer">{$LANG.irnicnewcontactprivatecompanyissuer} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivatecompanyissuer" pattern="[a-zA-Z0-9 ]*" id="newcontactprivatecompanyissuer" value="{$smarty.session.newcontactprivatecompanyissuer}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatecompanynumber">{$LANG.irnicnewcontactprivatecompanynumber} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactprivatecompanynumber" id="newcontactprivatecompanynumber" value="{$smarty.session.newcontactprivatecompanynumber}" class="form-control" placeholder="{$LANG.newcontactprivatecompanynumberH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatecompanynumber2">{$LANG.irnicnewcontactprivatecompanynumber2}</label>
    				<input type="number" style="direction: ltr;" name="newcontactprivatecompanynumber2" id="newcontactprivatecompanynumber2" value="{$smarty.session.newcontactprivatecompanynumber2}" class="form-control" placeholder="{$LANG.newcontactprivatecompanynumber2H}" />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatecompanycategory">{$LANG.irnicnewcontactprivatecompanycategory} * </label>
    				<select name="newcontactprivatecompanycategory" id="newcontactprivatecompanycategory" class="form-control" style="direction: rtl;padding: 0;" required>
    					<option value="" label="لطفا انتخاب کنید...">لطفا انتخاب کنید...</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "SabtSherkat__PublicCompany")}{"selected='selected'"}{/if} value="SabtSherkat__PublicCompany" label="شرکت سهامی عام">شرکت سهامی عام</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "SabtSherkat__PrivateCompany")}{"selected='selected'"}{/if} value="SabtSherkat__PrivateCompany" label="شرکت سهامی خاص">شرکت سهامی خاص</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "SabtSherkat__LimitedCompany")}{"selected='selected'"}{/if} value="SabtSherkat__LimitedCompany" label="شرکت با مسئولیت محدود">شرکت با مسئولیت محدود</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "SabtSherkat__CooperativeCompany")}{"selected='selected'"}{/if} value="SabtSherkat__CooperativeCompany" label="شرکت تعاونی">شرکت تعاونی</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "SabtSherkat__Organization")}{"selected='selected'"}{/if} value="SabtSherkat__Organization" label="موسسه">موسسه</option>
    					<option {if ($smarty.session.newcontactprivatecompanycategory == "Ershad__Publication")}{"selected='selected'"}{/if} value="Ershad__Publication" label="انتشارات و نشریات">انتشارات و نشریات</option>
    				</select>			
    			</div>
    		</div>
    	</fieldset>
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontactpersonalplaceinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatecountry">{$LANG.clientareacountry} * </label>
    				<select name="newcontactprivatecountry" id="newcontactprivatecountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontactprivatecountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontactprivatecountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontactprivatecountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontactprivatecountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontactprivatecountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontactprivatecountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontactprivatecountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontactprivatecountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontactprivatecountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontactprivatecountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontactprivatecountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontactprivatecountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontactprivatecountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontactprivatecountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontactprivatecountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontactprivatecountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontactprivatecountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontactprivatecountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontactprivatecountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontactprivatecountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontactprivatecountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontactprivatecountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontactprivatecountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontactprivatecountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontactprivatecountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontactprivatecountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontactprivatecountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontactprivatecountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontactprivatecountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontactprivatecountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontactprivatecountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontactprivatecountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontactprivatecountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontactprivatecountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontactprivatecountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontactprivatecountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontactprivatecountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontactprivatecountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontactprivatecountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontactprivatecountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontactprivatecountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontactprivatecountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontactprivatecountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontactprivatecountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontactprivatecountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontactprivatecountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontactprivatecountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontactprivatecountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontactprivatecountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontactprivatecountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontactprivatecountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontactprivatecountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontactprivatecountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontactprivatecountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontactprivatecountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontactprivatecountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontactprivatecountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontactprivatecountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontactprivatecountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontactprivatecountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontactprivatecountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontactprivatecountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontactprivatecountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontactprivatecountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontactprivatecountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontactprivatecountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontactprivatecountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontactprivatecountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontactprivatecountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontactprivatecountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontactprivatecountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontactprivatecountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontactprivatecountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontactprivatecountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontactprivatecountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontactprivatecountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontactprivatecountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontactprivatecountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontactprivatecountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontactprivatecountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontactprivatecountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontactprivatecountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontactprivatecountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontactprivatecountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontactprivatecountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontactprivatecountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontactprivatecountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontactprivatecountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontactprivatecountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontactprivatecountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontactprivatecountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontactprivatecountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontactprivatecountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontactprivatecountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontactprivatecountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontactprivatecountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontactprivatecountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontactprivatecountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontactprivatecountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontactprivatecountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontactprivatecountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontactprivatecountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontactprivatecountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontactprivatecountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontactprivatecountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontactprivatecountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontactprivatecountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontactprivatecountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontactprivatecountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontactprivatecountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontactprivatecountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontactprivatecountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontactprivatecountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontactprivatecountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontactprivatecountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontactprivatecountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontactprivatecountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontactprivatecountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontactprivatecountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontactprivatecountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontactprivatecountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontactprivatecountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontactprivatecountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontactprivatecountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontactprivatecountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontactprivatecountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontactprivatecountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontactprivatecountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontactprivatecountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontactprivatecountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontactprivatecountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontactprivatecountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontactprivatecountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontactprivatecountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontactprivatecountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontactprivatecountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontactprivatecountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontactprivatecountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontactprivatecountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontactprivatecountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontactprivatecountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontactprivatecountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontactprivatecountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontactprivatecountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontactprivatecountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontactprivatecountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontactprivatecountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontactprivatecountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontactprivatecountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontactprivatecountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontactprivatecountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontactprivatecountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontactprivatecountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontactprivatecountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontactprivatecountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontactprivatecountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontactprivatecountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontactprivatecountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontactprivatecountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontactprivatecountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontactprivatecountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontactprivatecountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontactprivatecountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontactprivatecountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontactprivatecountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontactprivatecountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontactprivatecountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontactprivatecountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontactprivatecountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontactprivatecountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontactprivatecountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontactprivatecountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontactprivatecountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontactprivatecountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontactprivatecountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontactprivatecountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontactprivatecountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontactprivatecountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontactprivatecountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontactprivatecountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontactprivatecountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontactprivatecountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontactprivatecountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontactprivatecountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontactprivatecountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontactprivatecountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontactprivatecountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontactprivatecountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontactprivatecountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontactprivatecountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontactprivatecountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontactprivatecountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontactprivatecountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontactprivatecountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontactprivatecountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontactprivatecountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontactprivatecountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontactprivatecountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontactprivatecountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontactprivatecountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontactprivatecountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontactprivatecountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontactprivatecountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontactprivatecountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontactprivatecountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontactprivatecountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontactprivatecountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontactprivatecountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontactprivatecountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontactprivatecountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontactprivatecountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontactprivatecountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontactprivatecountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontactprivatecountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontactprivatecountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontactprivatecountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontactprivatecountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontactprivatecountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontactprivatecountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontactprivatecountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontactprivatecountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontactprivatecountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontactprivatecountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontactprivatecountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontactprivatecountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontactprivatecountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontactprivatecountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontactprivatecountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontactprivatecountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontactprivatecountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontactprivatecountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontactprivatecountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontactprivatecountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontactprivatecountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontactprivatecountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontactprivatecountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontactprivatecountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontactprivatecountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontactprivatecountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontactprivatecountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontactprivatecountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontactprivatecountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontactprivatecountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontactprivatestate">{$LANG.clientareastate} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivatestate" pattern="[a-zA-Z0-9 ]*" id="newcontactprivatestate" value="{$smarty.session.newcontactprivatestate}" class="form-control" placeholder="{$LANG.newcontactpersonalstateH}" required />
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontactprivatecity">{$LANG.clientareacity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivatecity" pattern="[a-zA-Z0-9 ]*" id="newcontactprivatecity" value="{$smarty.session.newcontactprivatecity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivateaddress">{$LANG.domaindnsaddress} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactprivateaddress" pattern="[a-zA-Z0-9 ,.]*" id="newcontactprivateaddress" value="{$smarty.session.newcontactprivateaddress}" class="form-control" placeholder="{$LANG.newcontactpersonaladdressH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatepostcode">{$LANG.clientareapostcode} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactprivatepostcode" id="newcontactprivatepostcode" value="{$smarty.session.newcontactprivatepostcode}" class="form-control" placeholder="{$LANG.newcontactpersonalpostcodeH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontactprivatephone">{$LANG.irnicnewcontactpersonalphone} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactprivatephone" id="newcontactprivatephone" value="{$smarty.session.newcontactprivatephone}" class="form-control" placeholder="{$LANG.newcontactpersonalphoneH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactprivatefax">{$LANG.irnicnewcontactpersonalfax}</label>
    				<input type="number" style="direction: ltr;" name="newcontactprivatefax" id="newcontactprivatefax" value="{$smarty.session.newcontactprivatefax}" class="form-control" placeholder="{$LANG.newcontactpersonalfaxH}" />
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