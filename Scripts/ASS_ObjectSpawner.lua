ASS_ObjectSpawner = {}

function ASS_ObjectSpawner:Create()


    self.objetosAtivos = 0

end

function ASS_ObjectSpawner:GatherProperties()

    return
    {
        { name = "spawnPoint", type = DatumType.Node },
        { name = "quantidadePermitida", type = DatumType.Integer, },
        
    }

end

function ASS_ObjectSpawner:Interact()

    if self.objetosAtivos >= self.quantidadePermitida then
        return
    end

    -- Create new mesh node and give it physics
    local newMeshNode = Node.Construct("StaticMesh3D")
    newMeshNode:SetStaticMesh("SM_Cube")
    newMeshNode:EnableCollision(true)
    newMeshNode:EnablePhysics(true)
    newMeshNode:SetScale(Vec(3, 3, 3))

    -- Position it
    local spawnPos = self.spawnPoint:GetWorldPosition()


    newMeshNode:SetWorldPosition(spawnPos)
    newMeshNode:SetRotation(Math.RandRangeVec(Vec(0, 0, 0), Vec(360, 360, 360)))

    -- Add it to the world
    self.world:GetRootNode():AddChild(newMeshNode)
    self.objetosAtivos = self.objetosAtivos + 1

    -- Give it some random velocity
    local velocity = Math.RandRangeVec(Vec(-5, -5, -5), Vec(5, 5, 5))
    newMeshNode:SetLinearVelocity(velocity)

end

function ASS_ObjectSpawner:GetInteractionHint()
    return "Spawn physics Object"
end