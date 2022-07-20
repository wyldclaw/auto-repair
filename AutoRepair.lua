local function AutoRepair(self, event)
    if (event == 'MERCHANT_SHOW') then
        if (CanMerchantRepair() == true) then
            local repairAllCost, canRepair = GetRepairAllCost()
            if (canRepair == true) then
                local money = GetMoney()
                if (repairAllCost <= money) then
                    RepairAllItems(false);
                    local message = '|cffffff00Repaired for:|r '
                    local coinTextureString = GetCoinTextureString(repairAllCost)
                    DEFAULT_CHAT_FRAME:AddMessage(message .. coinTextureString)
                end
            end
        end
    end
end

local autoRepairAddon = CreateFrame('Frame')
autoRepairAddon:RegisterEvent('MERCHANT_SHOW')
autoRepairAddon:SetScript('OnEvent', AutoRepair)
