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

//include( dirname( __FILE__ ) . '/config.php' );
include_once( dirname( __FILE__ ) . '/inc/xml2ary.inc.php' );

class irNicClass {
	
	//function __construct($nictoken, $trid, $certificate, $serverURL) {
	function __construct() {
		$this->nictoken = ''; // token given from nic.ir
		$this->trid = ''; // id given from nic.ir like: ABC-12345
		$this->certificate = ''; // pem file name given from nic.ir like: 123456789_id123-irnic_D12345.pem 
		$this->serverURL = 'https://epp.nic.ir/submit';
	}
	
	function clTridGenrator() {
		//return $this->trid . '-' . rand(10000,99999);
		return $this->trid ;
	}
	
	static function parseResCode($result) {
		return $result['epp']['_c']['response']['_c']['result']['_a']['code'];
	}

	static function parseResMessage($result) {
		$err = $result['epp']['_c']['response']['_c']['result']['_c']['msg']['_v'];

		if ($exterr = $result['epp']['_c']['response']['_c']['result']['_c']['extValue']['_c']['reason']['_v']) {
			$val = '';
			foreach ($result['epp']['_c']['response']['_c']['result']['_c']['extValue']['_c']['value']['_c'] as $child) {
				$val = $child['_v'];

				if (!empty( $val )) {
					$err .= ' - ' . $val . ', ' . $exterr;
					continue;
				}
			}

			if (empty( $val )) {
				$err .= ' - ' . $exterr;
			}
		}

		return $err;
	}
	
	function contact_check($contacts, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}
		if (4 < count($contacts)) {$count = 4;}
		while ($i < $count) {
			$xmlContacts += '<contact:id>' . $handles[$i] . '</contact:id>';
			++$i;
		}
		
		$xml = '
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
         <command>
          <check>
           <contact:check xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
           ' . $xmlContacts . '
            <contact:authInfo>
             <contact:pw>' . $this->nictoken . '</contact:pw>
            </contact:authInfo>
           </contact:check>
          </check>
          <clTRID>' . $clTrid . '</clTRID>
         </command>
        </epp>';
		
