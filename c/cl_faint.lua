local onMaissa = false

RegisterCommand("faint", function()
    onMaissa = true
end)

Citizen.CreateThread(function()
    while true do
        local canSleep = true
        
        if onMaissa then
            canSleep = false
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName("Paina ~INPUT_PICKUP~ herätäksesi")
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 51) then
                onMaissa = false
            end
        end

        if canSleep then
            Citizen.Wait(700)
        end

        Citizen.Wait(3)
    end
end)