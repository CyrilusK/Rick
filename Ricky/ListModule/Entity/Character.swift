//
//  Character.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit

struct APIResponse: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String?]
    let url: String?
    let created: String?
}

struct Location: Decodable {
    let name: String?
    let url: String?
}

enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
    
    var color: UIColor {
        switch self {
        case .alive: return UIColor.systemGreen
        case .dead: return UIColor.systemRed
        case .unknown: return UIColor.lightGray
        }
    }
}