		$result = $this->request($xml, 'contact_check');
		return $result;
	}
	
	function contact_info($contact) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

			$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <info>
		   <contact:info xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
			<contact:id>' . $contact . '</contact:id>
			<contact:authInfo>
			 <contact:pw>' . $this->nictoken . '</contact:pw>
			</contact:authInfo>
		   </contact:info>
		  </info>
		  <clTRID>' . $clTrid . '</clTRID>
		 </command>
		</epp>';

		
		$result = $this->request($xml, 'contact_info');
		return $result;
	}
	
	function contact_create($fname, $lname, $company, $ident, $voice, $fax, $email, $street, $sp, $pc, $city, $cc = 'IR', $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}
	
		$xml = '
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
        <command>
        <create>
            <contact:create xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
            <contact:postalInfo type="int">
            <contact:firstname>' . $fname . '</contact:firstname>
            <contact:lastname>' . $lname . '</contact:lastname>
            ';

			if (!empty( $company )) {
				$xml &= '<contact:org>' . $company . '</contact:org>';
			}

			$xml &= '
                <contact:addr>
                    <contact:street>' . $street . '</contact:street>
                    <contact:city>' . $city . '</contact:city>
                    <contact:sp>' . $sp . '</contact:sp>
                    <contact:pc>' . $pc . '</contact:pc>
                    <contact:cc>' . $cc . '</contact:cc>
                </contact:addr>
            </contact:postalInfo>
            <contact:voice>' . $voice . '</contact:voice>
            <contact:fax>' . $fax . '</contact:fax>
            <contact:ident>
            ';

			if ($ident['type']   = 'Person') {
				if (!empty( $ident['idcard_number'] )) {
					$xml &= '<contact:idcard cc="' . $ident['idcard_country'] . '" number="' . $ident['idcard_number'] . '" />';
				}


				if (!empty( $ident['passport_number'] )) {
					$xml &= '<contact:passport cc="' . $ident['passport_country'] . '" issuer="' . $ident['passport_issuer'] . '" number="' . $ident['passport_number'] . '"/>';
				}
			} else {
				if ($ident['type']   = 'Company') {
					$number = $ident['number'];
					$xml &= '<contact:privatereg cc="' . $ident['country'] . '" sp="' . $ident['sp'] . '" issuer="' . $ident['privatereg_issuer'] . '" category="' . $ident['category'] . '" number="' . $number . '" ' . (!empty( $ident['number2'] ) ? 'number2="' . $ident['number2'] . '"' : '') . ' />';
				} else {
					if ($ident['type']   = 'Organization') {
						$xml &= '<contact:govid cc="' . $ident['country'] . '" sp="' . $ident['sp'] . '" city="' . $ident['city'] . '" category="' . $ident['category'] . '" />';
					} else {
						if ($ident['type']   = 'Education') {
							$xml &= '<contact:eduid cc="' . $ident['country'] . '" sp="' . $ident['sp'] . '" city="' . $ident['city'] . '" category="' . $ident['category'] . '" />';
						}
					}
				}
			}

			$xml &= '
            </contact:ident>
            <contact:signature>' . $fname . ' ' . $lname . '</contact:signature>
            <contact:email>' . $email . '</contact:email>
            <contact:authInfo>
                <contact:pw>' . $this->nictoken . '</contact:pw>
            </contact:authInfo>
            </contact:create>
        </create>
        <clTRID>' . $clTrid . '</clTRID>
        </command>
        </epp>
            ';
		
		$result = $this->request($xml, 'contact_create');
		return $result;
	}
	
	function contact_create_personal($fname, $lname, $company, $mellicode, $passport, $passportissuer, $clientName, $clientlastname, $email, $voice, $fax, $street, $sp, $pc, $city, $passcc, $country, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <create>
   <contact:create xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
    <contact:postalInfo type="int">
     <contact:firstname>'.$fname.'</contact:firstname>
     <contact:lastname>'.$lname.'</contact:lastname>';
	 if($company){
$xml .= '<contact:org>'.$company.'</contact:org>';
	 }
$xml .= '<contact:addr>
      <contact:street>'.$street.'</contact:street>
      <contact:city>'.$city.'</contact:city>
      <contact:sp>'.$sp.'</contact:sp>
      <contact:pc>'.$pc.'</contact:pc>
      <contact:cc>'.$country.'</contact:cc>
     </contact:addr>
    </contact:postalInfo>
    <contact:voice>'.$voice.'</contact:voice>
    <contact:fax>'.$fax.'</contact:fax>
    <contact:ident>';
	if($mellicode){
$xml .= '<contact:idcard cc="IR" number="'.$mellicode.'"/>';
	}
	 if($passport && $passportissuer && $passcc){
$xml .= '<contact:passport cc="'.$passcc.'" issuer="'.$passportissuer.'" number="'.$passport.'"/>';
	 }
$xml .= '</contact:ident>
    <contact:signature>'.$fname.' '.$lname.'</contact:signature>
    <contact:email>'.$email.'</contact:email>
    <contact:authInfo>
     <contact:pw>'.$this->nictoken.'</contact:pw>
    </contact:authInfo>
   </contact:create>
  </create>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		
		$result = $this->request($xml, 'contact_create_personal');
		return $result;
	}

	function contact_create_private($fname, $lname, $company, $email, $privatecc, $privatesp, $issuer, $number, $number2, $category, $country, $sp, $city, $street, $pc, $voice, $fax, $clientName, $clientlastname, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <create>
   <contact:create xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
    <contact:postalInfo type="int">
     <contact:firstname>'.$fname.'</contact:firstname>
     <contact:lastname>'.$lname.'</contact:lastname>';
	 if($company){
$xml .= '<contact:org>'.$company.'</contact:org>';
	 }
$xml .= '<contact:addr>
      <contact:street>'.$street.'</contact:street>
      <contact:city>'.$city.'</contact:city>
      <contact:sp>'.$sp.'</contact:sp>
      <contact:pc>'.$pc.'</contact:pc>
      <contact:cc>'.$country.'</contact:cc>
     </contact:addr>
    </contact:postalInfo>
    <contact:voice>'.$voice.'</contact:voice>
    <contact:fax>'.$fax.'</contact:fax>
    <contact:ident>
     <contact:privatereg cc="'.$privatecc.'" sp="'.$privatesp.'" issuer="'.$issuer.'" category="'.$category.'" number="'.$number.'" '; 
	 if($number2){
$xml .= 'number2="'.$number2.'"';
	 }
$xml .= '/>
    </contact:ident>
    <contact:signature>'.$fname.' '.$lname.'</contact:signature>
    <contact:email>'.$email.'</contact:email>
    <contact:authInfo>
     <contact:pw>'.$this->nictoken.'</contact:pw>
    </contact:authInfo>
   </contact:create>
  </create>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		
		$result = $this->request($xml, 'contact_create_private');
		return $result;
	}

	function contact_create_edu($fname, $lname, $company, $email, $cc, $companycity, $companysp, $cat, $country, $sp, $city, $street, $pc, $voice, $fax, $clientName, $clientlastname, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <create>
   <contact:create xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
    <contact:postalInfo type="int">
     <contact:firstname>'.$fname.'</contact:firstname>
     <contact:lastname>'.$lname.'</contact:lastname>
     <contact:org>'.$company.'</contact:org>
     <contact:addr>
      <contact:street>'.$street.'</contact:street>
      <contact:city>'.$city.'</contact:city>
      <contact:sp>'.$sp.'</contact:sp>
      <contact:pc>'.$pc.'</contact:pc>
      <contact:cc>'.$country.'</contact:cc>
     </contact:addr>
    </contact:postalInfo>
    <contact:voice>'.$voice.'</contact:voice>
    <contact:fax>'.$fax.'</contact:fax>
    <contact:ident>
     <contact:eduid cc="'.$cc.'" sp="'.$companysp.'" city="'.$companycity.'" category="'.$cat.'"/>
    </contact:ident>
    <contact:signature>'.$fname.' '.$lname.'</contact:signature>
    <contact:email>'.$email.'</contact:email>
    <contact:authInfo>
     <contact:pw>'.$this->nictoken.'</contact:pw>
    </contact:authInfo>
   </contact:create>
  </create>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		
		$result = $this->request($xml, 'contact_create_edu');
		return $result;
	}

	function contact_create_gov($fname, $lname, $company, $email, $cc, $companycity, $companysp, $cat, $country, $sp, $city, $street, $pc, $voice, $fax, $clientName, $clientlastname, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <create>
   <contact:create xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
    <contact:postalInfo type="int">
     <contact:firstname>'.$fname.'</contact:firstname>
     <contact:lastname>'.$lname.'</contact:lastname>
     <contact:org>'.$company.'</contact:org>
     <contact:addr>
      <contact:street>'.$street.'</contact:street>
      <contact:city>'.$city.'</contact:city>
      <contact:sp>'.$sp.'</contact:sp>
      <contact:pc>'.$pc.'</contact:pc>
      <contact:cc>'.$country.'</contact:cc>
     </contact:addr>
    </contact:postalInfo>
    <contact:voice>'.$voice.'</contact:voice>
    <contact:fax>'.$fax.'</contact:fax>
    <contact:ident>
     <contact:govid cc="'.$cc.'" sp="'.$companysp.'" city="'.$companycity.'" category="'.$cat.'"/>
    </contact:ident>
    <contact:signature>'.$fname.' '.$lname.'</contact:signature>
    <contact:email>'.$email.'</contact:email>
    <contact:authInfo>
     <contact:pw>'.$this->nictoken.'</contact:pw>
    </contact:authInfo>
   </contact:create>
  </create>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		
		$result = $this->request($xml, 'contact_create_gov');
		return $result;
	}
	
	function contact_update($contact, $street, $sp, $pc, $city, $cc, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}
	
		$xml = '
		<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <update>
		   <contact:update xmlns:contact="http://epp.nic.ir/ns/contact-1.0">
			<contact:id>' . $contact . '</contact:id>
			<contact:chg>
			 <contact:postalInfo type="int">
			  <contact:addr>
			   <contact:street>' . $city . '</contact:street>
			   <contact:city>' . $street . '</contact:city>
			   <contact:sp>' . $sp . '</contact:sp>
			   <contact:pc>' . $pc . '</contact:pc>
			   <contact:cc>' . $cc . '</contact:cc>
			  </contact:addr>
			 </contact:postalInfo>
			</contact:chg>
			<contact:authInfo>
			 <contact:pw>' . $this->nictoken . '</contact:pw>
			</contact:authInfo>
		   </contact:update>
		  </update>
		  <clTRID>' . $clTrid . '</clTRID>
		 </command>
		</epp>
		';
		$result = $this->request($xml, 'contact_update');
		return $result;
	}
	
	function domain_check($domains, $clTrid) {
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

		$count = count( $domains );

		if (4 < $count) {$count = 4;}

		$domainsXml = '';
		$i = 0;

		while ($i < $count) {
			$domainsXml &= '<domain:name>' . $domains[$i] . '</domain:name>';
			++$i;
		}

		$xml = '
		<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <check>
		   <domain:check xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
			' . $domainsXml . '
			<domain:authInfo>
			 <domain:pw>' . $this->nictoken . '</domain:pw>
			</domain:authInfo>
		   </domain:check>
		  </check>
		  <clTRID>' . $clTrid . '</clTRID>
		 </command>
		</epp>
		';
		$result = $this->request($xml, 'domain_check');
		return $result;
	}
	
	function domain_info($domain, $clTrid = null) {
		if ($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <info>
   <domain:info xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
	<domain:name>' . $domain . '</domain:name>
	<domain:authInfo>
	 <domain:pw>' . $this->nictoken . '</domain:pw>
	</domain:authInfo>
   </domain:info>
  </info>
  <clTRID>' . $clTrid . '</clTRID>
 </command>
</epp>';
		$result = $this->request($xml, 'domain_info');
		return $result;
	}
	
	function domain_create($domain, $period, $holder, $admin, $tech, $bill, $reseller, $ns1, $ns2 = null, $ns1_ip = null, $ns2_ip = null, $clTrid) {
		if ($clTrid == null) {$clTrid = $this->clTridGenrator();}

		$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
		 <command>
		  <create>
		   <domain:create xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
			<domain:name>' . $domain . '</domain:name>
			<domain:period unit="m">' . $period . '</domain:period>
			<domain:ns>
			 <domain:hostAttr>
			  <domain:hostName>' . $ns1 . '</domain:hostName>
			  ';

		if ($ns1_ip !== null) {
			$xml .= '
		   <domain:hostAddr ip="' . $ns1_ip['version'] . '">' . $ns1_ip['ip'] . '</domain:hostAddr>
		   ';
		}

		$xml .= '</domain:hostAttr>';

		if ($ns2 !== null) {
			$xml .= '
			 <domain:hostAttr>
				<domain:hostName>' . $ns2 . '</domain:hostName>
			 ';

			if ($ns2_ip !== null) {
				$xml .= '
		   <domain:hostAddr ip="' . $ns2_ip['version'] . '">' . $ns2_ip['ip'] . '</domain:hostAddr>
		   ';
			}

			$xml .= '</domain:hostAttr>';
		}

		$xml .= '</domain:ns>';
		$xml .= '
			<domain:contact type="holder">' . $holder . '</domain:contact>
			<domain:contact type="admin">' . $admin . '</domain:contact>
			<domain:contact type="tech">' . $tech . '</domain:contact>
			<domain:contact type="bill">' . $bill . '</domain:contact>
				';

		if ($reseller !== null) {
			$xml .= '<domain:contact type="reseller">' . $reseller . '</domain:contact>';
		}

		$xml .= '
			<domain:agreement>true</domain:agreement>
			<domain:authInfo>
			 <domain:pw>' . $this->nictoken . '</domain:pw>
			</domain:authInfo>
		   </domain:create>
		  </create>
		  <clTRID>' . $clTrid . '</clTRID>
		 </command>
		</epp>
		';

		$result = $this->request($xml, 'domain_create');
		return $result;
	}

	function domain_renew($domain, $period, $expDate, $clTrid = null) {
		if ($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <renew>
   <domain:renew xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
	<domain:name>'.$domain.'</domain:name>
	<domain:curExpDate>'.$expDate.'</domain:curExpDate>
	<domain:period unit="m">'.$period.'</domain:period>
	<domain:authInfo>
	 <domain:pw>'.$this->nictoken.'</domain:pw>
	</domain:authInfo>
   </domain:renew>
  </renew>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';

		$result = $this->request($xml, 'domain_renew');
		return $result;
	}

	function domain_update($domain, $addnameservers, $remnameservers, $irnictech, $clTrid = null) {
		if ($clTrid == null) {
			$clTrid = $this->clTridGenrator();
		}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <update>
   <domain:update xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
    <domain:name>'.$domain.'</domain:name>';
	if($addnameservers){
$xml .= '<domain:add>
     <domain:ns>';
		foreach($addnameservers as $addkey => $addval){
			if($addval){
$xml .= '<domain:hostAttr>
       <domain:hostName>'.$addval.'</domain:hostName>
      </domain:hostAttr>';
			}
		}
$xml .= '</domain:ns>
    </domain:add>';
	}
	if($remnameservers){
$xml .= '<domain:rem>
     <domain:ns>';
		foreach($remnameservers as $addkey => $addval){
			if($addval){
$xml .= '<domain:hostAttr>
       <domain:hostName>'.$addval.'</domain:hostName>
      </domain:hostAttr>';
			}
		}
$xml .= '</domain:ns>
    </domain:rem>';
	}
$xml .= '<domain:chg>
     <domain:contact type="tech">'.$irnictech.'</domain:contact>
    </domain:chg>
    <domain:authInfo>
     <domain:pw>'.$this->nictoken.'</domain:pw>
    </domain:authInfo>
   </domain:update>
  </update>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
			
		$result = $this->request($xml, 'domain_update');
		return $result;
	}
	
	function domain_contact_update($domain, $admin, $tech, $bill, $clTrid = null) {
		if ($clTrid == null) {
			$clTrid = $this->clTridGenrator();
		}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <update>
   <domain:update xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
    <domain:name>'.$domain.'</domain:name>
    <domain:chg>';
if ($admin != null) {	
$xml .= '<domain:contact type="admin">'.$admin.'</domain:contact>';
}
if ($tech != null) {
$xml .= '<domain:contact type="tech">'.$tech.'</domain:contact>';
}
if ($bill != null) {
$xml .= '<domain:contact type="bill">'.$bill.'</domain:contact>';
}
$xml .= '</domain:chg>
    <domain:authInfo>
     <domain:pw>'.$this->nictoken.'</domain:pw>
    </domain:authInfo>
   </domain:update>
  </update>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		$result = $this->request($xml, 'domain_contact_update');
		return $result;
	}
	
	function domain_req($domain){
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="utf-8" standalone="no"?>
 <epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
  <command>
   <update>
    <domain:update xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
     <domain:name>' . $domain . '</domain:name>
     <domain:authInfo>
      <domain:pw>' . $this->nictoken . '</domain:pw>
     </domain:authInfo>
    </domain:update>
   </update>
   <extension>
    <pin op="req" />
   </extension>
   <clTRID>' . $clTrid . '</clTRID>
  </command>
 </epp>';
	
		$result = $this->request($xml, 'domain_req');
		return $result;
	}

	function domain_lock($domain){
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="utf-8" standalone="no"?>
 <epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
  <command>
   <update>
    <domain:update xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
     <domain:name>' . $domain . '</domain:name>
     <domain:authInfo>
      <domain:pw>' . $this->nictoken . '</domain:pw>
     </domain:authInfo>
    </domain:update>
   </update>
   <extension>
    <pin op="lock" />
   </extension>
   <clTRID>' . $clTrid . '</clTRID>
  </command>
 </epp>';
	
		$result = $this->request($xml, 'domain_lock');
		return $result;
	}

	function domain_transfer($domain, $holder, $adminContact, $technicalContact, $billingContact, $pincode){
		if($clTrid == null) {$clTrid = $this->clTridGenrator();}

$xml = '<?xml version="1.0" encoding="utf-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
   <update>
     <domain:update xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
       <domain:name>'.$domain.'</domain:name>
       <domain:chg>
         <domain:contact type="holder">'.$holder.'</domain:contact>
         <domain:contact type="admin">'.$adminContact.'</domain:contact>
         <domain:contact type="tech">'.$technicalContact.'</domain:contact>
         <domain:contact type="bill">'.$billingContact.'</domain:contact>
       </domain:chg>
       <domain:authInfo>
         <domain:pw>'.$this->nictoken.'</domain:pw>
       </domain:authInfo>
     </domain:update>
   </update>
   <extension>
     <pin pinCode="'.$pincode.'" />
   </extension>
   <clTRID>' . $clTrid . '</clTRID>
 </command>
</epp>';
	
		$result = $this->request($xml, 'domain_transfer');
		return $result;
	}
	
	function domain_delete($domain, $clTrid = null) {
		if ($clTrid == null) {
			$clTrid = $this->clTridGenrator();
		}

		$xml = '
			<?xml version="1.0" encoding="UTF-8" standalone="no"?>
			<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
			 <command>
			  <delete>
			   <domain:delete xmlns:domain="http://epp.nic.ir/ns/domain-1.0">
				<domain:name>' . $domain . '</domain:name>
				<domain:authInfo>
				 <domain:pw>' . $this->nictoken . '</domain:pw>
				</domain:authInfo>
			   </domain:delete>
			  </delete>
			  <clTRID>' . $clTrid . '</clTRID>
			 </command>
			</epp>
		';
		$result = $this->request($xml, 'domain_delete');
		return $result;
	}

	function pollRequest($clTrid = null) {
		if ($clTrid == null) {
			$clTrid = $this->clTridGenrator();
		}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <poll op="req"/>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		$result = $this->request($xml, 'pollRequest');
		return $result;
	}

	function pollAck($msgID, $clTrid = null) {
		if ($clTrid == null) {
			$clTrid = $this->clTridGenrator();
		}

$xml = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<epp xmlns="urn:ietf:params:xml:ns:epp-1.0">
 <command>
  <poll op="ack" msgID="'.$msgID.'"/>
  <clTRID>'.$clTrid.'</clTRID>
 </command>
</epp>';
		$result = $this->request($xml, 'pollAck');
		return $result;
	}
	
	function request($xmlStr, $action) {
		
		global $_LANG;
		date_default_timezone_set('Asia/Tehran');

		$hour = date("H",time());
		$minute = date("i",time());
		//$hour = 00;
		//$minute = 00;
		
		//$admin_url = $_SERVER['REQUEST_URI'];
		//$admin = substr($admin_url,1,5);
		//$admin = strtolower($admin);

		if(((($hour == 00) && ($minute <= 30)) || ($hour == 23)) && ($action != 'domain_info')){
			$link = "irnic-rules.php?error=NicDaily";
			$host = $_SERVER['HTTP_HOST'];
			$location = $host."/".$link;
			$now_Todo = date("Y-m-d",time());
			$xmlstrArray = xml2ary($xmlStr);
			$xmlString = htmlentities($xmlStr);
			
			switch ($action) {
				case "contact_info" :
					$contact_info_nic_handle = $xmlstrArray['epp']['_c']['command']['_c']['info']['_c']['contact:info']['_c']['contact:id']['_v'];
					$description = '<pre style="text-align: right;direction: rtl">'; 
					$description .= $_LANG['IRNIC_disabled']." <br>"; 
					$description .= $_LANG['IRNIC_request_handler_info']." ".$contact_info_nic_handle." ".$_LANG['IRNIC_no_done']; 
					$description .= "</pre>";
					break;
				case "domain_renew" : 
					$domain_renew_domain = $xmlstrArray['epp']['_c']['command']['_c']['renew']['_c']['domain:renew']['_c']['domain:name']['_v'];
					$domain_renew_period_m = $xmlstrArray['epp']['_c']['command']['_c']['renew']['_c']['domain:renew']['_c']['domain:period']['_v'];
					$description = '<pre style="text-align: right;direction: rtl">';
					$description .= $_LANG['IRNIC_disabled']." <br>"; 
					$description .= $_LANG['IRNIC_domain_renew_request']." ".$domain_renew_domain." ".$_LANG['IRNIC_howlong']." ".$domain_renew_period_m." ".$_LANG['IRNIC_month_no_done']." "; 
					$description .= "</pre>";
					break;
				case "domain_req" : 
					$domain_req_domain = $xmlstrArray['epp']['_c']['command']['_c']['update']['_c']['domain:update']['_c']['domain:name']['_v'];
					$description = '<pre style="text-align: right;direction: rtl">';
					$description .= $_LANG['IRNIC_disabled']." <br>"; 
					$description .= $_LANG['IRNIC_request_unlock_domain']." ".$domain_req_domain." ".$_LANG['IRNIC_no_done']; 
					$description .= "</pre>";
					break;
				case "domain_update" : 
					$domain_update_domain = $xmlstrArray['epp']['_c']['command']['_c']['update']['_c']['domain:update']['_c']['domain:name']['_v'];
					$domain_update_ns1 = $xmlstrArray['epp']['_c']['command']['_c']['update']['_c']['domain:update']['_c']['domain:add']['_c']['domain:ns']['_c']['domain:hostAttr'][0]['_c']['domain:hostName']['_v'];
					$domain_update_ns2 = $xmlstrArray['epp']['_c']['command']['_c']['update']['_c']['domain:update']['_c']['domain:add']['_c']['domain:ns']['_c']['domain:hostAttr'][1]['_c']['domain:hostName']['_v'];
					$description = '<pre style="text-align: right;direction: rtl">';
					$description .= $_LANG['IRNIC_disabled']." <br>"; 
					$description .= $_LANG['IRNIC_update_domain_info']." ".$domain_update_domain." ".$_LANG['IRNIC_no_done']." <br>"; 
					$description .= $_LANG['IRNIC_requested_info']." : ".$domain_update_ns1." / ".$domain_update_ns2; 
					$description .= "</pre>";
					break;

				case "contact_check" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_create" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_create_personal" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_create_private" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_create_edu" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_create_gov" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "contact_update" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_check" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				//case "domain_info" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_create" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_contact_update" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_lock" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_transfer" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "domain_delete" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "pollRequest" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				case "pollAck" : $description = '<pre style="text-align: right;direction: rtl">'.$_LANG['IRNIC_disabled'].' <br>'.$action;  break;
				default : $description = $_LANG['IRNIC_disabled_nostatus']; break;
			}

			
			//$insert = mysql_query("INSERT INTO tbltodolist() values('','$now_Todo','$description','$xmlString',0,'Pending','$now_Todo')")or die(mysql_error());
            return "TimeError";
			//header("Location:http://".$location);
			//exit;
			
		} else {
		
			$XML = stripslashes(trim($xmlStr));

			$USER_CERTIFICATE_FILE = dirname( __FILE__ ) . '/' . $this->certificate;

			
			// create a new cURL resource
			$ch = curl_init();
				
			//FALSE to stop cURL from verifying the peer's certificate
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			//The name of a file containing a PEM formatted certificate. 
			curl_setopt($ch, CURLOPT_SSLCERT, $USER_CERTIFICATE_FILE);
			//TRUE to return the transfer as a string of the return value of curl_exec() instead of outputting it out directly.
			curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
			//The contents of the "User-Agent: "
			curl_setopt($ch, CURLOPT_USERAGENT, "IRNIC_EPP_Client_Sample");
			//TRUE to do a regular HTTP POST.This POST is the normal application/x-www-form-urlencoded kind, most commonly used by HTML forms.
			curl_setopt($ch, CURLOPT_POST, false);
			//The URL to fetch.
			curl_setopt($ch, CURLOPT_URL,$this->serverURL);
			//The full data to post in a HTTP "POST" operation.
			curl_setopt($ch, CURLOPT_POSTFIELDS, $xmlStr);		
			
			
			$response = curl_exec( $ch );

			if (curl_errno( $ch ) !== 0) {
				$response = '
					<epp xmlns="urn:ietf:params:xml:ns:epp-1.0" >
						<response>
							<result code="-1" >
								<msg>Connection error: ' . curl_error( $ch ) . '</msg>
							</result>
						</response>
					</epp>
				';
			}
			curl_close( $ch );
			
			$this->irNicLog($action, $XML, $response);
			return $response;
		}
	}
	
	function irNicLog($action, $reqstring, $resdata) {
		$nictoken = $this->nictoken2;
		$replacevars = array($nictoken);
		
		$requeststring = xml2ary($reqstring);
		$responsedata = xml2ary($resdata);
		logModuleCall('irnic',$action,$reqstring,$resdata,$resdata,$replacevars);
	}
}