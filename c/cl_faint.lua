local onMaissa = false

RegisterCommand("faint", function()
    onMaissa = true
end)

Citizen.CreateThread(function()
    while true do
        local Sleep = 700
        
        if onMaissa then
            Sleep = 3
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName("Paina ~INPUT_PICKUP~ herätäksesi")
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 51) then
                onMaissa = false
            end
        end

        Citizen.Wait(Sleep)
    end
end)
