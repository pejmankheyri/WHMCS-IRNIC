{if $IrnicTimeError}
	{include file="$template/includes/alert.tpl" type="error" errorshtml=$IrnicTimeError}
{else}
    {if $errormessage}
    	{include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    {if $successmessage}
    	{include file="$template/includes/alert.tpl" type="success" textcenter=true hide=false additionalClasses="my-custom-class" idname="my-alert" msg=$successmessage}
    {/if}
    <p>{$LANG.irnicnewcontactpersonalinfodesc}<br>{$LANG.irnicnewcontacteduinfodesc}<br>{$LANG.irnicnewcontactnicircond}</p>
    <form method="post" action="{$smarty.server.PHP_SELF}" enctype="multipart/form-data" role="form">
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontacteduinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteduceofname">{$LANG.irnicnewcontacteduceofname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteduceofname" pattern="[a-zA-Z ]*" id="newcontacteduceofname" value="{$smarty.session.newcontacteduceofname}" class="form-control" placeholder="{$LANG.newcontactpersonalfirstnameH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontacteduceolname">{$LANG.irnicnewcontacteduceolname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteduceolname" pattern="[a-zA-Z ]*" id="newcontacteduceolname" value="{$smarty.session.newcontacteduceolname}" class="form-control" placeholder="{$LANG.newcontactpersonallastnameH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteducompanyname">{$LANG.irnicnewcontacteducompanyname} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteducompanyname" pattern="[a-zA-Z0-9 ,.]*" id="newcontacteducompanyname" value="{$smarty.session.newcontacteducompanyname}" class="form-control" placeholder="{$LANG.newcontactpersonalcompanyH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontacteducompanyemail">{$LANG.supportticketsclientemail} * </label>
    				<input type="email" style="direction: ltr;" name="newcontacteducompanyemail" id="newcontacteducompanyemail" value="{$smarty.session.newcontacteducompanyemail}" class="form-control" placeholder="{$LANG.newcontactpersonalemailH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteducompanycountry">{$LANG.irnicnewcontactprivatecompanycountry} * </label>
    				<select name="newcontacteducompanycountry" id="newcontacteducompanycountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontacteducompanycountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontacteducompanycountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontacteducompanycountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontacteducompanycountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontacteducompanycountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontacteducompanycountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontacteducompanycountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontacteducompanycountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontacteducompanycountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontacteducompanycountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontacteducompanycountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontacteducompanycountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontacteducompanycountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontacteducompanycountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontacteducompanycountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontacteducompanycountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontacteducompanycountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontacteducompanycountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontacteducompanycountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontacteducompanycountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontacteducompanycountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontacteducompanycountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontacteducompanycountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontacteducompanycountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontacteducompanycountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontacteducompanycountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontacteducompanycountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontacteducompanycountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontacteducompanycountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontacteducompanycountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontacteducompanycountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontacteducompanycountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontacteducompanycountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontacteducompanycountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontacteducompanycountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontacteducompanycountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontacteducompanycountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontacteducompanycountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontacteducompanycountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontacteducompanycountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontacteducompanycountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontacteducompanycountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontacteducompanycountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontacteducompanycountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontacteducompanycountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontacteducompanycountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontacteducompanycountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontacteducompanycountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontacteducompanycountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontacteducompanycountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontacteducompanycountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontacteducompanycountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontacteducompanycountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontacteducompanycountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontacteducompanycountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontacteducompanycountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontacteducompanycountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontacteducompanycountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontacteducompanycountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontacteducompanycountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontacteducompanycountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontacteducompanycountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontacteducompanycountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontacteducompanycountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontacteducompanycountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontacteducompanycountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontacteducompanycountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontacteducompanycountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontacteducompanycountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontacteducompanycountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontacteducompanycountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontacteducompanycountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontacteducompanycountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontacteducompanycountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontacteducompanycountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontacteducompanycountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontacteducompanycountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontacteducompanycountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontacteducompanycountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontacteducompanycountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontacteducompanycountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontacteducompanycountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontacteducompanycountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontacteducompanycountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontacteducompanycountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontacteducompanycountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontacteducompanycountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontacteducompanycountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontacteducompanycountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontacteducompanycountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontacteducompanycountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontacteducompanycountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontacteducompanycountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontacteducompanycountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontacteducompanycountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontacteducompanycountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontacteducompanycountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontacteducompanycountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontacteducompanycountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontacteducompanycountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontacteducompanycountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontacteducompanycountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontacteducompanycountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontacteducompanycountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontacteducompanycountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontacteducompanycountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontacteducompanycountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontacteducompanycountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontacteducompanycountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontacteducompanycountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontacteducompanycountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontacteducompanycountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontacteducompanycountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontacteducompanycountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontacteducompanycountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontacteducompanycountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontacteducompanycountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontacteducompanycountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontacteducompanycountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontacteducompanycountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontacteducompanycountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontacteducompanycountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontacteducompanycountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontacteducompanycountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontacteducompanycountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontacteducompanycountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontacteducompanycountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontacteducompanycountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontacteducompanycountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontacteducompanycountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontacteducompanycountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontacteducompanycountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontacteducompanycountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontacteducompanycountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontacteducompanycountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontacteducompanycountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontacteducompanycountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontacteducompanycountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontacteducompanycountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontacteducompanycountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontacteducompanycountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontacteducompanycountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontacteducompanycountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontacteducompanycountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontacteducompanycountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontacteducompanycountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontacteducompanycountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontacteducompanycountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontacteducompanycountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontacteducompanycountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontacteducompanycountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontacteducompanycountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontacteducompanycountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontacteducompanycountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontacteducompanycountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontacteducompanycountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontacteducompanycountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontacteducompanycountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontacteducompanycountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontacteducompanycountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontacteducompanycountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontacteducompanycountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontacteducompanycountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontacteducompanycountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontacteducompanycountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontacteducompanycountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontacteducompanycountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontacteducompanycountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontacteducompanycountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontacteducompanycountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontacteducompanycountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontacteducompanycountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontacteducompanycountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontacteducompanycountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontacteducompanycountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontacteducompanycountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontacteducompanycountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontacteducompanycountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontacteducompanycountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontacteducompanycountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontacteducompanycountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontacteducompanycountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontacteducompanycountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontacteducompanycountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontacteducompanycountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontacteducompanycountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontacteducompanycountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontacteducompanycountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontacteducompanycountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontacteducompanycountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontacteducompanycountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontacteducompanycountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontacteducompanycountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontacteducompanycountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontacteducompanycountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontacteducompanycountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontacteducompanycountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontacteducompanycountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontacteducompanycountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontacteducompanycountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontacteducompanycountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontacteducompanycountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontacteducompanycountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontacteducompanycountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontacteducompanycountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontacteducompanycountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontacteducompanycountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontacteducompanycountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontacteducompanycountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontacteducompanycountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontacteducompanycountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontacteducompanycountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontacteducompanycountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontacteducompanycountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontacteducompanycountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontacteducompanycountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontacteducompanycountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontacteducompanycountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontacteducompanycountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontacteducompanycountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontacteducompanycountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontacteducompanycountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontacteducompanycountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontacteducompanycountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontacteducompanycountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontacteducompanycountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontacteducompanycountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontacteducompanycountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontacteducompanycountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontacteducompanycountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontacteducompanycountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontacteducompanycountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontacteducompanycountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontacteducompanycountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontacteducompanycountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontacteducompanycountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontacteducompanycountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontacteducompanycountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontacteducompanycountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontacteducompanycountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontacteducompanycountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontacteducompanycountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontacteducompanycountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontacteducompanycity">{$LANG.irnicnewcontactprivatecompanycity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteducompanycity" pattern="[a-zA-Z0-9 ]*" id="newcontacteducompanycity" value="{$smarty.session.newcontacteducompanycity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteducompanysp">{$LANG.irnicnewcontacteducompanysp} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteducompanysp" pattern="[a-zA-Z0-9 ]*" id="newcontacteducompanysp" value="{$smarty.session.newcontacteducompanysp}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontacteducompanycategory">{$LANG.irnicnewcontacteducompanycategory} * </label>
    				<select name="newcontacteducompanycategory" id="newcontacteducompanycategory" class="form-control" style="direction: rtl;padding: 0;" required>
    					<option value="" label="لطفا انتخاب کنید...">لطفا انتخاب کنید...</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__PrimarySch")}{"selected='selected'"}{/if} value="MoEdu__PrimarySch" label="دبستان">دبستان</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__SecondarySch")}{"selected='selected'"}{/if} value="MoEdu__SecondarySch" label="مدرسه راهنمایی">مدرسه راهنمایی</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__HighSch")}{"selected='selected'"}{/if} value="MoEdu__HighSch" label="دبیرستان">دبیرستان</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__PreUni")}{"selected='selected'"}{/if} value="MoEdu__PreUni" label="مرکز پیش‌دانشگاهی">مرکز پیش‌دانشگاهی</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__Vocational")}{"selected='selected'"}{/if} value="MoEdu__Vocational" label="مرکز فنی و حرفه‌ای">مرکز فنی و حرفه‌ای</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__OtherSchch")}{"selected='selected'"}{/if} value="MoEdu__OtherSchch" label="مدرسه (غیره)">مدرسه (غیره)</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoEdu__Center")}{"selected='selected'"}{/if} value="MoEdu__Center" label="مرکز آموزشی">مرکز آموزشی</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__PublicUni")}{"selected='selected'"}{/if} value="MoSRT__PublicUni" label="دانشگاه سراسری (غیرپزشکی)">دانشگاه سراسری (غیرپزشکی)</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__AzadUni")}{"selected='selected'"}{/if} value="MoSRT__AzadUni" label="دانشگاه آزاد">دانشگاه آزاد</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__PayameNoorUni")}{"selected='selected'"}{/if} value="MoSRT__PayameNoorUni" label="دانشگاه پیام نور">دانشگاه پیام نور</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__AppSciTechUni")}{"selected='selected'"}{/if} value="MoSRT__AppSciTechUni" label="دانشگاه علمی‐کاربردی">دانشگاه علمی‐کاربردی</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__OtherUni")}{"selected='selected'"}{/if} value="MoSRT__OtherUni" label="دانشگاه (غیره)">دانشگاه (غیره)</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__Center")}{"selected='selected'"}{/if} value="MoSRT__Center" label="مرکز آموزش عالی">مرکز آموزش عالی</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoSRT__ResearchInst")}{"selected='selected'"}{/if} value="MoSRT__ResearchInst" label="مرکز تحقیقاتی (غیرپزشکی)">مرکز تحقیقاتی (غیرپزشکی)</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MOHMS__MedPublicUni")}{"selected='selected'"}{/if} value="MOHMS__MedPublicUni" label="دانشگاه سراسری (پزشکی)">دانشگاه سراسری (پزشکی)</option>
    					<option {if ($smarty.session.newcontacteducompanycategory == "MoHMS__MedResearchInst")}{"selected='selected'"}{/if} value="MoHMS__MedResearchInst" label="مرکز تحقیقاتی (پزشکی)">مرکز تحقیقاتی (پزشکی)</option>
    				</select>			
    			</div>
    		</div>
    	</fieldset>
    	<fieldset class="form-group">
    		<legend>{$LANG.irnicnewcontactpersonalplaceinfo}</legend>
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteducountry">{$LANG.clientareacountry} * </label>
    				<select name="newcontacteducountry" id="newcontacteducountry" class="form-control" style="direction: ltr;padding: 0;">
    					<option value="IR" label="Iran (Islamic Republic Of)">Iran (Islamic Republic Of)</option>
    					<option value="AF" {if ($smarty.session.newcontacteducountry == "AF")}{"selected='selected'"}{/if} label="Afghanistan">Afghanistan</option>
    					<option value="AL" {if ($smarty.session.newcontacteducountry == "AL")}{"selected='selected'"}{/if} label="Albania">Albania</option>
    					<option value="DZ" {if ($smarty.session.newcontacteducountry == "DZ")}{"selected='selected'"}{/if} label="Algeria">Algeria</option>
    					<option value="AS" {if ($smarty.session.newcontacteducountry == "AS")}{"selected='selected'"}{/if} label="American Samoa">American Samoa</option>
    					<option value="AD" {if ($smarty.session.newcontacteducountry == "AD")}{"selected='selected'"}{/if} label="Andorra">Andorra</option>
    					<option value="AO" {if ($smarty.session.newcontacteducountry == "AO")}{"selected='selected'"}{/if} label="Angola">Angola</option>
    					<option value="AI" {if ($smarty.session.newcontacteducountry == "AI")}{"selected='selected'"}{/if} label="Anguilla">Anguilla</option>
    					<option value="AQ" {if ($smarty.session.newcontacteducountry == "AQ")}{"selected='selected'"}{/if} label="Antarctica">Antarctica</option>
    					<option value="AG" {if ($smarty.session.newcontacteducountry == "AG")}{"selected='selected'"}{/if} label="Antigua And Barbuda">Antigua And Barbuda</option>
    					<option value="AR" {if ($smarty.session.newcontacteducountry == "AR")}{"selected='selected'"}{/if} label="Argentina">Argentina</option>
    					<option value="AM" {if ($smarty.session.newcontacteducountry == "AM")}{"selected='selected'"}{/if} label="Armenia">Armenia</option>
    					<option value="AW" {if ($smarty.session.newcontacteducountry == "AW")}{"selected='selected'"}{/if} label="Aruba">Aruba</option>
    					<option value="AU" {if ($smarty.session.newcontacteducountry == "AU")}{"selected='selected'"}{/if} label="Australia">Australia</option>
    					<option value="AT" {if ($smarty.session.newcontacteducountry == "AT")}{"selected='selected'"}{/if} label="Austria">Austria</option>
    					<option value="AZ" {if ($smarty.session.newcontacteducountry == "AZ")}{"selected='selected'"}{/if} label="Azerbaijan">Azerbaijan</option>
    					<option value="BS" {if ($smarty.session.newcontacteducountry == "BS")}{"selected='selected'"}{/if} label="Bahamas">Bahamas</option>
    					<option value="BH" {if ($smarty.session.newcontacteducountry == "BH")}{"selected='selected'"}{/if} label="Bahrain">Bahrain</option>
    					<option value="BD" {if ($smarty.session.newcontacteducountry == "BD")}{"selected='selected'"}{/if} label="Bangladesh">Bangladesh</option>
    					<option value="BB" {if ($smarty.session.newcontacteducountry == "BB")}{"selected='selected'"}{/if} label="Barbados">Barbados</option>
    					<option value="BY" {if ($smarty.session.newcontacteducountry == "BY")}{"selected='selected'"}{/if} label="Byelorussian SSR">Byelorussian SSR</option>
    					<option value="BE" {if ($smarty.session.newcontacteducountry == "BE")}{"selected='selected'"}{/if} label="Belgium">Belgium</option>
    					<option value="BZ" {if ($smarty.session.newcontacteducountry == "BZ")}{"selected='selected'"}{/if} label="Belize">Belize</option>
    					<option value="BJ" {if ($smarty.session.newcontacteducountry == "BJ")}{"selected='selected'"}{/if} label="Benin">Benin</option>
    					<option value="BM" {if ($smarty.session.newcontacteducountry == "BM")}{"selected='selected'"}{/if} label="Bermuda">Bermuda</option>
    					<option value="BT" {if ($smarty.session.newcontacteducountry == "BT")}{"selected='selected'"}{/if} label="Bhutan">Bhutan</option>
    					<option value="BO" {if ($smarty.session.newcontacteducountry == "BO")}{"selected='selected'"}{/if} label="Bolivia">Bolivia</option>
    					<option value="BA" {if ($smarty.session.newcontacteducountry == "BA")}{"selected='selected'"}{/if} label="Bosnia Hercegovina">Bosnia Hercegovina</option>
    					<option value="BW" {if ($smarty.session.newcontacteducountry == "BW")}{"selected='selected'"}{/if} label="Botswana">Botswana</option>
    					<option value="BV" {if ($smarty.session.newcontacteducountry == "BV")}{"selected='selected'"}{/if} label="Bouvet Island">Bouvet Island</option>
    					<option value="BR" {if ($smarty.session.newcontacteducountry == "BR")}{"selected='selected'"}{/if} label="Brazil">Brazil</option>
    					<option value="IO" {if ($smarty.session.newcontacteducountry == "IO")}{"selected='selected'"}{/if} label="British Indian Ocean Territory">British Indian Ocean Territory</option>
    					<option value="BN" {if ($smarty.session.newcontacteducountry == "BN")}{"selected='selected'"}{/if} label="Brunei Darussalam">Brunei Darussalam</option>
    					<option value="BG" {if ($smarty.session.newcontacteducountry == "BG")}{"selected='selected'"}{/if} label="Bulgaria">Bulgaria</option>
    					<option value="BF" {if ($smarty.session.newcontacteducountry == "BF")}{"selected='selected'"}{/if} label="Burkina Faso">Burkina Faso</option>
    					<option value="BI" {if ($smarty.session.newcontacteducountry == "BI")}{"selected='selected'"}{/if} label="Burundi">Burundi</option>
    					<option value="KH" {if ($smarty.session.newcontacteducountry == "KH")}{"selected='selected'"}{/if} label="Cambodia">Cambodia</option>
    					<option value="CM" {if ($smarty.session.newcontacteducountry == "CM")}{"selected='selected'"}{/if} label="Cameroon">Cameroon</option>
    					<option value="CA" {if ($smarty.session.newcontacteducountry == "CA")}{"selected='selected'"}{/if} label="Canada">Canada</option>
    					<option value="CV" {if ($smarty.session.newcontacteducountry == "CV")}{"selected='selected'"}{/if} label="Cape Verde">Cape Verde</option>
    					<option value="KY" {if ($smarty.session.newcontacteducountry == "KY")}{"selected='selected'"}{/if} label="Cayman Islands">Cayman Islands</option>
    					<option value="CF" {if ($smarty.session.newcontacteducountry == "CF")}{"selected='selected'"}{/if} label="Central African Republic">Central African Republic</option>
    					<option value="TD" {if ($smarty.session.newcontacteducountry == "TD")}{"selected='selected'"}{/if} label="Chad">Chad</option>
    					<option value="CL" {if ($smarty.session.newcontacteducountry == "CL")}{"selected='selected'"}{/if} label="Chile">Chile</option>
    					<option value="CN" {if ($smarty.session.newcontacteducountry == "CN")}{"selected='selected'"}{/if} label="China">China</option>
    					<option value="CX" {if ($smarty.session.newcontacteducountry == "CX")}{"selected='selected'"}{/if} label="Christmas Island">Christmas Island</option>
    					<option value="CC" {if ($smarty.session.newcontacteducountry == "CC")}{"selected='selected'"}{/if} label="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
    					<option value="CO" {if ($smarty.session.newcontacteducountry == "CO")}{"selected='selected'"}{/if} label="Colombia">Colombia</option>
    					<option value="KM" {if ($smarty.session.newcontacteducountry == "KM")}{"selected='selected'"}{/if} label="Comoros">Comoros</option>
    					<option value="CG" {if ($smarty.session.newcontacteducountry == "CG")}{"selected='selected'"}{/if} label="Congo">Congo</option>
    					<option value="CD" {if ($smarty.session.newcontacteducountry == "CD")}{"selected='selected'"}{/if} label="Congo, The Democratic Republic Of">Congo, The Democratic Republic Of</option>
    					<option value="CK" {if ($smarty.session.newcontacteducountry == "CK")}{"selected='selected'"}{/if} label="Cook Islands">Cook Islands</option>
    					<option value="CR" {if ($smarty.session.newcontacteducountry == "CR")}{"selected='selected'"}{/if} label="Costa Rica">Costa Rica</option>
    					<option value="CI" {if ($smarty.session.newcontacteducountry == "CI")}{"selected='selected'"}{/if} label="Cote D'Ivoire">Cote D'Ivoire</option>
    					<option value="HR" {if ($smarty.session.newcontacteducountry == "HR")}{"selected='selected'"}{/if} label="Croatia">Croatia</option>
    					<option value="CU" {if ($smarty.session.newcontacteducountry == "CU")}{"selected='selected'"}{/if} label="Cuba">Cuba</option>
    					<option value="CY" {if ($smarty.session.newcontacteducountry == "CY")}{"selected='selected'"}{/if} label="Cyprus">Cyprus</option>
    					<option value="CZ" {if ($smarty.session.newcontacteducountry == "CZ")}{"selected='selected'"}{/if} label="Czech Republic">Czech Republic</option>
    					<option value="CS" {if ($smarty.session.newcontacteducountry == "CS")}{"selected='selected'"}{/if} label="Czechoslovakia">Czechoslovakia</option>
    					<option value="DK" {if ($smarty.session.newcontacteducountry == "DK")}{"selected='selected'"}{/if} label="Denmark">Denmark</option>
    					<option value="DJ" {if ($smarty.session.newcontacteducountry == "DJ")}{"selected='selected'"}{/if} label="Djibouti">Djibouti</option>
    					<option value="DM" {if ($smarty.session.newcontacteducountry == "DM")}{"selected='selected'"}{/if} label="Dominica">Dominica</option>
    					<option value="DO" {if ($smarty.session.newcontacteducountry == "DO")}{"selected='selected'"}{/if} label="Dominican Republic">Dominican Republic</option>
    					<option value="TP" {if ($smarty.session.newcontacteducountry == "TP")}{"selected='selected'"}{/if} label="East Timor">East Timor</option>
    					<option value="EC" {if ($smarty.session.newcontacteducountry == "EC")}{"selected='selected'"}{/if} label="Ecuador">Ecuador</option>
    					<option value="EG" {if ($smarty.session.newcontacteducountry == "EG")}{"selected='selected'"}{/if} label="Egypt">Egypt</option>
    					<option value="SV" {if ($smarty.session.newcontacteducountry == "SV")}{"selected='selected'"}{/if} label="El Salvador">El Salvador</option>
    					<option value="GB" {if ($smarty.session.newcontacteducountry == "GB")}{"selected='selected'"}{/if} label="Great Britain">Great Britain</option>
    					<option value="GQ" {if ($smarty.session.newcontacteducountry == "GQ")}{"selected='selected'"}{/if} label="Equatorial Guinea">Equatorial Guinea</option>
    					<option value="ER" {if ($smarty.session.newcontacteducountry == "ER")}{"selected='selected'"}{/if} label="Eritrea">Eritrea</option>
    					<option value="EE" {if ($smarty.session.newcontacteducountry == "EE")}{"selected='selected'"}{/if} label="Estonia">Estonia</option>
    					<option value="ET" {if ($smarty.session.newcontacteducountry == "ET")}{"selected='selected'"}{/if} label="Ethiopia">Ethiopia</option>
    					<option value="FK" {if ($smarty.session.newcontacteducountry == "FK")}{"selected='selected'"}{/if} label="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
    					<option value="FO" {if ($smarty.session.newcontacteducountry == "FO")}{"selected='selected'"}{/if} label="Faroe Islands">Faroe Islands</option>
    					<option value="FJ" {if ($smarty.session.newcontacteducountry == "FJ")}{"selected='selected'"}{/if} label="Fiji">Fiji</option>
    					<option value="FI" {if ($smarty.session.newcontacteducountry == "FI")}{"selected='selected'"}{/if} label="Finland">Finland</option>
    					<option value="FR" {if ($smarty.session.newcontacteducountry == "FR")}{"selected='selected'"}{/if} label="France">France</option>
    					<option value="GF" {if ($smarty.session.newcontacteducountry == "GF")}{"selected='selected'"}{/if} label="French Guiana">French Guiana</option>
    					<option value="PF" {if ($smarty.session.newcontacteducountry == "PF")}{"selected='selected'"}{/if} label="French Polynesia">French Polynesia</option>
    					<option value="TF" {if ($smarty.session.newcontacteducountry == "TF")}{"selected='selected'"}{/if} label="French Southern Territories">French Southern Territories</option>
    					<option value="GA" {if ($smarty.session.newcontacteducountry == "GA")}{"selected='selected'"}{/if} label="Gabon">Gabon</option>
    					<option value="GM" {if ($smarty.session.newcontacteducountry == "GM")}{"selected='selected'"}{/if} label="Gambia">Gambia</option>
    					<option value="GE" {if ($smarty.session.newcontacteducountry == "GE")}{"selected='selected'"}{/if} label="Georgia">Georgia</option>
    					<option value="DE" {if ($smarty.session.newcontacteducountry == "DE")}{"selected='selected'"}{/if} label="Germany">Germany</option>
    					<option value="GH" {if ($smarty.session.newcontacteducountry == "GH")}{"selected='selected'"}{/if} label="Ghana">Ghana</option>
    					<option value="GI" {if ($smarty.session.newcontacteducountry == "GI")}{"selected='selected'"}{/if} label="Gibraltar">Gibraltar</option>
    					<option value="GR" {if ($smarty.session.newcontacteducountry == "GR")}{"selected='selected'"}{/if} label="Greece">Greece</option>
    					<option value="GL" {if ($smarty.session.newcontacteducountry == "GL")}{"selected='selected'"}{/if} label="Greenland">Greenland</option>
    					<option value="GD" {if ($smarty.session.newcontacteducountry == "GD")}{"selected='selected'"}{/if} label="Grenada">Grenada</option>
    					<option value="GP" {if ($smarty.session.newcontacteducountry == "GP")}{"selected='selected'"}{/if} label="Guadeloupe">Guadeloupe</option>
    					<option value="GU" {if ($smarty.session.newcontacteducountry == "GU")}{"selected='selected'"}{/if} label="Guam">Guam</option>
    					<option value="GT" {if ($smarty.session.newcontacteducountry == "GT")}{"selected='selected'"}{/if} label="Guatemela">Guatemela</option>
    					<option value="GG" {if ($smarty.session.newcontacteducountry == "GG")}{"selected='selected'"}{/if} label="Guernsey">Guernsey</option>
    					<option value="GN" {if ($smarty.session.newcontacteducountry == "GN")}{"selected='selected'"}{/if} label="Guinea">Guinea</option>
    					<option value="GW" {if ($smarty.session.newcontacteducountry == "GW")}{"selected='selected'"}{/if} label="Guinea-Bissau">Guinea-Bissau</option>
    					<option value="GY" {if ($smarty.session.newcontacteducountry == "GY")}{"selected='selected'"}{/if} label="Guyana">Guyana</option>
    					<option value="HT" {if ($smarty.session.newcontacteducountry == "HT")}{"selected='selected'"}{/if} label="Haiti">Haiti</option>
    					<option value="HM" {if ($smarty.session.newcontacteducountry == "HM")}{"selected='selected'"}{/if} label="Heard and McDonald Islands">Heard and McDonald Islands</option>
    					<option value="HN" {if ($smarty.session.newcontacteducountry == "HN")}{"selected='selected'"}{/if} label="Honduras">Honduras</option>
    					<option value="HK" {if ($smarty.session.newcontacteducountry == "HK")}{"selected='selected'"}{/if} label="Hong Kong">Hong Kong</option>
    					<option value="HU" {if ($smarty.session.newcontacteducountry == "HU")}{"selected='selected'"}{/if} label="Hungary">Hungary</option>
    					<option value="IS" {if ($smarty.session.newcontacteducountry == "IS")}{"selected='selected'"}{/if} label="Iceland">Iceland</option>
    					<option value="IN" {if ($smarty.session.newcontacteducountry == "IN")}{"selected='selected'"}{/if} label="India">India</option>
    					<option value="ID" {if ($smarty.session.newcontacteducountry == "ID")}{"selected='selected'"}{/if} label="Indonesia">Indonesia</option>
    					<option value="IQ" {if ($smarty.session.newcontacteducountry == "IQ")}{"selected='selected'"}{/if} label="Iraq">Iraq</option>
    					<option value="IE" {if ($smarty.session.newcontacteducountry == "IE")}{"selected='selected'"}{/if} label="Ireland">Ireland</option>
    					<option value="IM" {if ($smarty.session.newcontacteducountry == "IM")}{"selected='selected'"}{/if} label="Isle Of Man">Isle Of Man</option>
    					<option value="IT" {if ($smarty.session.newcontacteducountry == "IT")}{"selected='selected'"}{/if} label="Italy">Italy</option>
    					<option value="JM" {if ($smarty.session.newcontacteducountry == "JM")}{"selected='selected'"}{/if} label="Jamaica">Jamaica</option>
    					<option value="JP" {if ($smarty.session.newcontacteducountry == "JP")}{"selected='selected'"}{/if} label="Japan">Japan</option>
    					<option value="JE" {if ($smarty.session.newcontacteducountry == "JE")}{"selected='selected'"}{/if} label="Jersey">Jersey</option>
    					<option value="JO" {if ($smarty.session.newcontacteducountry == "JO")}{"selected='selected'"}{/if} label="Jordan">Jordan</option>
    					<option value="KZ" {if ($smarty.session.newcontacteducountry == "KZ")}{"selected='selected'"}{/if} label="Kazakhstan">Kazakhstan</option>
    					<option value="KE" {if ($smarty.session.newcontacteducountry == "KE")}{"selected='selected'"}{/if} label="Kenya">Kenya</option>
    					<option value="KI" {if ($smarty.session.newcontacteducountry == "KI")}{"selected='selected'"}{/if} label="Kiribati">Kiribati</option>
    					<option value="KP" {if ($smarty.session.newcontacteducountry == "KP")}{"selected='selected'"}{/if} label="Korea, Democratic People's Republic Of">Korea, Democratic People's Republic Of</option>
    					<option value="KR" {if ($smarty.session.newcontacteducountry == "KR")}{"selected='selected'"}{/if} label="Korea, Republic Of">Korea, Republic Of</option>
    					<option value="KW" {if ($smarty.session.newcontacteducountry == "KW")}{"selected='selected'"}{/if} label="Kuwait">Kuwait</option>
    					<option value="KG" {if ($smarty.session.newcontacteducountry == "KG")}{"selected='selected'"}{/if} label="Kyrgyzstan">Kyrgyzstan</option>
    					<option value="LA" {if ($smarty.session.newcontacteducountry == "LA")}{"selected='selected'"}{/if} label="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
    					<option value="LV" {if ($smarty.session.newcontacteducountry == "LV")}{"selected='selected'"}{/if} label="Latvia">Latvia</option>
    					<option value="LB" {if ($smarty.session.newcontacteducountry == "LB")}{"selected='selected'"}{/if} label="Lebanon">Lebanon</option>
    					<option value="LS" {if ($smarty.session.newcontacteducountry == "LS")}{"selected='selected'"}{/if} label="Lesotho">Lesotho</option>
    					<option value="LR" {if ($smarty.session.newcontacteducountry == "LR")}{"selected='selected'"}{/if} label="Liberia">Liberia</option>
    					<option value="LY" {if ($smarty.session.newcontacteducountry == "LY")}{"selected='selected'"}{/if} label="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
    					<option value="LI" {if ($smarty.session.newcontacteducountry == "LI")}{"selected='selected'"}{/if} label="Liechtenstein">Liechtenstein</option>
    					<option value="LT" {if ($smarty.session.newcontacteducountry == "LT")}{"selected='selected'"}{/if} label="Lithuania">Lithuania</option>
    					<option value="LU" {if ($smarty.session.newcontacteducountry == "LU")}{"selected='selected'"}{/if} label="Luxembourg">Luxembourg</option>
    					<option value="MO" {if ($smarty.session.newcontacteducountry == "MO")}{"selected='selected'"}{/if} label="Macau">Macau</option>
    					<option value="MK" {if ($smarty.session.newcontacteducountry == "MK")}{"selected='selected'"}{/if} label="Macedonia">Macedonia</option>
    					<option value="MG" {if ($smarty.session.newcontacteducountry == "MG")}{"selected='selected'"}{/if} label="Madagascar">Madagascar</option>
    					<option value="MW" {if ($smarty.session.newcontacteducountry == "MW")}{"selected='selected'"}{/if} label="Malawi">Malawi</option>
    					<option value="MY" {if ($smarty.session.newcontacteducountry == "MY")}{"selected='selected'"}{/if} label="Malaysia">Malaysia</option>
    					<option value="MV" {if ($smarty.session.newcontacteducountry == "MV")}{"selected='selected'"}{/if} label="Maldives">Maldives</option>
    					<option value="ML" {if ($smarty.session.newcontacteducountry == "ML")}{"selected='selected'"}{/if} label="Mali">Mali</option>
    					<option value="MT" {if ($smarty.session.newcontacteducountry == "MT")}{"selected='selected'"}{/if} label="Malta">Malta</option>
    					<option value="MH" {if ($smarty.session.newcontacteducountry == "MH")}{"selected='selected'"}{/if} label="Marshall Islands">Marshall Islands</option>
    					<option value="MQ" {if ($smarty.session.newcontacteducountry == "MQ")}{"selected='selected'"}{/if} label="Martinique">Martinique</option>
    					<option value="MR" {if ($smarty.session.newcontacteducountry == "MR")}{"selected='selected'"}{/if} label="Mauritania">Mauritania</option>
    					<option value="MU" {if ($smarty.session.newcontacteducountry == "MU")}{"selected='selected'"}{/if} label="Mauritius">Mauritius</option>
    					<option value="YT" {if ($smarty.session.newcontacteducountry == "YT")}{"selected='selected'"}{/if} label="Mayotte">Mayotte</option>
    					<option value="MX" {if ($smarty.session.newcontacteducountry == "MX")}{"selected='selected'"}{/if} label="Mexico">Mexico</option>
    					<option value="FM" {if ($smarty.session.newcontacteducountry == "FM")}{"selected='selected'"}{/if} label="Micronesia, Federated States Of">Micronesia, Federated States Of</option>
    					<option value="MD" {if ($smarty.session.newcontacteducountry == "MD")}{"selected='selected'"}{/if} label="Moldova, Republic Of">Moldova, Republic Of</option>
    					<option value="MC" {if ($smarty.session.newcontacteducountry == "MC")}{"selected='selected'"}{/if} label="Monaco">Monaco</option>
    					<option value="MN" {if ($smarty.session.newcontacteducountry == "MN")}{"selected='selected'"}{/if} label="Mongolia">Mongolia</option>
    					<option value="MS" {if ($smarty.session.newcontacteducountry == "MS")}{"selected='selected'"}{/if} label="Montserrat">Montserrat</option>
    					<option value="MA" {if ($smarty.session.newcontacteducountry == "MA")}{"selected='selected'"}{/if} label="Morocco">Morocco</option>
    					<option value="MZ" {if ($smarty.session.newcontacteducountry == "MZ")}{"selected='selected'"}{/if} label="Mozambique">Mozambique</option>
    					<option value="MM" {if ($smarty.session.newcontacteducountry == "MM")}{"selected='selected'"}{/if} label="Myanmar">Myanmar</option>
    					<option value="NA" {if ($smarty.session.newcontacteducountry == "NA")}{"selected='selected'"}{/if} label="Namibia">Namibia</option>
    					<option value="NR" {if ($smarty.session.newcontacteducountry == "NR")}{"selected='selected'"}{/if} label="Nauru">Nauru</option>
    					<option value="NP" {if ($smarty.session.newcontacteducountry == "NP")}{"selected='selected'"}{/if} label="Nepal">Nepal</option>
    					<option value="NL" {if ($smarty.session.newcontacteducountry == "NL")}{"selected='selected'"}{/if} label="Netherlands">Netherlands</option>
    					<option value="AN" {if ($smarty.session.newcontacteducountry == "AN")}{"selected='selected'"}{/if} label="Netherlands Antilles">Netherlands Antilles</option>
    					<option value="NT" {if ($smarty.session.newcontacteducountry == "NT")}{"selected='selected'"}{/if} label="Neutral Zone">Neutral Zone</option>
    					<option value="NC" {if ($smarty.session.newcontacteducountry == "NC")}{"selected='selected'"}{/if} label="New Caledonia">New Caledonia</option>
    					<option value="NZ" {if ($smarty.session.newcontacteducountry == "NZ")}{"selected='selected'"}{/if} label="New Zealand">New Zealand</option>
    					<option value="NI" {if ($smarty.session.newcontacteducountry == "NI")}{"selected='selected'"}{/if} label="Nicaragua">Nicaragua</option>
    					<option value="NE" {if ($smarty.session.newcontacteducountry == "NE")}{"selected='selected'"}{/if} label="Niger">Niger</option>
    					<option value="NG" {if ($smarty.session.newcontacteducountry == "NG")}{"selected='selected'"}{/if} label="Nigeria">Nigeria</option>
    					<option value="NU" {if ($smarty.session.newcontacteducountry == "NU")}{"selected='selected'"}{/if} label="Niue">Niue</option>
    					<option value="NF" {if ($smarty.session.newcontacteducountry == "NF")}{"selected='selected'"}{/if} label="Norfolk Island">Norfolk Island</option>
    					<option value="MP" {if ($smarty.session.newcontacteducountry == "MP")}{"selected='selected'"}{/if} label="Northern Mariana Islands">Northern Mariana Islands</option>
    					<option value="NO" {if ($smarty.session.newcontacteducountry == "NO")}{"selected='selected'"}{/if} label="Norway">Norway</option>
    					<option value="OM" {if ($smarty.session.newcontacteducountry == "OM")}{"selected='selected'"}{/if} label="Oman">Oman</option>
    					<option value="PK" {if ($smarty.session.newcontacteducountry == "PK")}{"selected='selected'"}{/if} label="Pakistan">Pakistan</option>
    					<option value="PW" {if ($smarty.session.newcontacteducountry == "PW")}{"selected='selected'"}{/if} label="Palau">Palau</option>
    					<option value="PA" {if ($smarty.session.newcontacteducountry == "PA")}{"selected='selected'"}{/if} label="Panama">Panama</option>
    					<option value="PG" {if ($smarty.session.newcontacteducountry == "PG")}{"selected='selected'"}{/if} label="Papua New Guinea">Papua New Guinea</option>
    					<option value="PY" {if ($smarty.session.newcontacteducountry == "PY")}{"selected='selected'"}{/if} label="Paraguay">Paraguay</option>
    					<option value="PE" {if ($smarty.session.newcontacteducountry == "PE")}{"selected='selected'"}{/if} label="Peru">Peru</option>
    					<option value="PH" {if ($smarty.session.newcontacteducountry == "PH")}{"selected='selected'"}{/if} label="Philippines">Philippines</option>
    					<option value="PN" {if ($smarty.session.newcontacteducountry == "PN")}{"selected='selected'"}{/if} label="Pitcairn">Pitcairn</option>
    					<option value="PL" {if ($smarty.session.newcontacteducountry == "PL")}{"selected='selected'"}{/if} label="Poland">Poland</option>
    					<option value="PT" {if ($smarty.session.newcontacteducountry == "PT")}{"selected='selected'"}{/if} label="Portugal">Portugal</option>
    					<option value="QA" {if ($smarty.session.newcontacteducountry == "QA")}{"selected='selected'"}{/if} label="Qatar">Qatar</option>
    					<option value="RE" {if ($smarty.session.newcontacteducountry == "RE")}{"selected='selected'"}{/if} label="Reunion">Reunion</option>
    					<option value="RO" {if ($smarty.session.newcontacteducountry == "RO")}{"selected='selected'"}{/if} label="Romania">Romania</option>
    					<option value="RU" {if ($smarty.session.newcontacteducountry == "RU")}{"selected='selected'"}{/if} label="Russian Federation">Russian Federation</option>
    					<option value="RW" {if ($smarty.session.newcontacteducountry == "RW")}{"selected='selected'"}{/if} label="Rwanda">Rwanda</option>
    					<option value="SH" {if ($smarty.session.newcontacteducountry == "SH")}{"selected='selected'"}{/if} label="Saint Helena">Saint Helena</option>
    					<option value="KN" {if ($smarty.session.newcontacteducountry == "KN")}{"selected='selected'"}{/if} label="Saint Kitts And Nevis">Saint Kitts And Nevis</option>
    					<option value="LC" {if ($smarty.session.newcontacteducountry == "LC")}{"selected='selected'"}{/if} label="Saint Lucia">Saint Lucia</option>
    					<option value="PM" {if ($smarty.session.newcontacteducountry == "PM")}{"selected='selected'"}{/if} label="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
    					<option value="VC" {if ($smarty.session.newcontacteducountry == "VC")}{"selected='selected'"}{/if} label="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
    					<option value="WS" {if ($smarty.session.newcontacteducountry == "WS")}{"selected='selected'"}{/if} label="Samoa">Samoa</option>
    					<option value="SM" {if ($smarty.session.newcontacteducountry == "SM")}{"selected='selected'"}{/if} label="San Marino">San Marino</option>
    					<option value="ST" {if ($smarty.session.newcontacteducountry == "ST")}{"selected='selected'"}{/if} label="Sao Tome and Principe">Sao Tome and Principe</option>
    					<option value="SA" {if ($smarty.session.newcontacteducountry == "SA")}{"selected='selected'"}{/if} label="Saudi Arabia">Saudi Arabia</option>
    					<option value="SN" {if ($smarty.session.newcontacteducountry == "SN")}{"selected='selected'"}{/if} label="Senegal">Senegal</option>
    					<option value="SC" {if ($smarty.session.newcontacteducountry == "SC")}{"selected='selected'"}{/if} label="Seychelles">Seychelles</option>
    					<option value="SL" {if ($smarty.session.newcontacteducountry == "SL")}{"selected='selected'"}{/if} label="Sierra Leone">Sierra Leone</option>
    					<option value="SG" {if ($smarty.session.newcontacteducountry == "SG")}{"selected='selected'"}{/if} label="Singapore">Singapore</option>
    					<option value="SK" {if ($smarty.session.newcontacteducountry == "SK")}{"selected='selected'"}{/if} label="Slovakia">Slovakia</option>
    					<option value="SI" {if ($smarty.session.newcontacteducountry == "SI")}{"selected='selected'"}{/if} label="Slovenia">Slovenia</option>
    					<option value="SB" {if ($smarty.session.newcontacteducountry == "SB")}{"selected='selected'"}{/if} label="Solomon Islands">Solomon Islands</option>
    					<option value="SO" {if ($smarty.session.newcontacteducountry == "SO")}{"selected='selected'"}{/if} label="Somalia">Somalia</option>
    					<option value="ZA" {if ($smarty.session.newcontacteducountry == "ZA")}{"selected='selected'"}{/if} label="South Africa">South Africa</option>
    					<option value="GS" {if ($smarty.session.newcontacteducountry == "GS")}{"selected='selected'"}{/if} label="South Georgia and The Sandwich Islands">South Georgia and The Sandwich Islands</option>
    					<option value="ES" {if ($smarty.session.newcontacteducountry == "ES")}{"selected='selected'"}{/if} label="Spain">Spain</option>
    					<option value="LK" {if ($smarty.session.newcontacteducountry == "LK")}{"selected='selected'"}{/if} label="Sri Lanka">Sri Lanka</option>
    					<option value="SD" {if ($smarty.session.newcontacteducountry == "SD")}{"selected='selected'"}{/if} label="Sudan">Sudan</option>
    					<option value="SR" {if ($smarty.session.newcontacteducountry == "SR")}{"selected='selected'"}{/if} label="Suriname">Suriname</option>
    					<option value="SJ" {if ($smarty.session.newcontacteducountry == "SJ")}{"selected='selected'"}{/if} label="Svalbard and Jan Mayen Islands">Svalbard and Jan Mayen Islands</option>
    					<option value="SZ" {if ($smarty.session.newcontacteducountry == "SZ")}{"selected='selected'"}{/if} label="Swaziland">Swaziland</option>
    					<option value="SE" {if ($smarty.session.newcontacteducountry == "SE")}{"selected='selected'"}{/if} label="Sweden">Sweden</option>
    					<option value="CH" {if ($smarty.session.newcontacteducountry == "CH")}{"selected='selected'"}{/if} label="Switzerland">Switzerland</option>
    					<option value="SY" {if ($smarty.session.newcontacteducountry == "SY")}{"selected='selected'"}{/if} label="Syrian Arab Republic">Syrian Arab Republic</option>
    					<option value="TW" {if ($smarty.session.newcontacteducountry == "TW")}{"selected='selected'"}{/if} label="Taiwan, Province Of China">Taiwan, Province Of China</option>
    					<option value="TJ" {if ($smarty.session.newcontacteducountry == "TJ")}{"selected='selected'"}{/if} label="Tajikista">Tajikista</option>
    					<option value="TZ" {if ($smarty.session.newcontacteducountry == "TZ")}{"selected='selected'"}{/if} label="Tanzania, United Republic Of">Tanzania, United Republic Of</option>
    					<option value="TH" {if ($smarty.session.newcontacteducountry == "TH")}{"selected='selected'"}{/if} label="Thailand">Thailand</option>
    					<option value="TG" {if ($smarty.session.newcontacteducountry == "TG")}{"selected='selected'"}{/if} label="Togo">Togo</option>
    					<option value="TK" {if ($smarty.session.newcontacteducountry == "TK")}{"selected='selected'"}{/if} label="Tokelau">Tokelau</option>
    					<option value="TO" {if ($smarty.session.newcontacteducountry == "TO")}{"selected='selected'"}{/if} label="Tonga">Tonga</option>
    					<option value="TT" {if ($smarty.session.newcontacteducountry == "TT")}{"selected='selected'"}{/if} label="Trinidad and Tobago">Trinidad and Tobago</option>
    					<option value="TN" {if ($smarty.session.newcontacteducountry == "TN")}{"selected='selected'"}{/if} label="Tunisia">Tunisia</option>
    					<option value="TR" {if ($smarty.session.newcontacteducountry == "TR")}{"selected='selected'"}{/if} label="Turkey">Turkey</option>
    					<option value="TM" {if ($smarty.session.newcontacteducountry == "TM")}{"selected='selected'"}{/if} label="Turkmenistan">Turkmenistan</option>
    					<option value="TC" {if ($smarty.session.newcontacteducountry == "TC")}{"selected='selected'"}{/if} label="Turks and Caicos Islands">Turks and Caicos Islands</option>
    					<option value="TV" {if ($smarty.session.newcontacteducountry == "TV")}{"selected='selected'"}{/if} label="Tuvalu">Tuvalu</option>
    					<option value="UG" {if ($smarty.session.newcontacteducountry == "UG")}{"selected='selected'"}{/if} label="Uganda">Uganda</option>
    					<option value="UA" {if ($smarty.session.newcontacteducountry == "UA")}{"selected='selected'"}{/if} label="Ukraine">Ukraine</option>
    					<option value="AE" {if ($smarty.session.newcontacteducountry == "AE")}{"selected='selected'"}{/if} label="United Arab Emirates">United Arab Emirates</option>
    					<option value="UK" {if ($smarty.session.newcontacteducountry == "UK")}{"selected='selected'"}{/if} label="United Kingdom">United Kingdom</option>
    					<option value="US" {if ($smarty.session.newcontacteducountry == "US")}{"selected='selected'"}{/if} label="United States">United States</option>
    					<option value="UM" {if ($smarty.session.newcontacteducountry == "UM")}{"selected='selected'"}{/if} label="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
    					<option value="UY" {if ($smarty.session.newcontacteducountry == "UY")}{"selected='selected'"}{/if} label="Uruguay">Uruguay</option>
    					<option value="SU" {if ($smarty.session.newcontacteducountry == "SU")}{"selected='selected'"}{/if} label="USSR">USSR</option>
    					<option value="UZ" {if ($smarty.session.newcontacteducountry == "UZ")}{"selected='selected'"}{/if} label="Uzbekistan">Uzbekistan</option>
    					<option value="VU" {if ($smarty.session.newcontacteducountry == "VU")}{"selected='selected'"}{/if} label="Vanuatu">Vanuatu</option>
    					<option value="VA" {if ($smarty.session.newcontacteducountry == "VA")}{"selected='selected'"}{/if} label="Vatican City State">Vatican City State</option>
    					<option value="VE" {if ($smarty.session.newcontacteducountry == "VE")}{"selected='selected'"}{/if} label="Venezuela">Venezuela</option>
    					<option value="VN" {if ($smarty.session.newcontacteducountry == "VN")}{"selected='selected'"}{/if} label="Vietnam">Vietnam</option>
    					<option value="VG" {if ($smarty.session.newcontacteducountry == "VG")}{"selected='selected'"}{/if} label="Virgin Islands (British)">Virgin Islands (British)</option>
    					<option value="VI" {if ($smarty.session.newcontacteducountry == "VI")}{"selected='selected'"}{/if} label="Virgin Islands (U.S.)">Virgin Islands (U.S.)</option>
    					<option value="WF" {if ($smarty.session.newcontacteducountry == "WF")}{"selected='selected'"}{/if} label="Wallis and Futuna Islands">Wallis and Futuna Islands</option>
    					<option value="EH" {if ($smarty.session.newcontacteducountry == "EH")}{"selected='selected'"}{/if} label="Western Sahara">Western Sahara</option>
    					<option value="YE" {if ($smarty.session.newcontacteducountry == "YE")}{"selected='selected'"}{/if} label="Yemen, Republic of">Yemen, Republic of</option>
    					<option value="YU" {if ($smarty.session.newcontacteducountry == "YU")}{"selected='selected'"}{/if} label="Yugoslavia">Yugoslavia</option>
    					<option value="ZR" {if ($smarty.session.newcontacteducountry == "ZR")}{"selected='selected'"}{/if} label="Zaire">Zaire</option>
    					<option value="ZM" {if ($smarty.session.newcontacteducountry == "ZM")}{"selected='selected'"}{/if} label="Zambia">Zambia</option>
    					<option value="ZW" {if ($smarty.session.newcontacteducountry == "ZW")}{"selected='selected'"}{/if} label="Zimbabwe">Zimbabwe</option>
    				</select>
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontactedustate">{$LANG.clientareastate} * </label>
    				<input type="text" style="direction: ltr;" name="newcontactedustate" pattern="[a-zA-Z0-9 ]*" id="newcontactedustate" value="{$smarty.session.newcontactedustate}" class="form-control" placeholder="{$LANG.newcontactpersonalstateH}" required />
    			</div>
    			<div class="form-group col-sm-2">
    				<label for="newcontacteducity">{$LANG.clientareacity} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteducity" pattern="[a-zA-Z0-9 ]*" id="newcontacteducity" value="{$smarty.session.newcontacteducity}" class="form-control" placeholder="{$LANG.newcontactpersonalcityH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteduaddress">{$LANG.domaindnsaddress} * </label>
    				<input type="text" style="direction: ltr;" name="newcontacteduaddress" pattern="[a-zA-Z0-9 ,.]*" id="newcontacteduaddress" value="{$smarty.session.newcontacteduaddress}" class="form-control" placeholder="{$LANG.newcontactpersonaladdressH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactedupostcode">{$LANG.clientareapostcode} * </label>
    				<input type="number" style="direction: ltr;" name="newcontactedupostcode" id="newcontactedupostcode" value="{$smarty.session.newcontactedupostcode}" class="form-control" placeholder="{$LANG.newcontactpersonalpostcodeH}" required />
    			</div>
    		</div>
    		
    		<div class="row">
    			<div class="form-group col-sm-4 col-sm-offset-2">
    				<label for="newcontacteduphone">{$LANG.irnicnewcontactpersonalphone} * </label>
    				<input type="number" style="direction: ltr;" name="newcontacteduphone" id="newcontacteduphone" value="{$smarty.session.newcontacteduphone}" class="form-control" placeholder="{$LANG.newcontactpersonalphoneH}" required />
    			</div>
    			<div class="form-group col-sm-4">
    				<label for="newcontactedufax">{$LANG.irnicnewcontactpersonalfax}</label>
    				<input type="number" style="direction: ltr;" name="newcontactedufax" id="newcontactedufax" value="{$smarty.session.newcontactedufax}" class="form-control" placeholder="{$LANG.newcontactpersonalfaxH}" />
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