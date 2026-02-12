Trigger_MudarFase = {}

function Trigger_MudarFase:Create()

    self.box = Property.Create(DatumType.Node, nil)
    self.LoadNextScene = Property.Create(DatumType.String, nil)

end

function Trigger_MudarFase:BeginOverlap(thisNode, othernode)

    if(othernode:HasTag("Player")) then
        Log.Debug("Mudando de Fase")
        Engine.GetWorld():LoadScene(self.LoadNextScene)
    end
    
end