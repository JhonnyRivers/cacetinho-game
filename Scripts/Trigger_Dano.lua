Trigger_Dano = {}

function Trigger_Dano:Create()

    self.box = Property.Create(DatumType.Node, nil)
    self.valorDano = 100 -- Caso tenha o sistema de vida
    self.LoadScene = Property.Create(DatumType.String, nil) -- por hora, para "resetar" para a cena atual

end

function Trigger_Dano:BeginOverlap(thisNode, othernode)

    if(othernode:HasTag("Player")) then
        Log.Debug("Voce Morreu")
        Engine.GetWorld():LoadScene(self.LoadScene)
    end
        
end