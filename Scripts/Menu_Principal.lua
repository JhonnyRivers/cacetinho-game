Menu_Principal = {}

function Menu_Principal:Create()
    self.Menu_PrincipalAberto = false

end

function Menu_Principal:GatherProperties()

    return
    {
        { name = "Botao_iniciarjogo", type = DatumType.Node },
        { name = "BotaoConfigs", type = DatumType.Node },
        { name = "BotaoSair", type = DatumType.Node },

    }

end

function Menu_Principal:Start()


    self.Botao_iniciarjogo.OnActivated = function ()

        print("Carregando jogo")


        Engine.GetWorld():LoadScene("SC_lab01")


    end



    self.BotaoConfigs.OnActivated = function ()
        print("abrir configs")
        
    end


    self.BotaoSair.OnActivated = function ()
        print("Sair do Jogo")
        Engine.Quit()
    end


end 