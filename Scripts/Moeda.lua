Moeda = {}

function Moeda:Create()

    self.coinMesh = Property.Create(DatumType.Node, nil)

end

function Moeda:BeginOverlap(thisNode, otherNode)

    if (otherNode:HasTag("Player")) then

        local C_CON = self:GetParent()
        KCT_ThirdPersonController:SetScore(KCT_ThirdPersonController:GetScore() + 1)

        self.coinMesh:SetVisible(not self.coin:IsVisible())
    else
        Log.Warning("No coin assigned to switch")
    end


end