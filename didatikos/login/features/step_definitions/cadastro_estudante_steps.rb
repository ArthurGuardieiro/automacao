Dado('que acesso a página de Cadastro') do
    @alunos_page.open
end
  
Quando('submeto o seguinte formulário de cadastro:') do |table|
    
    estudante = table.hashes.first
    @alunos_page.create(estudante)

end

