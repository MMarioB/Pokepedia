import SwiftUI

struct PokemonButton: View {
    let title: String
    let action: () -> Void
    let height = 60.0
    let width = 120.0
    
    var body: some View {
        Button(action: action) {
            Text(title).frame(width: width, height: height , alignment: .center)
        }
    }
}

struct PokemonButton_Previews: PreviewProvider {
    static var previews: some View {
        PokemonButton(title: "Click ") {
            
        }.previewLayout(.sizeThatFits)
    }
}
