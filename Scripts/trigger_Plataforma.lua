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
    self.origin = self.plataforma:GetWorldPosition()

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

    if not self.moving then
        return
    end

    -- advance offset
    self.offset = self.offset + (self.sign * self.velocidade * dt)

    -- clamp & flip direction at ends
    if self.offset > self.halfDistance then
        self.offset = self.halfDistance
        self.sign = -1
    elseif self.offset < -self.halfDistance then
        self.offset = -self.halfDistance
        self.sign = 1
    end

    -- compute new world position (keep original Y)
    local newPos = Vec(
        self.origin.x + (self.dir.x * self.offset),
        self.origin.y,
        self.origin.z + (self.dir.z * self.offset)
    )

    self.node:SetWorldPosition(newPos)

end