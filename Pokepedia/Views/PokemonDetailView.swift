import SwiftUI

struct PokemonDetailView: View {
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
            if (String(pokemon.weight).count > 2 ){
                Text("Peso: " + String(pokemon.weight))
            } else if (String(pokemon.weight).count > 3 ){
                Text("Peso: " + String(pokemon.weight))
            } else {
                Text("Peso: " + String(pokemon.weight))
            }
            Text("Tipo: \( pokemon.types.first?.type.name.capitalized ?? "---" )")
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//  static let pokemon = Pokemon(id: 1, name: "Pikachu")
//static var previews: some View {
//  PokemonDetailView(pokemon: pokemon)
//}
//}
