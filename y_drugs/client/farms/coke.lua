------- Yamsoo Scripts -------
--- discord.gg/WqDvPcCw3S ---
-----------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local cooldawn = false
local mainMenu = RageUI.CreateMenu('Coke', '')

function OpenMenuRecoltecoke()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Coke ~r~↓')


			RageUI.Button("Commencer la Récolte de ~r~Coke", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecoltecoke()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Récolte de ~r~Coke", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					StopRecoltecoke()
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopRecoltecoke()
    if recoltyescoke then
    	recoltyescoke = false
    end
end

function StartRecoltecoke()
    if not recoltyescoke then
        recoltyescoke = true
    while recoltyescoke do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltecoke')
    end
    else
        recoltyescoke = false
    end
end


local position = {
	{x = 166.87, y = 2229.15, z = 90.77} 
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 166.87, 2229.15, 90.77, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 
			

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour récolter la ~r~Coke", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecoltecoke()
            end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Coke', '')

function OpenMenuTraitementcoke()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Coke ~r~↓')

			RageUI.Button("Commencer le Traitement de ~r~Coke", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitementcoke()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper le Traitement de ~r~Coke", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitementcoke()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopTraitementcoke()
    if traityescoke then
    	traityescoke = false
    end
end

function StartTraitementcoke()
    if not traityescoke then
        traityescoke = true
    while traityescoke do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementcoke')
    end
    else
        traityescoke = false
    end
end


local position = {
	{x = 2526.20, y = 2586.35, z = 38.76}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 2526.20, 2586.35, 38.76, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour traiter la ~r~Coke", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitementcoke()
            end

    end  
    end
    Citizen.Wait(wait)
    end
end
end)




local mainMenu = RageUI.CreateMenu('Coke', '')

function OpenMenuVentetcoke()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				FreezeEntityPosition(PlayerPedId(), true)

				RageUI.Separator('')
				RageUI.Separator('~r~↓ ~s~Circuit de Coke ~r~↓')

			RageUI.Button("Commencer la Vente de ~r~Coke", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartVentecoke()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Vente de ~r~Coke", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopVentecoke()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopVentecoke()
    if ventepossiblecoke then
    	ventepossiblecoke = false
    end
end

function StartVentecoke()
    if not ventepossiblecoke then
        ventepossiblecoke = true
    while ventepossiblecoke do
            Citizen.Wait(2000)
            TriggerServerEvent('ventecoke')
    end
    else
        ventepossiblecoke = false
    end
end


local position = {
	{x = 996.7, y = 3575.45, z = 34.61}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 996.7, 3575.45, 34.61, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour vendre la ~r~Coke", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuVentetcoke()
            end

    end
    end
    Citizen.Wait(wait)
    end
end
end)
