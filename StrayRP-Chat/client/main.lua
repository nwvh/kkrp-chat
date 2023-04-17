RegisterNetEvent('esx_rpchat:sendMe')
AddEventHandler('esx_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)

	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(40, 80, 200); border-radius: 5px; font-size: 15px;"> <b>ME</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..message..'</font></div>',

			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(30,30,165,0.8); border-radius: 0px; border-left: 5px solid rgba(60,60,200, 1);"><strong>ME</strong> {0}: {1}</div>',
			args = { title, message }
    	})
		--local text = "" .. table.concat(message, " ") .. " "
		--TriggerEvent('3dme:shareDisplay', -1, text, source)
	end
  end
end)
RegisterNetEvent('esx_rpchat:sendTry')
AddEventHandler('esx_rpchat:sendTry', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)
	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		--TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(20, 192, 20); border-radius: 5px; font-size: 15px;"> <b>TRY</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..message..'</font></div>',

			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(20,192,20, 0.8); border-radius: 0px; border-left: 5px solid rgba(50,192,50, 1);"><strong>TRY</strong> {0}: {1}</div>',
			args = { title, message }
		})
		-- local text = "" .. table.concat("try", " ") .. " "
		-- TriggerEvent('3ddo:shareDisplay', -1, argus, source)
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendRoll')
AddEventHandler('esx_rpchat:sendRoll', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)


	
	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		if math.random(0,5) == 0 then
			 kostka = '1'
		elseif math.random(0,5) == 1 then
			 kostka = '2'
		elseif math.random(0,5) == 2 then
			 kostka = '3'
		elseif math.random(0,5) == 3 then
			 kostka = '4'
		elseif math.random(0,5) == 4 then
			 kostka = '5'
		elseif math.random(0,5) == 5 then
			 kostka = '6'
		end
		--TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(192, 19, 192); border-radius: 5px; font-size: 15px;"> <b>KOSTKA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..kostka..'</font></div>',

			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(192,19,192, 0.8); border-radius: 0px; border-left: 5px solid rgba(212,39,212, 1);"><strong>KOSTKA</strong> {0}: Na kostce padla {1}</div>',
			args = { title, kostka }
		})
		-- local text = "" .. table.concat("try", " ") .. " "
		-- TriggerEvent('3ddo:shareDisplay', -1, "cs", source)
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendMince')
AddEventHandler('esx_rpchat:sendMince', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)


	
	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		if math.random(0,1) == 0 then
			mince = 'PANNA'
		else
			mince = 'OREL'
		-- else
		-- 	mince = 'PANNA'
		-- elseif math.random(0,2) == 2 then
		-- 	mince = 'OREL'
		-- elseif math.random(0,2) == 2 then
		-- 	mince = 'OREL'

		end
		--TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(19, 192, 192); border-radius: 5px; font-size: 15px;"> <b>MINCE</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..mince..'</font></div>',
			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(19,192,192, 0.8); border-radius: 0px; border-left: 5px solid rgba(39,212,212, 1);"><strong>MINCE</strong> {0}: Na minci je {1}</div>',
			args = { title, mince }
		})
		-- local text = "" .. table.concat("try", " ") .. " "
		-- TriggerEvent('3ddo:shareDisplay', -1, "cs", source)
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendDo')
AddEventHandler('esx_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)
	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		--TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(192, 192, 19); border-radius: 5px; font-size: 15px;"> <b>DO</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..message..'</font></div>',
			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(192,172,19, 0.8); border-radius: 0px; border-left: 5px solid rgba(202,192,19, 1);"><strong>DO</strong> {0}: {1}</div>',
			args = { title, message }
		})
		local text = "" .. table.concat("do", " ") .. " "
		TriggerEvent('3ddo:shareDisplay', -1, text, source)
	end
  end
