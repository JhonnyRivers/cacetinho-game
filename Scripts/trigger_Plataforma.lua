trigger_Plataforma = {}

function trigger_Plataforma:Create()
    self.plataforma = nil
    self.direcaoXZ = Vec(1, 0, 0)
    self.distancia = 6.0
    self.velocidade = 2.0
    self.inicio = false
    self.progresso = 0
    self.emMovimento = false
    self.trajetoSentido = 0
    self.pontoOrigem = Vec()
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
        { name = "emMovimento", type = DatumType.Bool}

    }

end

function trigger_Plataforma:Start()
    self.plataforma = self:GetParent()
    self.pontoOrigem = self.plataforma:GetWorldPosition()

    local direcao = self.direcaoXZ
    direcao.y = 0
    local comprimento = math.sqrt((direcao.x * direcao.x) + (direcao.z * direcao.z))
    if comprimento == 0 then
        self.direcaoXZ = Vec(1,0,0)
    else
        self.direcaoXZ = Vec((direcao.x / comprimento), 0, (direcao.z / comprimento)) 
    end

end

function trigger_Plataforma:Tick(deltatime)

    if not self.emMovimento then
        return
    end

    -- advance offset
    self.progresso = self.progresso + (self.trajetoSentido * self.velocidade * deltatime)

    -- clamp & flip direction at ends
    if self.progresso > self.distancia then
        self.progresso = self.distancia
        self.trajetoSentido = -1
    elseif self.progresso < -self.distancia then
        self.progresso = -self.distancia
        self.trajetoSentido = 1
    end

    -- compute new world position (keep original Y)
    local novaPosicao = Vec(
        self.pontoOrigem.x + (self.direcaoXZ.x * self.progresso),
        self.pontoOrigem.y,
        self.pontoOrigem.z + (self.pontoOrigem.z * self.progresso)
    )

    self.plataforma:SetWorldPosition(novaPosicao)

end

function trigger_Plataforma:Ativo()
    self.emMovimento = true
end

function trigger_Plataforma:Inativo()
    self.emMovimento = false
end

function trigger_Plataforma:ehAtivo()
    return self.emMovimento
end

function trigger_Plataforma:Interact()
    self.emMovimento = not self.emMovimento
end