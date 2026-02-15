--fica dentro da cena do controlador a cena e esse escript na raiz da menu pause

Menu_Pause = {}

function Menu_Pause:Create()
 
    self.Menu_PauseAberto = nil
    self.PauseMenuKey = Key.Escape
end

function Menu_Pause:GatherProperties()

    return
    {
        { name = "raiz_controlador", type = DatumType.Node },
        { name = "PauseMenuKey", type = DatumType.Integer },
        { name = "BotaoConfigs_P", type = DatumType.Node },
        { name = "BotaoSair_P", type = DatumType.Node },

    }
    
end

function Menu_Pause:Start()

    self.Menu_PauseAberto = false

    self.BotaoSair_P.OnActivated = function ()
        print("Sair do Jogo")
        --putaria do editor que acaba escondendo o cursor
        Engine.SetPaused(false)
        Input.ShowCursor(true)
        Input.LockCursor(false)
        Input.TrapCursor(false)

        Engine.Quit()
    end


end



function Menu_Pause:Tick(deltaTime)
    
    self:UpdateInput(deltaTime)

    if self.Menu_PauseAberto == true then
        self:SetVisible(true)
        Input.ShowCursor(true)
        Input.LockCursor(false)
        Input.TrapCursor(false)
    elseif self.Menu_PauseAberto == false then
        self:SetVisible(false)
        Input.ShowCursor(false)
        Input.LockCursor(true)
        Input.TrapCursor(true)

    end

end

function Menu_Pause:UpdateInput(deltaTime)

    if Input.IsKeyPressed(self.PauseMenuKey) or Input.IsKeyPressed(Key.P) or Input.IsGamepadPressed(Gamepad.Start) then
        
        self.Menu_PauseAberto = not self.Menu_PauseAberto
        Engine.SetPaused(self.Menu_PauseAberto)

        print("Pause Jogo")
        
    end
end

function Menu_Pause:Stop()

    Engine.SetPaused(false)
    self.Menu_PauseAberto = false

    print("Menu Pause encerrado")
end