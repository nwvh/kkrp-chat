ESX = exports["es_extended"]:getSharedObject()

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			name = identity['name'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			job = identity['job'],
			group = identity['group']
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(source, name, message)
  local jmenoHrace = GetPlayerName(source)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()

    if Config.EnableESXIdentity then name = GetCharacterName(source) end

    TriggerClientEvent('esx_rpchat:sendLocalOOC', -1, source, jmenoHrace, message, {30, 144, 255});
  end
end)

RegisterCommand('staff', function(source,args,rawCommand) -- Replacement for txadmin announcements. Needs one of admin groups specified in config.lua
  local xPlayer = ESX.GetPlayerFromId(source)
  local toSay = ''
    for i=1,#args do
     toSay = toSay .. args[i] .. ' ' 
   end

   if toSay == '' and Config.AdminGroups[xPlayer.getGroup()] == true then
    TriggerClientEvent('chat:addMessage', source, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Zpráva nemůže být prázdná!</font></div>',
      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(170, 40, 40, 0.8); border-left: 5px solid rgba(200,60,60, 0.8); border-radius: 0px;" > <strong style=font-weight: bold;>CHYBA</strong>: Zpráva nemůže být prázdná!</div>',
      args = { }
    })
  elseif toSay ~= '' and Config.AdminGroups[xPlayer.getGroup()] == true then  

    TriggerClientEvent('chat:addMessage', -1, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>STAFF OZNÁMENÍ</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(170, 40, 40, 0.8); border-left: 5px solid rgba(200,60,60, 0.8); border-radius: 0px;" > <strong style=font-weight: bold;>STAFF Oznámení</strong>: {0}</div>',
      args = { toSay }
    })
  else
    TriggerClientEvent('chat:addMessage', source, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Na toto nemáš práva!</font></div>',
      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(170, 40, 40, 0.8); border-left: 5px solid rgba(200,60,60, 0.8); border-radius: 0px;" > <strong style=font-weight: bold;>CHYBA</strong>: Na tento příkaz nemáš práva!</div>',
      args = { }
    })   
  end

end,false)


RegisterCommand('tweet', function(source, args, rawCommand) -- Twitter command

    local playerName = GetCharacterName(source)
    local msg = rawCommand:sub(6)
    local fal = GetCharacterName(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.1vw; background-color: rgba(28, 160, 242, 0.8); border-left: 5px solid rgba(48,180,255, 1); border-radius: 0px;"><strong>TWITTER</strong> @{0}: {1}</div>',
        args = { fal, msg }
    })
end, false)

RegisterCommand('reklama', function(source, args, rawCommand) -- /Ad command
  local playerName = GetCharacterName(source)
  local msg = rawCommand:sub(8)
  local fal = GetCharacterName(source)
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.getAccount('bank').money >= 250 then
    TriggerClientEvent('chat:addMessage', -1, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(170, 210, 60); border-radius: 5px; font-size: 15px;"> <b>REKLAMA</b></font> {0}:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(150 , 190, 30, 0.8); border-left: 5px solid rgba(170,210,60, 1); border-radius: 0px;"></i> <strong>REKLAMA</strong>: {0}</div>',
        args = {fal, msg }
    })
    xPlayer.removeAccountMoney('bank', 250)
    ESX.ShowNotification("Zaplatil jsi $250 za reklamu!")
    -- TriggerClientEvent('okokNotify:Alert', source, "Reklama", "Reklama byla odeslána! Zaplatil jsi 250$", 3500, 'reklama')
  else
    ESX.ShowNotification("Pro odeslání reklamy potřebuješ 250$")
  end

end, false)

