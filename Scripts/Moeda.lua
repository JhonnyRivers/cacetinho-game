Moeda = {}

function Moeda:Create()

    self.coin = Property.Create(DatumType.Node, nil)

end

function Moeda:Interact()

    if (self.coin) then
        
        self.coin:SetVisible(not self.coin:IsVisible())
    else
        Log.Warning("No coin assigned to switch")
    end


end

function Moeda:GetInteractionHint()
    return "area de colisao modeda"
end