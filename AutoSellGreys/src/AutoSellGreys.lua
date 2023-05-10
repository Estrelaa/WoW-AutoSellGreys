local AutoSellGreys = CreateFrame("Frame")

function AutoSellGreys:AutoDoStuff(self, event, ...)
    AutoSellGreys.RepairEquipment(self)
    AutoSellGreys.SellGreys(self)
end

function AutoSellGreys:RepairEquipment()
    if CanMerchantRepair() then
        RepairAllItems()
    end
end

function AutoSellGreys:SellGreys()
    for bag = BACKPACK_CONTAINER, NUM_TOTAL_EQUIPPED_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            if C_Container.GetContainerItemLink(bag, slot) ~= nil then 
                if C_Item.GetItemQualityByID(C_Container.GetContainerItemLink(bag, slot)) == 0 then
                    C_Container.UseContainerItem(bag, slot)
                end
            end
        end
    end
end

AutoSellGreys:RegisterEvent("MERCHANT_SHOW")
AutoSellGreys:SetScript("OnEvent", AutoSellGreys.AutoDoStuff)
