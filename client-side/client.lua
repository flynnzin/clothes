-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP")
will = {}
Tunnel.bindInterface("clothes",will)
vSERVER = Tunnel.getInterface("clothes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("clothes:setClothes")
AddEventHandler("clothes:setClothes",function(type)
    local ped = PlayerPedId()
    for k,v in pairs(Config.data) do
        if k == type then
            SetPedComponentVariation(ped,4,v.pants[1],v.pants[2],2)
            SetPedComponentVariation(ped,3,v.arms[1],v.arms[2],2)
            SetPedComponentVariation(ped,8,v.t_shirt[1],v.t_shirt[2],2)
            SetPedComponentVariation(ped,9,v.vest[1],v.vest[2],2)
            SetPedComponentVariation(ped,11,v.torso2[1],v.torso2[2],2)
            SetPedComponentVariation(ped,6,v.shoes[1],v.shoes[2],2)
            SetPedComponentVariation(ped,1,v.mask[1],v.mask[2],2)
            SetPedComponentVariation(ped,7,v.accessory[1],v.accessory[2],2)
            SetPedComponentVariation(ped,5,v.bag[1],v.bag[2],2)

            if v.hat[1] ~= -1 and v.hat[2] ~= 0 then
                SetPedPropIndex(ped,0,v.hat[1],v.hat[2],2)
            else
                ClearPedProp(ped,0)
            end

            if v.glass[1] ~= -1 and v.glass[2] ~= 0 then
                SetPedPropIndex(ped,1,v.glass[1],v.glass[2],2)
            else
                ClearPedProp(ped,1)
            end
        end
    end
    vRPserver._updateCustomization(vRP.getCustomization())
end)
