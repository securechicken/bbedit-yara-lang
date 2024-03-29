rule type_Threat_RuleName : Namespace {
	meta:
		description = "Blah"
		author = "#NAME#"
		copyright = "#NAME#"
		version = "1.0"
		last_modified = "#DATETIME YYYY-MM-dd#"
		hash = "ABC"
	strings:
		// This is a comment
		$a1 = "aaa" nocase ascii wide
		$a2 = { BA D1 ( DE | AD ) A? [2-8] CE }
		$a3 = "hithere" xor
		$b1 = /[a-z]+\d{3}\/(file|main)\.php/
	condition:
		filesize < 10MB and ( (uint16(0) == 0x5A4D) )
		and ( #b1 > 4 )
		and ( $a1 in (@a2..filesize) )
		and ( for any of ($a*) : ( (# >= 2) and ($ in (@b1..(@b1+1024))) ) )
}#BLOCK#
