//
//  BeersManeger.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//

import SwiftUI

class BeersManager: ObservableObject {
    
    @Published var beers = [Beer]()
    
    private let endpoint = "https://api.punkapi.com/v2/beers"
    private let session: URLSession = URLSession(configuration: .default)
    
    func fetchBeers() {
        guard let url = URL(string: endpoint) else { return }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if error == nil {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let retrievedBeers = try decoder.decode([Beer].self, from: safeData)
                        DispatchQueue.main.async {
                            self.beers = retrievedBeers
                            print(retrievedBeers[0].imageUrl)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
