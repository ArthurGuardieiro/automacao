Dado("que acesso a página de nova rede") do
  @rede_page.open
end

Quando("submeto o seguinte formulário de cadastro de rede:") do |table|
  rede = table.hashes.first
  @rede_page.create(rede)
end
