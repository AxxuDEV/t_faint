local onMaissa = false

RegisterCommand("faint", function()
    onMaissa = true
end)

Citizen.CreateThread(function()
    local KevennysWait = 1000
    while true do
        if onMaissa then
            KevennysWait = 20
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName("Paina ~INPUT_PICKUP~ herätäksesi")
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustReleased(0, 51) then
                onMaissa = false
            end
        else
            KevennysWait = 1000
        end
        Citizen.Wait(KevennysWait)
    end
end)