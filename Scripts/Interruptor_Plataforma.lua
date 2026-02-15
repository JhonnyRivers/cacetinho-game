Interruptor_Plataforma = {}

function Interruptor_Plataforma:Create()
    self.plataforma = Property.Create(DatumType.Node, array = true)

end

function Interruptor_Plataforma:Interact()
    local ativo - false
   if self.plataforma.emMovimento then
    ativo = self.plataforma:ehAtivo()
   else
    ativo = self.plataforma.emMovimento == true
   end

   if ativo then

    if self.plataforma.emMovimento then
        self.plataforma:Inativo()
    else
        self.plataforma.emMovimento = false
    end
    
    else

        if self.plataforma.emMovimento then
            self.plataforma:Ativo()
        else
            self.plataforma.emMovimento = true
        end
end

function Interruptor_Plataforma:GetInteractionHint()
    return "Toggle Platform"
end