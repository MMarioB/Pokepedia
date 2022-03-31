import SwiftUI

struct TitleApp: View {
    let title: String
    
    var body: some View {
        Label(title, systemImage: "book.fill").font(.largeTitle)
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        TitleApp(title: "Pokepedia")
    }
}
