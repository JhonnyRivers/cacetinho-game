J_PlayerLauncher = {}

function J_PlayerLauncher:Create()

    self.launchSpeed = Property.Create(DatumType.Float, 18.0)

end

function J_PlayerLauncher:BeginOverlap(thisNode, otherNode)

    if (otherNode:HasTag("Player")) then
        local controller = otherNode:FindChildWithTag("Controller")
        if (controller) then
            controller.extVelocity.y = math.max(controller.extVelocity.y, self.launchSpeed);
            controller:SetGrounded(false)
            controller.ignoreGroundingTimer = 0.2
        end
    end

end
