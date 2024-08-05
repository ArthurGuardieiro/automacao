Dado("que acesso a página de Cadastro de colaborador") do
  @colaboradores_page.open
end

Quando("submeto o seguinte formulário de cadastro de colaborador:") do |table|
  colaborador = table.hashes.first
  @colaboradores_page.create(colaborador)
end
