Moeda = {}

function Moeda:Create()

    self.coin = Property.Create(DatumType.Node, nil)

end

function Moeda:BeginOverlap(thisNode, otherNode)

    if (otherNode:HasTag("Player")) then
        print("coletada moeda")

        local C_CON = self:GetParent()
        --self.KCT_ThirdPersonController:SetScore(KCT_ThirdPersonController:GetScore() + 1)
        self.coin:SetVisible(not self.coin:IsVisible())
        self:DestroyDeferred()

  
    end
    

end
