import SwiftUI

// Stub
func getPokemons(completion: @escaping ([Pokemon]) -> Void) {
    
    var pokemons: [Pokemon] = []
    
    for i in 1...100 {
        getPokemon("https://pokeapi.co/api/v2/pokemon/\( i )", completion: { pokemon in
            if let pokemon = pokemon {
                
                print("📺 Finished pokemon \(i)")
                
                pokemons.append(pokemon)
                
                if pokemons.count == 100 {
                    completion(pokemons)
                }
            }
        })
    }
}

func getPokemon(_ pokemonURL: String, completion: @escaping (Pokemon?) -> Void) {
    guard let URL = URL(string: pokemonURL) else { return }
    
    let request = URLRequest(url: URL)
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response , error in
        if error == nil,
           let statusCode = (response as? HTTPURLResponse)?.statusCode,
           let data = data {
            // 2 parse JSON
            parsePokemonJSON(data) { pokemon in
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }
        }
    }
    
    task.resume()
}

func parsePokemonJSON(_ data: Data, completion: (Pokemon?) -> Void) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    
    completion(pokemon)
}