RegisterCommand('bm', function(source, args, rawCommand) -- Blackmarket Command
  local xPlayer = ESX.GetPlayerFromId(source)
  local toSay = table.concat(args, ' ')
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getInventoryItem('vpn').count >= 1 then -- Player will need 'VPN' item
    TriggerClientEvent('chat:addMessage', -1, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(60, 60, 60); border-radius: 5px; font-size: 15px;"> <b>BLACKMARKET</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font> [{0}]:  <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',

      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(120, 20, 20, 0.8); border-left: 5px solid rgba(130,40,40, 1); border-radius: 0px;"> <strong style=font-weight: bold;>Black Market [{0}]</strong>: {1}</div>',
        args = {source, toSay}
    })
  else
    TriggerClientEvent('chat:addMessage', source, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Pro psaní na blackmarket musíš mít VPN!</font></div>',

      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(120, 20, 20, 0.8); border-left: 5px solid rgba(130,40,40, 1); border-radius: 0px;">Pro psaní na Black Market potřebuješ VPN!</div>',
        args = {source, toSay}
    })
  end

end, false)

RegisterCommand('police', function(source, args, rawCommand) -- Police command for LSPD
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = table.concat(args, ' ')
  
    if xPlayer.job.name == 'police' then 
      TriggerClientEvent('chat:addMessage', -1, {
        -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(40, 40, 170); border-radius: 5px; font-size: 15px;"> <b>LOS SANTOS POLICE DEPARTMENT</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',

        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(40, 40, 180, 0.8); border-left: 5px solid rgba(60,60,220, 1); border-radius: 0px;"><strong style=font-weight: bold;>Los Santos Police Department</strong>: {0}</div>',
            args = {toSay}
        })
    else 
      TriggerClientEvent('chat:addMessage', source, {
        -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Nejsi člen LSPD!</font></div>',

        template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(40, 40, 180, 0.8); border-left: 5px solid rgba(60,60,220, 1); border-radius: 0px;">Nejsi člen LSPD!</div>',
        args = {}
      })
    end
  
end, false)

RegisterCommand('sheriff', function(source, args, rawCommand) -- Sheriff commands for LSSD
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = table.concat(args, ' ')

    if xPlayer.job.name == 'lssd' then 
    TriggerClientEvent('chat:addMessage', -1, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 111, 64); border-radius: 5px; font-size: 15px;"> <b>LOS SANTOS SHERIFF DEPARTMENT</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',

        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(180, 61, 34, 0.8); border-left: 5px solid rgba(200,81,64, 1); border-radius: 0px;"><strong>Los Santos Sheriff Department</strong>: {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Nejsi člen LSSD!</font></div>',

      template = '<div style="padding: 0.45vw; margin: 0.05vw; background-color: rgba(180, 70, 34, 0.8); border-left: 5px solid rgba(200,80,64, 1); border-radius: 0px;">Nejsi člen LSSD!</div>',
      args = {}
    })
  end

end, false)

RegisterCommand('ems', function(source, args, rawCommand) -- EMS commands for EMS
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = table.concat(args, ' ')

    if xPlayer.job.name == 'ambulance' then 
    TriggerClientEvent('chat:addMessage', -1, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 111, 64); border-radius: 5px; font-size: 15px;"> <b>LOS SANTOS SHERIFF DEPARTMENT</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',

        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(180, 50, 50, 0.8); border-left: 5px solid rgba(200,81,64, 1); border-radius: 0px;"><strong>Emergency Medical Services</strong>: {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      -- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(200, 60, 60); border-radius: 5px; font-size: 15px;"> <b>CHYBA</b></font>   <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Nejsi člen LSSD!</font></div>',

      template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(180, 50, 50, 0.8); border-left: 5px solid rgba(200,81,64, 1); border-radius: 0px;"><strong>Chyba</strong>: Nejsi člen EMS</div>',
      args = {}
    })
  end

end, false)



RegisterCommand('me', function(source, args, rawCommand) -- /me command
  local args = table.concat(args, ' ')
  local name = GetCharacterName(source)

  TriggerClientEvent('esx_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  -- TriggerClientEvent('3dme:shareDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, rawCommand) -- /do command
  local args = table.concat(args, " ")
  local name = GetCharacterName(source)

  TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  -- TriggerClientEvent('3ddo:shareDisplay', -1, "* " ..args.. " *", source)

end)
RegisterCommand('roll', function(source, args, rawCommand) -- /roll command
  local args = table.concat(args, " ")
  local name = GetCharacterName(source)

  TriggerClientEvent('esx_rpchat:sendRoll', -1, source, name, args, { 255, 198, 0 })

end)

