import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]
    
    var body: some View {
        TabView {
            PokemonMapView(pokemons: pokemons)
                            .tabItem {
                                Image(systemName: "map.fill")
                                Text("Map")
                            }
            PokemonView()
//                   .badge(getPokemons().count )
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokemons")
                    
                }
            PokemonSwipeList()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Simple List of Pokemons")
                }
            PokemonList()
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("List of Pokemons")
                }
        }
    }
}

struct PokemonTabView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTabView(pokemons: [])
    }
}