end)
RegisterNetEvent('esx_rpchat:sendDoc')
AddEventHandler('esx_rpchat:sendDoc', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	--TriggerEvent('3ddo:shareDisplay', -1, text, source)
	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		--TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(192, 192, 19); border-radius: 5px; font-size: 15px;"> <b>DOC</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..message..'</font></div>',

			template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(192,192,19, 0.8); border-radius: 0px; border-left: 5px solid rgba(200,200,18, 1);"><strong>DOC</strong> {0}: {1}</div>',
			args = { title, message }
		})
		local text = "" .. table.concat("doc", " ") .. " "
		-- TriggerEvent('3ddo:shareDisplay', -1, text, source)
	end
  end
end)
RegisterNetEvent('sendReport')
AddEventHandler('sendReport', function(id, name, message)
	local myId = PlayerId()
	local pid = GetPlayerFromServerId(id)
	ESX.TriggerServerCallback('fnx_adminsystem:GetGroup', function(groupgetted)
		if pid == myId then
			if message == '' then
				TriggerEvent('chat:addMessage', {
					template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(170,30,30, 0.8); border-radius: 0px; border-left: 5px solid rgba(190,50,50, 1);"><strong>REPORT</strong> Obsah reportu nemůže být prázdný!</div>',
					args = { id, name, message }
				})	
			elseif message == 'test' then
				TriggerEvent('chat:addMessage', {
					template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(170,30,30, 0.8); border-radius: 0px; border-left: 5px solid rgba(190,50,50, 1);"><strong>REPORT</strong> Ano, reporty fungují</div>',
					args = { id, name, message }
				})	
				-- CancelEvent()
			else
			TriggerEvent('chat:addMessage', {
				template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(170,30,30, 0.8); border-radius: 0px; border-left: 5px solid rgba(190,50,50, 1);"><strong>REPORT</strong> Report byl odeslán - {2}</div>',
				args = { id, name, message }
			})
		end	
		elseif groupgetted ~= "user" and pid ~= myId and message ~= '' and message ~= 'test' then
			TriggerEvent('chat:addMessage', {
				template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(170,30,30, 0.8); border-radius: 0px; border-left: 5px solid rgba(190,50,50, 1);"><strong>REPORT</strong> [{0}] {1}: {2}</div>',
				args = { id, name, message }
			})		
		end
	end)	  	
end)


RegisterNetEvent('esx_rpchat:sendLocalOOC')
AddEventHandler('esx_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 35 then
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(65, 65, 65); border-radius: 5px; font-size: 15px;"> <b>L-OOC</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>' ..title.. ' :</b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> '..message..'</font></div>',

      		template = '<div style="padding: 0.40vw; margin: 0.13vw; background-color: rgba(80, 80, 80, 0.8); border-radius: 0px; border-left: 5px solid rgba(100,100,100, 1);"></i> <strong>L-OOC</strong> {0}: {1}</div>',
        	args = { title, message }
    	})
	end
  end