RegisterCommand('mince', function(source, args, rawCommand) -- Coin Flip
  local args = table.concat(args, " ")
  local name = GetCharacterName(source)

  TriggerClientEvent('esx_rpchat:sendMince', -1, source, name, args, { 255, 198, 0 })
  -- TriggerClientEvent('3ddo:shareDisplay', -1, "* " ..args.. " *", source)
  -- TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)

end)
RegisterCommand('try', function(source, args, rawCommand) -- /Try - random YES / NO Command
  --local args = table.concat(args, " ")
  local name = GetCharacterName(source)
  if math.random(1,2) == 1 then
    argus = "ANO"
  else
    argus = "NE"
  end
  ExecuteCommand("do "..argus)
  TriggerClientEvent('esx_rpchat:sendTry', -1, source, name, argus, { 255, 198, 0 })
  TriggerEvent('3ddo:shareDisplay', -1, argus, source)



end)


RegisterCommand('doc', function(source, args, rawCommand) -- /Doc - Countdown command

  local name = GetCharacterName(source)
  if args[1] ~= nil then 
    local counter_doc = 0
    local pocetOpakovani = tonumber(args[1])
    if pocetOpakovani < 101 then
      while counter_doc < pocetOpakovani do
          counter_doc = counter_doc + 1 
          TriggerClientEvent('esx_rpchat:sendDoc', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
          -- TriggerEvent('3ddo:shareDisplay', -1, counter_doc.."/"..pocetOpakovani, source)
          -- TriggerClientEvent('3ddoa:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
          -- ExecuteCommand("do "..counter_doc.."/"..pocetOpakovani)
          Wait(1000)
    -- if pocetOpakovani 
    --   else
    --   TriggerClientEvent('chat:addMessage', source, {
    --   template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(170, 40, 40, 0.8); border-left: 5px solid rgba(200,60,60, 0.8); border-radius: 0px;" > <strong style=font-weight: bold;>CHYBA</strong>: Maximální délka v /doc je 101</div>',
    --   args = { }
    -- })
        

      end 
    end

  end
end)

RegisterCommand("a", function(source, args, rawCommand)	-- /a Admin Chat
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		local playerName = GetPlayerName(source)
		if havePermission(xPlayer) then
			if args[1] then
				local message = string.sub(rawCommand, 3)
				local xAll = ESX.GetPlayers()
				for i=1, #xAll, 1 do
					local xTarget = ESX.GetPlayerFromId(xAll[i])
					if havePermission(xTarget) then
						TriggerClientEvent('chat:addMessage', xTarget.source, {
              template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(180, 50, 50, 0.8); border-left: 5px solid rgba(200,70,70, 1); border-radius: 0px;"><strong>Admin Chat</strong> <b>{0}</b>: {1}</div>',
							-- template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(24, 26, 32, 0.42); border-radius: 3px; border-right: 0px solid rgb(255, 0, 0);"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(30, 200, 200); border-radius: 5px; font-size: 15px;"> <b>STAFF CHAT</b></font>   <font style="background-color:rgba(0, 0, 0, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"> <b> ID: ' ..source.. ' | '..playerName..  ': </b></font>  <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">'..message..'</font></div>',
								args = {playerName, message}
							})
					end
				end
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, {
              template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(180, 50, 50, 0.8); border-left: 5px solid rgba(200,70,70, 1); border-radius: 0px;"><strong>Chyba</strong>: Zpráva nemůže být prázdná</div>',
						args = {}
					})
			end
		end
	end
end, false)

function havePermission(xPlayer, exclude)
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument
	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(Config.adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end
ESX.RegisterServerCallback('fnx_adminsystem:GetGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(tonumber(source))
	if xPlayer then
		local playergroup = xPlayer.getGroup()

		cb(tostring(playergroup))
	else
		cb("user")
	end
end)



RegisterCommand("report", function(source, args, raw)
	local xPlayer = ESX.GetPlayerFromId(source)
	local reportedname = GetPlayerName(source)
	local reporttext = table.concat(args, " ")
	TriggerClientEvent("sendReport", -1, source, reportedname, reporttext)
end)
