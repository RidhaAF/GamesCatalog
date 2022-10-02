//
//  GameDetailView.swift
//  GamesCatalog
//
//  Created by Ridha Ahmad Firdaus on 02/10/22.
//

import SwiftUI

struct GameDetailView: View {
    @State var game: Result
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 256)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text(game.name ?? "")
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(game.rating ?? 0.0))
                        .font(.callout)
                }
                Text(game.released ?? "")
                    .font(.headline)
                    .foregroundColor(.secondary)
                //                Text(game.description)
                //                    .font(.body)
            }
            .padding([.leading, .bottom, .trailing])
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct GameDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameDetailView()
//    }
//}
