local faint = false

RegisterCommand('faint', function(source, args, rawCommand)
    faint = true
end)

CreateThread(function()
    local textUi = false
    while true do
        local w = 700
        if faint then
            w = 3
            SetPedToRagdoll(cache.ped, 1000, 1000, 0, 0, 0, 0)
            if not textUi then 
                lib.showTextUI('[E] - Nouse maasta')
                textUi = true
            end
            if IsControlJustPressed(0, 38) then 
                faint = false
                textUi = false
                lib.hideTextUI()
            end
        end
        Wait(w)
    end
end)

RegisterKeyMapping('faint', 'Maahan', 'keyboard', 'U')
