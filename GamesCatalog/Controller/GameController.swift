//
//  GameController.swift
//  GamesCatalog
//
//  Created by Ridha Ahmad Firdaus on 02/10/22.
//

import Foundation

class GameController:ObservableObject {
    @Published var games: [Result] = []
    
    func getGames(completion: @escaping ([Result]) -> ()) {
        guard let url = URL(string: "https://api.rawg.io/api/games?page_size=10&key=027c2de5228c41959ef83b445025d8b6") else {
            print("URL not valid!")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(String(describing: error))
                return
            }
            
            if let data = data {
                do {
                    let games = try JSONDecoder().decode(GameModel.self, from: data)
                    let game = games.results
                    print(game ?? [])
                    
                    DispatchQueue.main.async {
                        self.games = game ?? []
                    }
                } catch let error {
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
}
