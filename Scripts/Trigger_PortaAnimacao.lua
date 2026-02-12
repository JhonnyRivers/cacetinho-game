Trigger_PortaAnimacao = {}

function Trigger_PortaAnimacao:Create()

    self.portaEsquerda = Property.Create(DatumType.Node, nil)
    self.portaDireita = Property.Create(DatumType.Node, nil)
end

function Trigger_PortaAnimacao:Interact()

    local P_EsquerdaPosition = self.portaEsquerda:IsVisible() and -1.5 or 1.5
    local P_DireitaPosition = self.portaDireita:IsVisible() and 1.5 or -1.5
    local Pos_PortaEsquerda = self.portaEsquerda:GetPosition()
    local Pos_PortaDireita = self.portaDireita:GetPosition()
    Pos_PortaEsquerda.x = P_EsquerdaPosition
    Pos_PortaDireita.x = P_DireitaPosition
    self.portaEsquerda:SetPosition(Pos_PortaEsquerda)
    self.portaDireita:SetPosition(Pos_PortaDireita)
end