Config        = {}
Config.Locale = 'en'

Config.EnableESXIdentity = true -- only turn this on if you are using esx_identity and want to use RP names

Config.AdminGroups = {
    ['zkmod'] = true,
    ['staff'] = true,
    ['admin'] = true,
    ['hos'] = true,
    ['zkadmin'] = true,
    ['legalstaff'] = true,
    ['nelegalstaff'] = true,
    ['gangstaff'] = true,
    --['admin'] = true,
    ['dev'] = true,
    ['superadmin'] = true,
    ['owner'] = true,
}

Config.adminRanks = { -- Idk why I have two admin groups configs, but this one is for reports and admin chat
				'dev',
				'owner',
				'staff',
				'zkmod',
				'legalstaff',
				'gangstaff',
				'nelegalstaff',
				'zkadmin',
				'hadmin',
				-- 'zkmod',	
}
