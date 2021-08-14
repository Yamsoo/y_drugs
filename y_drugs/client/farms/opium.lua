------- Yamsoo Scripts -------
--- discord.gg/WqDvPcCw3S ---
-----------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)


local mainMenu = RageUI.CreateMenu('Opium', '')
local cooldawn = false

function OpenMenuRecolteOpium()
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
				RageUI.Separator('~r~↓ ~s~Circuit d\'Opium ~r~↓')

			RageUI.Button("Commencer la Récolte de ~r~Opium", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecolteOpium()
					RageUI.CloseAll()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Récolte de ~r~Opium", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					StopRecolteOpium()
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


function StopRecolteOpium()
    if recoltyesOpium then
    	recoltyesOpium = false
    end
end

function StartRecolteOpium()
    if not recoltyesOpium then
        recoltyesOpium = true
    while recoltyesOpium do
        Citizen.Wait(2000)
        TriggerServerEvent('recolteOpium')
    end
    else
        recoltyesOpium = false
    end
end


local position = {
	{x = 1335.85, y = -522.24, z = 72.25} 
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1335.85, -522.24, 72.25, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 


        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour récolter l\'~r~Opium", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecolteOpium()
            end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Opium', '')

function OpenMenuTraitementOpium()
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
				RageUI.Separator('~r~↓ ~s~Circuit d\'Opium ~r~↓')

			RageUI.Button("Commencer le Traitement de ~r~Opium", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitementOpium()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper le Traitement de ~r~Opium", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitementOpium()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopTraitementOpium()
    if traityesOpium then
    	traityesOpium = false
    end
end

function StartTraitementOpium()
    if not traityesOpium then
        traityesOpium = true
    while traityesOpium do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementOpium')
    end
    else
        traityesOpium = false
    end
end


local position = {
	{x = 1022.28, y = -1716.66, z = 35.61}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1022.28, -1716.66, 35.61, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour traiter l\'~r~Opium", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitementOpium()
            end

    end  
    end
    Citizen.Wait(wait)
    end
end
end)




local mainMenu = RageUI.CreateMenu('Opium', '')

function OpenMenuVentetOpium()
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
				RageUI.Separator('~r~↓ ~s~Circuit d\'Opium ~r~↓')
				

				RageUI.Button("Commencer la Vente de ~r~Opium", nil, {RightLabel = "→"}, not cooldawn, {
					onSelected = function()
						cooldawn = true
						FreezeEntityPosition(PlayerPedId(), true)
						StartVenteOpium()
						Citizen.SetTimeout(1000, function()
							cooldawn = false
						end)
					end
				})
				

			RageUI.Button("Stopper la Vente de ~r~Opium", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopVenteOpium()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopVenteOpium()
    if ventepossibleOpium then
    	ventepossibleOpium = false
    end
end

function StartVenteOpium()
    if not ventepossibleOpium then
        ventepossibleOpium = true
    while ventepossibleOpium do
            Citizen.Wait(2000)
            TriggerServerEvent('venteOpium')
    end
    else
        ventepossibleOpium = false
    end
end


local position = {
	{x = -864.39, y = -1101.11, z = 6.45}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, -864.39, -1101.11, 6.45, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour vendre l\'~r~Opium", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuVentetOpium()
            end

    end
    end
    Citizen.Wait(wait)
    end
end
end)
