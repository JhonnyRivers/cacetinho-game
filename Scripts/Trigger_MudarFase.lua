Trigger_MudarFase = {}

function Trigger_MudarFase:Create()

    self.LoadNextScene = Property.Create(DatumType.String, "SC_lab02")

end

function Trigger_MudarFase:BeginOverlap(thisNode, othernode)

    if(othernode:HasTag("Player")) then
        Log.Debug("Mudando de Fase")
        Engine.GetWorld():LoadScene(self.LoadNextScene)
    end
    
end