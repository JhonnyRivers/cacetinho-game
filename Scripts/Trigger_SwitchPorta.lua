Trigger_SwitchPorta = {}

function Trigger_SwitchPorta:Create()

    self.porta = Property.Create(DatumType.Node, nil)
    self.meshPivot = Property.Create(DatumType.Node, nil)

end

function Trigger_SwitchPorta:Interact()

    if self.porta then
        self.porta:SetVisible(not self.porta:IsVisible())
    else
        Log.Warning("No Doors assigned to switch")
    end

    local meshAngle = self.porta:IsVisible() and -45.0 or 45.0
    local meshRot = self.meshPivot:GetRotation()
    meshRot.x = meshAngle
    self.meshPivot:SetRotation(meshRot)

end