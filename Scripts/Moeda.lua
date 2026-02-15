Moeda = {}

function Moeda:Create()

    self.coin = Property.Create(DatumType.Node, nil)

end

function Moeda:BeginOverlap(thisNode, otherNode)
    if (otherNode:HasTag("Player")) then
        -- Get the parent node
        local parent = self:GetParent()
        -- Remove the coin from the parent's children
        parent:RemoveChild(self)

        -- Update the score (assuming KCT_ThirdPersonController is a global variable)
        KCT_ThirdPersonController:SetScore(KCT_ThirdPersonController:GetScore() + 1)
    end

end
