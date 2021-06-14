
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("Helirental:checkmoney")
AddEventHandler("Helirental:checkmoney", function(money, bike, x, y, z, heading)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= money then
		xPlayer.removeMoney(money)
		TriggerClientEvent('Helirental:spawnVehicle', _source, bike,x, y, z, heading)
	elseif xPlayer.getAccount('bank').money >= money then
		xPlayer.removeAccountMoney('bank',money)
		TriggerClientEvent('Helirental:spawnVehicle', _source, bike,x, y, z, heading)
	else
		TriggerClientEvent('Helirental:nomoney', _source)
	end
	
end)

RegisterServerEvent("Helirental:addmoney")
AddEventHandler("Helirental:addmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addMoney(money)
end)