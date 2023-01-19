//
//  Beer.swift
//  Beers
//
//  Created by Matheus Rodrigues Araujo on 09/01/23.
//
import Foundation

struct Beer: Decodable, Identifiable {
    let id: Int
    let name: String
    let tagline: String
    let imageUrl: String
    let abv: Double
    let ibu: Double?
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case imageUrl = "image_url"
        case abv
        case ibu
        case description
    }
}
