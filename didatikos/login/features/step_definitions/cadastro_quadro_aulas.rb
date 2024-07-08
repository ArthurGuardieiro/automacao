Dado('que acesso a página de nova transmissão') do

    @quadro_aulas_page.open

end

Quando('submeto o seguinte cadastro da transmissão:') do |table|

    transmissao = table.hashes.first
    @quadro_aulas_page.create(transmissao)
    

end