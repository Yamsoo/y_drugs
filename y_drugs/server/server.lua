TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Compte Membre LSPD

local CopsConnected = 0

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i = 1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

		if xPlayer and xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()



-- Coke



RegisterNetEvent('recoltecoke')
AddEventHandler('recoltecoke', function()
    local item = "coke"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyescoke = false
    elseif CopsConnected < Config.CopsCoke then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsCoke.. " ~s~Membres de la LSPD en ville pour pouvoir Récolter de la ~r~Coke !")
        recoltyescoke = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Coke~s~ en cours...")
		return
    end
end)

RegisterNetEvent('traitementcoke')
AddEventHandler('traitementcoke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local coke = xPlayer.getInventoryItem('coke').count
    local coke_pooch = xPlayer.getInventoryItem('coke_pooch').count

    if coke_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de ~r~Coke')
        traityescoke = false
    elseif CopsConnected < Config.CopsCoke then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsCoke.. " ~s~Membres de la LSPD en ville pour pouvoir Traiter de la ~r~Coke !")
        traityescoke = false
    elseif coke < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Coke~s~ pour traiter...')
        traityescoke = false
    else
        xPlayer.removeInventoryItem('coke', 3)
        xPlayer.addInventoryItem('coke_pooch', 1)
    end
end)

RegisterNetEvent('ventecoke')
AddEventHandler('ventecoke', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local coke_pooch = xPlayer.getInventoryItem('coke_pooch').count
    
    if coke_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Coke~s~ à vendre...')
    elseif CopsConnected < Config.CopsCoke then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsCoke.. " ~s~Membres de la LSPD en ville pour pouvoir Vendre de la ~r~Coke !")
        ventepossible = false    
    else
        xPlayer.removeInventoryItem('coke_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.sellCoke)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Coke~s~ pour ~r~'..Config.sellCoke..'$')
    end
end)



-- Opium



RegisterNetEvent('recolteOpium')
AddEventHandler('recolteOpium', function()
    local item = "opium"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesOpium = false
    elseif CopsConnected < Config.CopsOpium then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsOpium.. " ~s~Membres de la LSPD en ville pour pouvoir Récolter de l\'~r~Opium !")
        recoltyesOpium = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Opium~s~ en cours...")
		return
    end
end)

RegisterNetEvent('traitementOpium')
AddEventHandler('traitementOpium', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local opium = xPlayer.getInventoryItem('opium').count
    local opium_pooch = xPlayer.getInventoryItem('opium_pooch').count

    if opium_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de ~r~Opium')
        traityesOpium = false
    elseif CopsConnected < Config.CopsOpium then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsOpium.. " ~s~Membres de la LSPD en ville pour pouvoir Traiter de l\'~r~Opium !")
        traityesOpium = false
    elseif opium < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Opium~s~ pour traiter...')
        traityesOpium = false
    else
        xPlayer.removeInventoryItem('opium', 3)
        xPlayer.addInventoryItem('opium_pooch', 1)
    end
end)

RegisterNetEvent('venteOpium')
AddEventHandler('venteOpium', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local opium_pooch = xPlayer.getInventoryItem('opium_pooch').count
    
    if opium_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon d\'Opium~s~ à vendre...')
    elseif CopsConnected < Config.CopsOpium then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.CopsOpium.. " ~s~Membres de la LSPD en ville pour pouvoir Vendre de l\'~r~Opium !")
        ventepossible = false    
    else
        xPlayer.removeInventoryItem('opium_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.sellOpium)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Opium~s~ pour ~r~'..Config.sellOpium..'$')
    end
end)



-- meth



RegisterNetEvent('recoltemeth')
AddEventHandler('recoltemeth', function()
    local item = "meth"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesmeth = false
    elseif CopsConnected < Config.Copsmeth then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsmeth.. " ~s~Membres de la LSPD en ville pour pouvoir Récolter de la ~r~Meth !")
        recoltyesmeth = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Meth~s~ en cours...")
		return
    end
end)

RegisterNetEvent('traitementmeth')
AddEventHandler('traitementmeth', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local meth = xPlayer.getInventoryItem('meth').count
    local meth_pooch = xPlayer.getInventoryItem('meth_pooch').count

    if meth_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de ~r~Meth')
        traityesmeth = false
    elseif CopsConnected < Config.Copsmeth then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsmeth.. " ~s~Membres de la LSPD en ville pour pouvoir Traiter de la ~r~Meth !")
        traityesmeth = false
    elseif meth < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Meth~s~ pour traiter...')
        traityesmeth = false
    else
        xPlayer.removeInventoryItem('meth', 3)
        xPlayer.addInventoryItem('meth_pooch', 1)
    end
end)

RegisterNetEvent('ventemeth')
AddEventHandler('ventemeth', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local meth_pooch = xPlayer.getInventoryItem('meth_pooch').count
    
    if meth_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Meth~s~ à vendre...')
    elseif CopsConnected < Config.Copsmeth then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsmeth.. " ~s~Membres de la LSPD en ville pour pouvoir Vendre de la ~r~Meth !")
        ventepossible = false    
    else
        xPlayer.removeInventoryItem('meth_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.sellmeth)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de meth~s~ pour ~r~'..Config.sellmeth..'$')
    end
end)

-- weed



RegisterNetEvent('recolteweed')
AddEventHandler('recolteweed', function()
    local item = "weed"
    local limiteitem = 50
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        recoltyesweed = false
    elseif CopsConnected < Config.Copsweed then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsweed.. " ~s~Membres de la LSPD en ville pour pouvoir Récolter de la ~r~Weed !")
        recoltyesweed = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Récolte de ~r~Weed~s~ en cours...")
		return
    end
end)

RegisterNetEvent('traitementweed')
AddEventHandler('traitementweed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed = xPlayer.getInventoryItem('weed').count
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count

    if weed_pooch > 100 then
        TriggerClientEvent('esx:showNotification', source, 'Il semble que tu ne puisses plus porter de ~r~Weed')
        traityesweed = false
    elseif CopsConnected < Config.Copsweed then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsweed.. " ~s~Membres de la LSPD en ville pour pouvoir Traiter de la ~r~Weed !")
        traityesweed = false
    elseif weed < 3 then
        TriggerClientEvent('esx:showNotification', source, 'Pas assez de ~r~Weed~s~ pour traiter...')
        traityesweed = false
    else
        xPlayer.removeInventoryItem('weed', 3)
        xPlayer.addInventoryItem('weed_pooch', 1)
    end
end)

RegisterNetEvent('venteweed')
AddEventHandler('venteweed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local weed_pooch = xPlayer.getInventoryItem('weed_pooch').count
    
    if weed_pooch < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~r~Pochon de Weed~s~ à vendre...')
    elseif CopsConnected < Config.Copsweed then
        TriggerClientEvent('esx:showNotification', source, "Il faut minimum ~r~"..Config.Copsweed.. " ~s~Membres de la LSPD en ville pour pouvoir Vendre de la ~r~Weed !")
        ventepossible = false    
    else
        xPlayer.removeInventoryItem('weed_pooch', 1)
        xPlayer.addAccountMoney('black_money', Config.sellweed)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~r~Pochon de Weed~s~ pour ~r~'..Config.sellweed..'$')
    end
end)

