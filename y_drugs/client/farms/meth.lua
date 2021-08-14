------- Yamsoo Scripts -------
--- discord.gg/WqDvPcCw3S ---
-----------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)


local mainMenu = RageUI.CreateMenu('Meth', '')
local cooldawn = false

function OpenMenuRecoltemeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')

			RageUI.Button("Commencer la Récolte de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartRecoltemeth()
					RageUI.CloseAll()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper la Récolte de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					StopRecoltemeth()
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


function StopRecoltemeth()
    if recoltyesmeth then
    	recoltyesmeth = false
    end
end

function StartRecoltemeth()
    if not recoltyesmeth then
        recoltyesmeth = true
    while recoltyesmeth do
        Citizen.Wait(2000)
        TriggerServerEvent('recoltemeth')
    end
    else
        recoltyesmeth = false
    end
end


local position = {
	{x = 1881.42, y = 4997.23, z = 51.35} 
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1881.42, 4997.23, 51.35, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 


        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour récolter la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuRecoltemeth()
            end
    end
    end
    Citizen.Wait(wait)
    end
end
end)


local mainMenu = RageUI.CreateMenu('Meth', '')

function OpenMenuTraitementmeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')

			RageUI.Button("Commencer le Traitement de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
				onSelected = function()
					cooldawn = true
					FreezeEntityPosition(PlayerPedId(), true)
					StartTraitementmeth()
					Citizen.SetTimeout(1000, function()
						cooldawn = false
					end)
				end
			})

			RageUI.Button("Stopper le Traitement de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopTraitementmeth()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end



function StopTraitementmeth()
    if traityesmeth then
    	traityesmeth = false
    end
end

function StartTraitementmeth()
    if not traityesmeth then
        traityesmeth = true
    while traityesmeth do
            Citizen.Wait(2000)
            TriggerServerEvent('traitementmeth')
    end
    else
        traityesmeth = false
    end
end


local position = {
	{x =-685.9, y = 5763.09, z = 17.51}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22,-685.9, 5763.09, 17.51, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true) 

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour traiter la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuTraitementmeth()
            end

    end  
    end
    Citizen.Wait(wait)
    end
end
end)




local mainMenu = RageUI.CreateMenu('Meth', '')

function OpenMenuVentetmeth()
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
				RageUI.Separator('~r~↓ ~s~Circuit de Meth ~r~↓')
				

				RageUI.Button("Commencer la Vente de ~r~Meth", nil, {RightLabel = "→"}, not cooldawn, {
					onSelected = function()
						cooldawn = true
						FreezeEntityPosition(PlayerPedId(), true)
						StartVentemeth()
						Citizen.SetTimeout(1000, function()
							cooldawn = false
						end)
					end
				})
				

			RageUI.Button("Stopper la Vente de ~r~Meth", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), false)
					StopVentemeth()
					RageUI.CloseAll()
				end
			})

			end)
		Wait(0)
		end
	end)
  	end
end


function StopVentemeth()
    if ventepossiblemeth then
    	ventepossiblemeth = false
    end
end

function StartVentemeth()
    if not ventepossiblemeth then
        ventepossiblemeth = true
    while ventepossiblemeth do
            Citizen.Wait(2000)
            TriggerServerEvent('ventemeth')
    end
    else
        ventepossiblemeth = false
    end
end


local position = {
	{x = 1531.82, y = 1728.11, z = 109.92}  
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 2.0 then
            wait = 0
            DrawMarker(22, 1531.82, 1728.11, 109.92, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 136, 14, 1, 255, true, true, p19, true)  

        
            if dist <= 10.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~r~[E]~s~ pour vendre la ~r~Meth", 1) 
                if IsControlJustPressed(1,51) then
					OpenMenuVentetmeth()
            end

    end
    end
    Citizen.Wait(wait)
    end
end
end)
