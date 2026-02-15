PlayAudio = {}





function ASS_ObjectSpawner:GatherProperties()

    return
    {
        { name = "AudioforPlayback", type = DatumType.Asset },
        
    }

end

function PlayAudio:BeginOverlap(thisNode, otherNode)

    if (otherNode:HasTag("Player")) then
        print("reproduzir audio")


        Audio3D:PlayAudio()
        self:DestroyDeferred()

  
    end
    

end
