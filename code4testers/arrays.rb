bandas = ["AC/DC", "Queen", "Skank"]

#puts bandas[0]
#puts bandas[1]
#puts bandas[2]

bandas.push("Bon jovi")

#puts bandas[3]

bandas.delete("Queen")

#puts bandas

melhor = bandas.find { |item| item.include?('Skank')}
puts melhor