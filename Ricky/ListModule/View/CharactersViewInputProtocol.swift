//
//  CharactersViewInputProtocol.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

protocol CharactersViewInputProtocol: AnyObject {
    func setupIndicator()
    func setupUI()
    func displayError(_ message: String)
    func setCharacters(_ characters: [Character])
    func appendCharacters(_ characters: [Character])
    func updateCharacterImage(_ image: UIImage?, for indexPath: IndexPath)
}
