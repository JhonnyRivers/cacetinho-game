trigger_Plataforma = {}

function trigger_Plataforma:Create()
    self.plataforma = nil
    self.direcaoXZ = Vec(1, 0, 0)
    self.distancia = 6.0
    self.velocidade = 2.0
    self.inicio = false
    self.progresso = 0
    self.emMovimento = false
end

function trigger_Plataforma:GatherPropeties()
    
    return 
    {
        { name = "plataforma", type = DatumType.Node},
        { name = "direcaoXZ", type = DatumType.Vector},
        { name = "distancia", type = DatumType.Float},
        { name = "velocidade", type = DatumType.Float},
        { name = "inicio", type = DatumType.Bool},
        { name = "progresso", type = DatumType.Float},
        { name = "emMovimento", type = DatumType.Bool},

    }

end

function trigger_Plataforma:Start()

end

function trigger_Plataforma:Tick(deltatime)

end