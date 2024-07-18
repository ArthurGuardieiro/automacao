Dado("Login com {string} e {string}") do |email, password|
  @login_page.open
  @login_page.with(email, password)
end

Dado("que acesso a listagem de estudantes") do
  @alunos_page.open_listing
  sleep 5
end

Dado("que eu tenha o seguinte filtro:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("excluo a escola do filtro") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("o filtro deve estar em branco") do
  pending # Write code here that turns the phrase above into concrete actions
end
