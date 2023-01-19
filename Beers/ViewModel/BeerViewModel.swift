//
//  DetailsViewModel.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 17/01/23.
//

struct BeerViewModel {
    let model: Beer
    
    var isDefaultImage: Bool {
        if model.imageUrl == "https://images.punkapi.com/v2/keg.png" {
            return true
        }
        return false
    }
    
    var beerImageUrl: String {
        model.imageUrl
    }
    
    var beerName: String {
        model.name
    }
    
    var beerTagline: String {
        model.tagline
    }
    
    var beerAbv: String {
        String(format: "%.1f", model.abv)
    }
    
    var beerIbu: String {
        guard let ibu = model.ibu else { return "" }
        return String(format: "%.1f", ibu)
    }
    
    var beerDescription: String {
        model.description
    }
}
