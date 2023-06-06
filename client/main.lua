local lastDamage = 0.0

Citizen.CreateThread(function()
    local sleep = 1000
	while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed) then
            sleep = 100
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local shakeRate = GetEntitySpeed(vehicle) / 250.0 -- 250.0 Normal / 100.0 Mare / 50.0 Max 
            local curHealth = GetVehicleBodyHealth(vehicle)
            if curHealth ~= lastDamage then
                ShakeGameplayCam("MEDIUM_EXPLOSION_SHAKE", shakeRate)
            end
            lastDamage = curHealth
        else
            sleep = 1000
        end
        Citizen.Wait(sleep)
	end
end)