end)

Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/tweet', "Twitter zpráva",  { { name = "Zpráva, kterou uvidí všichni", help = "Příklad: /tweet Ahoj!" } } )
  --TriggerEvent('chat:addSuggestion', '/bm',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  --TriggerEvent('chat:addSuggestion', '/anontwt',  _U('anontwt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   "Nahrazuje animaci",   { { name = "Zpráva", help = "Příklad: /me Pousmál se" } } )
	TriggerEvent('chat:addSuggestion', '/do',   "Popisuje situaci nebo očekává reakci od jiného hráče",   { { name = "Zpráva", help = "Příklad: /do Nemá u sebe doklady | H1: /do jaký je stav? H2: /do v bezvědomí" } } )
	TriggerEvent('chat:addSuggestion', '/report', "Odešle report aktivním STAFFům",    { { name = "Zpráva", help = "Zpráva, kterou chcete odeslat STAFFům. (Příklad: /report Dostal jsem KOS)" } } )
	--TriggerEvent('chat:addSuggestion', '/news', 'Globálna informácia z frakcie Weazel News (iba pre redaktorov)',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/reklama', 'Odešle reklamu, která bude viditelná pro všechny. Stojí $250',   { { name = "Zpráva", help = "Příklad: /ad <Dílna> má otevřeno!" } } )
 	TriggerEvent('chat:addSuggestion', '/lspd', 'Oznámení pro LSPD',   { { name = "Zpráva", help = "Policejní zpráva" } } )
 	TriggerEvent('chat:addSuggestion', '/ems', 'Oznámení pro EMS',   { { name = "Zpráva", help = "EMS Zpráva" } } )
  --TriggerEvent('chat:addSuggestion', '/sheriff', 'Oznámenie Sheriff - pro sheriffy!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/report', 'Zobrazí vám vašu aktuálnu pozíciu (súradnice XYZ a smer pohľadu)')
	TriggerEvent('chat:addSuggestion', '/doc', 'Odpočet (Příklad: /me Nabijí Zbraň | /doc 5)', { { name = 'Číslo', help = 'Počet sekund na vykonání RP akce' } } )
  --if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' then
  	TriggerEvent('chat:addSuggestion', '/bm',   "Anonymní zpráva do BlackMarketu - Potřebuješ VPN",   { { name = "Zpráva", help = "Anonymní Zpráva" } } )
  	TriggerEvent('chat:addSuggestion', '/roll',   "Hodíš náhodně kostkou číslo od 1-6")
  	TriggerEvent('chat:addSuggestion', '/id',   "Zobrazí tvoje ID")
  	TriggerEvent('chat:addSuggestion', '/combat',   "Pokud se hráč odpojil, zjistíš jeho ID a důvod odpojení")
  	TriggerEvent('chat:addSuggestion', '/mince',   "Hodíš náhodně mincí")
  	TriggerEvent('chat:addSuggestion', '/tag',   "[POUZE PRO ADMINY] Zapne STAFF Tag")
  	TriggerEvent('chat:addSuggestion', '/mdt',   "[STÁTNÍ SLOŽKY] Otevře MDT - Mobilní Databázní Terminál")
  	TriggerEvent('chat:addSuggestion', '/staff',   "[POUZE PRO ADMINY] Odešle STAFF Oznámení", {{name="Zpráva", help="Zpráva, kterou uvidí všichni hráči."}})
  	-- TriggerEvent('chat:addSuggestion', '/claim',   "[POUZE PRO ADMINY] Přebereš si report", {{name="ID Hráče", help="ID Hráče, který odeslal report."}})
  	-- TriggerEvent('chat:addSuggestion', '/close',   "[POUZE PRO ADMINY] Uzavře report", {{name="ID Hráče", help="ID hráče, který odeslal report."}})
  	TriggerEvent('chat:addSuggestion', '/a',   "[POUZE PRO ADMINY] STAFF Chat", {{name="Zpráva", help="Zpráva, kterou uvidí pouze ostatní členové AT."}})
  	TriggerEvent('chat:addSuggestion', '/dm',   "[POUZE PRO ADMINY] Odešle soukromou zprávu hráči", {
		{ name="ID Hráče", help="ID Hráče, kterému chceš odeslat zprávu" },
		{ name="Zpráva", help="Zpráva, kterou chceš odeslat hráči" }
	})
  	TriggerEvent('chat:addSuggestion', '/job',   "Zobrazí tvou práci")
  	TriggerEvent('chat:addSuggestion', '/group',   "Zobrazí tvou skupinu")
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
    	TriggerEvent('chat:removeSuggestion', '/bm')
    	TriggerEvent('chat:removeSuggestion', '/rk')
    	TriggerEvent('chat:removeSuggestion', '/rukojmi')
    	TriggerEvent('chat:removeSuggestion', '/ad')
    	TriggerEvent('chat:removeSuggestion', '/ems')
    	TriggerEvent('chat:removeSuggestion', '/police')
    	TriggerEvent('chat:removeSuggestion', '/tweet')
		TriggerEvent('chat:removeSuggestion', '/gps')
	end
end)