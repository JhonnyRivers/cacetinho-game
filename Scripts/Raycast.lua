--sistema genérico de raycast

Raycast = {}

function Raycast:Create()
    --self.Arma_Atual = nil
    self.ArmasInv = {}
    self.debugSpheres = {}
    
    -- carrega mesh debug UMA VEZ
    self.debugMesh = LoadAsset("SM_Cube")
end

function Raycast:GatherProperties()
    return
    {
        { name = "camera_controlador", type = DatumType.Node },
        --{ name = "Arma_Atual", type = DatumType.Node },
    }
end

--esfera no final do raycast para detecção da are de colisao do tiro
function Raycast:SpawnHitSphere(pos)
    local world = Engine.GetWorld()

    -- Spawn da bola
    local sphere = world:SpawnNode("Sphere3D", pos)

    sphere:SetRadius(0.2)

    table.insert(self.debugSpheres, { node = sphere, time = 2.0 })
end

function Raycast:Tick(deltaTime)

    self:UpdateInput(deltaTime)

    -- Atualiza esferas temporárias
    for i = #self.debugSpheres, 1, -1 do
        local data = self.debugSpheres[i]
        data.time = data.time - deltaTime

        if data.time <= 0 and data.node:IsValid() then
            data.node:DestroyDeferred()
            table.remove(self.debugSpheres, i)
        end

    end
end

--so serve para mostrar o tiro, bem bosta não mostra aonde o tico para de fato
function Raycast:DrawDebugRay(startPos, endPos)

    local world = Engine.GetWorld()

    local dir = (endPos - startPos)
    local dist = dir:Length()
    if dist <= 0.001 then return end

    dir:Normalize()

    local step = 6.0
    local steps = math.floor(dist / step)

    for i = 0, steps do
        local p = startPos + dir * (i * step)

        local cube = world:SpawnNode("StaticMesh3D", p)
        cube:SetStaticMesh(self.debugMesh)

        cube:SetWorldScale(Vec(0.01, 0.01, 100.00))
        cube:LookAt(p + dir)

        table.insert(self.debugSpheres, { node = cube, time = 6.05 })
    end
end





function Raycast:UpdateInput(deltaTime)

    if Engine.IsPaused() then return end


    if Input.IsMousePressed(Mouse.Left) then
        print("jogador disparou!")

        if not self.camera_controlador then
            print("Camera não definida!")
            return
        end

        local world = Engine.GetWorld()

        -- ORIGEM DO TIRO = POSIÇÃO DA CÂMERA
        local startPos = self.camera_controlador:GetWorldPosition()

        -- DIREÇÃO = FORWARD REAL DO NODE3D (camera instanciada definida no editor)
        local forward = self.camera_controlador:GetForwardVector()

        -- DISTÂNCIA DO TIRO
        local range = 1500

        -- FIM DO RAIO
        local endPos = startPos + (forward * range)

        -- RAYCAST FÍSICO
        local res = world:RayTest(startPos, endPos, 0xff)

        local finalPos = endPos

        if res and res.hitNode then
            finalPos = res.hitPosition
            self:SpawnHitSphere(res.hitPosition)

            local hitPos = res.hitPosition
            print(string.format("Disparo acertou em: %s, cordenadas: [%.2f, %.2f, %.2f]",
                res.hitNode:GetName(), hitPos.x, hitPos.y, hitPos.z))


        else
            print("noe aciertou nadica de nada")
        end





        -- previw bosta do raio, melhor que nada
        --self:DrawDebugRay(startPos, finalPos)



    end

end

function Raycast:Start()


    
end


