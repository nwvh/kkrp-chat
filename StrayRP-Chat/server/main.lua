ESX = exports["es_extended"]:getSharedObject()
--AddEventHandler('chatMessage', function(playerId, playerName, message)
--	if string.sub(message, 1, string.len('/')) ~= '/' then
--		CancelEvent()
--
--		playerName = GetRealPlayerName(playerId)
--		TriggerClientEvent('chat:addMessage', -1, {args = {_U('ooc_prefix', playerName), message}, color = {128, 128, 128}})
--	end
--end)

--RegisterCommand('twt', function(playerId, args, rawCommand)
--	if playerId == 0 then
--		print('esx_rpchat: you can\'t use this command from console!')
--	else
--		args = table.concat(args, ' ')
--
--		local playerName = GetRealPlayerName(playerId)
--
--		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', playerName), args}, color = {0, 153, 204}})
--	end
--end, false)
--
--RegisterCommand('anontwt', function(playerId, args, rawCommand)
--	if playerId == 0 then
--		print('esx_rpchat: you can\'t use this command from console!')
--	else
--		args = table.concat(args, ' ')
--
--		local playerName = GetRealPlayerName(playerId)
--
--		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', "Anonymous"), args}, color = {0, 153, 204}})
--	end
--end, false)

--RegisterCommand('me', function(playerId, args, rawCommand)
--	if playerId == 0 then
--		print('esx_rpchat: you can\'t use this command from console!')
--	else
--		args = table.concat(args, ' ')
--		local playerName = GetRealPlayerName(playerId)
--
--		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerName), args, {255, 0, 0})
--	end
--end, false)

--RegisterCommand('do', function(playerId, args, rawCommand)
--	if playerId == 0 then
--		print('esx_rpchat: you can\'t use this command from console!')
--	else
--		args = table.concat(args, ' ')
--		local playerName = GetRealPlayerName(playerId)
--
--		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerName), args, {0, 0, 255})
--	end
--end, false)

RegisterCommand('dm', function(source, args, user) -- Direct Message command
	local xPlayer = ESX.GetPlayerFromId(source)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)
		local retval --[[ string ]] =
		GetPlayerName(
			player --[[ Player ]]
		)
		zprava = table.concat(args, "")
		if Config.AdminGroups[xPlayer.getGroup()] == true then
			TriggerClientEvent('chat:addMessage', player, {
				-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(0, 0, 0, 0.79); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(192, 20, 20); border-radius: 5px; font-size: 15px;"> <b>ZPRÁVA OD STAFFA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b>{0}: </b></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> {1}</font></div>',
				template = '<div style="padding: 0.40vw; margin: 0.10vw; background-color: rgba(170, 10, 10, 0.8); border-left: 5px solid rgba(170,40,30, 1); border-radius: 0px;"><strong>Zpráva od STAFFa - {0}</strong>: {1}</div>',
				-- template = '<div style="padding: 0.6vw; margin: 0.3vw; background-color: rgba(170, 50, 50, 1); border-radius: 4px;"><i class="fa fa-comments"></i> <strong>Zpráva od STAFFa</strong>: {0}</div>',
				args = { GetPlayerName(source), table.concat(args, " ") }
			})
			--TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
			TriggerClientEvent('chat:addMessage', source, {
				-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(0, 0, 0, 0.79); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(20, 192, 20); border-radius: 5px; font-size: 15px;"> <b>ÚSPĚCH</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> Zpráva byla odeslána hráči {0}</font></div>',

				template = '<div style="padding: 0.40vw; margin: 0.10vw; background-color: rgba(10, 170, 10, 0.8); border-left: 5px solid rgba(30,200,30, 1); border-radius: 0px;"><strong>Úspěch</strong>: Zpráva byla odeslána hráči {0}</div>',
				-- template = '<div style="padding: 0.6vw; margin: 0.3vw; background-color: rgba(170, 50, 50, 1); border-radius: 4px;"><i class="fa fa-comments"></i> Zpráva byla odeslána hráči {0}</div>',
				args = { retval }
			})	else
				TriggerClientEvent('chat:addMessage', source, {
					template = '<div style="padding: 0.6vw; margin: 0.3vw; background-color: rgba(190, 50, 50, 1); border-radius: 4px;"><i class="fa fa-exclamation"></i> <strong>Chyba</strong><br> Hráč s tímto ID neexistuje</div>',
					args = {}
				})	end
		else
			TriggerClientEvent('chat:addMessage', source, {
				-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(0, 0, 0, 0.79); border-radius: 5px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(192, 20, 20); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;"> Nejsi ADMIN!</font></div>',

				template = '<div style="padding: 0.40vw; margin: 0.10vw; background-color: rgba(170, 10, 10, 0.8); border-left: 5px solid rgba(170,40,30, 1); border-radius: 0px;"><strong>Chyba</strong>: Na tento příkaz nemáš oprávnění!</div>',
				-- template = '<div style="padding: 0.6vw; margin: 0.3vw; background-color: rgba(170, 50, 50, 1); border-radius: 4px;"><i class="fa fa-comments"></i> <strong>Nejsi ADMIN</strong></div>',
				args = { table.concat(args, " ") }
			})
		end

end,false)

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
