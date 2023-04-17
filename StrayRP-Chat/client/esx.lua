local PlayerData              = {}
--ESX                           = nil
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)