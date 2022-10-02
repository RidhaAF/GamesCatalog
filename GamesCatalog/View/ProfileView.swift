//
//  ProfileView.swift
//  GamesCatalog
//
//  Created by Ridha Ahmad Firdaus on 02/10/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 128, height: 128)
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(.primary, lineWidth: 2))
                    .padding(.vertical, 16.0)
                Text("Ridha Ahmad Firdaus")
                    .font(.title2)
                    .bold()
                Text(verbatim: "ridhaaf@gmail.com")
                    .font(.body)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
