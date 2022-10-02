//
//  ContentView.swift
//  GamesCatalog
//
//  Created by Ridha Ahmad Firdaus on 02/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                GamesCatalogView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }.accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
