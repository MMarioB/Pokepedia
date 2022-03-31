import SwiftUI

struct PokemonView: View {
    @State var nextPokemonIndex: Int = 0
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        VStack {
            Spacer()
            
            if nextPokemonIndex < pokemons.count {
                PokemonDetailView(pokemon: pokemons[nextPokemonIndex])
                
                Divider()
                
                HStack {
                    PokemonButton(title: "👈") {
                        print("Izq")
                        if nextPokemonIndex > 0 {
                            nextPokemonIndex = nextPokemonIndex - 1
                        }
                    }
                    
                    PokemonButton(title: "👉") {
                        print("Der")
                        if nextPokemonIndex < pokemons.count - 1 {
                            nextPokemonIndex = nextPokemonIndex + 1
                        }
                        
                    }
                }
                
                Spacer()
            }
        }
//        .background(pokemons[nextPokemonIndex].color)
        .onAppear {
            getPokemons { pokemons in
                self.pokemons = pokemons
            }
        }
    }
}


struct PokemonTitle: View {
    let title: String
    
    var body: some View {
        Text(title).bold().underline().font(.title).padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
