import SwiftUI

// Shows one Pokemon
struct PokemonSimpleView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            PokemonTitle(title: pokemon.name.capitalized).frame(maxWidth: .infinity, alignment: .center)
            AsyncImage(url: pokemon.url){ phase in
                if let image = phase.image {
                    image.resizable().scaledToFit() // Displays the loaded image.
                } else if phase.error != nil {
                    VStack(){
                        ProgressView()
                        Text("Error al cargar imagen").background(Color.gray)
                    }
                } else {
                    ProgressView()// Acts as a placeholder.
                }}.background(pokemon.color).border(Color.black, width: 2).padding(.horizontal)
            if (String(pokemon.weight).count == 1) {
                var pesoFinal = newPeso(peso: String(pokemon.weight))
                Text("Peso: " + pesoFinal + " kg")
            }
            else if (String(pokemon.weight).count == 2 ){
                var pesoFinal = newPeso(peso: String(pokemon.weight))
                Text("Peso: " + pesoFinal + " kg")
            } else if (String(pokemon.weight).count == 3 ){
                var pesoFinal = newPeso(peso: String(pokemon.weight))
                Text("Peso: " + pesoFinal + " kg")
            } else if (String(pokemon.weight).count == 4 ){
                var pesoFinal = newPeso(peso: String(pokemon.weight))
                Text("Peso: " + pesoFinal + " kg")
            }
            else {
                Text("Peso: " + String(pokemon.weight) + " kg")
            }
            Text("Tipo: \( pokemon.types.first?.type.name.capitalized ?? "---" )")
        }
    }
}

func newPeso(peso : String) -> String {
    var pesoFormat = peso
    
    if peso.count == 1 {
        pesoFormat.insert(contentsOf: "0.", at: pesoFormat.startIndex)
    }
    else if peso.count == 2 {
        let index = pesoFormat.index(pesoFormat.startIndex, offsetBy: 1)
        pesoFormat.insert(".", at: index)
    } else if peso.count == 3 {
        let index = pesoFormat.index(pesoFormat.startIndex, offsetBy: 2)
        pesoFormat.insert(".", at: index)
    } else if peso.count == 4 {
        let index = pesoFormat.index(pesoFormat.startIndex, offsetBy: 3)
        pesoFormat.insert(".", at: index)
    }
    return pesoFormat
}
//struct PokemonSimpleView_Previews: PreviewProvider {
//    static let pokemon = Pokemon(id: 1,
//                                 name: "Otaku", weight: 10)
////                                 ,
////                          url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png"),
////                          color: Color.red)
//
//    static var previews: some View {
//        PokemonSimpleView(pokemon: pokemon)
//    }
//}
