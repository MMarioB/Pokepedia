import SwiftUI

struct PokemonList: View {
    @State var pokemons: [Pokemon] = []
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)){
                        PokemonSimpleView(pokemon: pokemon)
                    }
            }.navigationTitle("ListaPokemons")
        }.onAppear {
            getPokemons{ pokemons in
                self.pokemons = pokemons
            }
        }
    }
}

struct PokemonSwipeList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
