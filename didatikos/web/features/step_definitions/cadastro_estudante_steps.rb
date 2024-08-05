Dado("que acesso a página de Cadastro de estudante") do
  @alunos_page.open
end

Quando("submeto o seguinte formulário de cadastro de estudante:") do |table|
  estudante = table.hashes.first
  @alunos_page.create(estudante)
end
