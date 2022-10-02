//
//  GamesCatalogView.swift
//  GamesCatalog
//
//  Created by Ridha Ahmad Firdaus on 02/10/22.
//

import SwiftUI

struct GamesCatalogView: View {
    @StateObject var fetch = GameController()
    
    var body: some View {
        NavigationView {
            List(fetch.games) { game in
                NavigationLink(destination: GameDetailView(game: game)) {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: game.backgroundImage ?? "")) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 64, height: 64)
                        .cornerRadius(8.0)
                        VStack(alignment: .leading) {
                            Text(game.name ?? "")
                                .font(.headline)
                                .bold()
                            Text(game.released ?? "")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(String(game.rating ?? 0.0))
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Games Catalog")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Search button was tapped")
                    } label: {
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(.red)
                    }
                }
            }
            .onAppear {
                fetch.getGames { (games) in
                    self.fetch.games = games
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct GamesCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        GamesCatalogView()
    }
}
