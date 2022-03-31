import SwiftUI
import MapKit

extension Pokemon {
    var location: CLLocationCoordinate2D {
        let lat = Double.random(in: 40.416775...40.836775)
        let lon = Double.random(in: (-3.783790)...(-3.703790))
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

extension Pokemon {
    func asyncImage() -> some View {
        AsyncImage(url: self.url) { pokeImage in
            pokeImage
                .resizable()
                .scaledToFit()
        } placeholder: {
            VStack(spacing: 10) {
                ProgressView()
                Text("Pokeloading...")
            }
        }
    }
}

struct PokemonMapView: View {
    @State var pokemons: [Pokemon]!
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:     40.416775,
                                                                                  longitude: -3.703790),
                                                   latitudinalMeters: 500,
                                                   longitudinalMeters: 500)
    
    @State var selectedPokemon: Pokemon? = nil
    @State var blur = 0.0
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: pokemons) { item in
                MapAnnotation(coordinate: item.location) {
                    item
                    .asyncImage()
                    .frame(width: 40.0, height: 40.0)
                        .onTapGesture {
                            print("Touched \(item.name)")
                            selectedPokemon = item
                            blur = 5
                        }
                }
            }
            .blur(radius: blur)
            .animation(.linear, value: blur)
            
            if let pokemon = selectedPokemon {
                VStack {
                    pokemon
                        .asyncImage()
                        .frame(width: 90, height: 90)
                    
                    Text(pokemon.name)
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(15)
                .onTapGesture {
                    selectedPokemon = nil
                    blur = 0
                }
                
            }
        }
    }
}

struct PokemonMapView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonMapView()
    }
}
