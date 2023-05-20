local faint = false

RegisterCommand('faint', function(source, args, rawCommand)
    faint = true
end)


CreateThread(function()
    while true do
        local w = 700
        if faint then 
            w = 3
            SetPedToRagdoll(cache.ped, 1000, 1000, 0, 0, 0, 0)
            BeginTextCommandDisplayHelp('STRING')
            AddTextComponentSubstringPlayerName("Paina ~INPUT_PICKUP~ herätäksesi")
            EndTextCommandDisplayHelp(0, false, true, -1)
            if IsControlJustPressed(0, 51) then 
                faint = false
            end
        end
        Wait(w)
    end
end)
RegisterKeyMapping('faint', 'kaadu', 'keyboard', 'U')
