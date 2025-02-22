//
//  Constants.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit

struct K {
    static let title = "Characters"
    static let error = "Ошибка"
    static let ok = "Ок"
    static let shareplay = "shareplay"
    
    static let cellReuseIdentifier = "CharacterCell"
    
    static let apiKey = "https://rickandmortyapi.com/api/character"
    
    static let sizeHeightImageView: CGFloat = 120
    static let sizeWidthImageView: CGFloat = 120
    static let radiusImageView: CGFloat = 40
    
    static let sizeFontNameLabel: CGFloat = 21
    static let colorFontNameLabel = UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 1)
    
    static let sizeFontDetailLabel: CGFloat = 14
    static let colorFontDetailLabel = UIColor(red: 0/225, green: 0/225, blue: 0/225, alpha: 1)
    
    static let textButtonWatch = "▶ Watch episodes"
    static let radiusWatchButton: CGFloat = 17
    static let sizeHeightWatchButton: CGFloat = 35
    static let sizeWidthWatchButton: CGFloat = 148
    static let sizeFontWatchButton: CGFloat = 14
    static let colorFontWatchButton = UIColor(red: 255/225, green: 107/225, blue: 0/225, alpha: 1)
    static let colorBackgroundWatchButton = UIColor(red: 255/225, green: 107/225, blue: 0/225, alpha: 0.1)
    
    static let locationNameImage = "location"
    static let sizeWidthImageLocation: CGFloat = 12
    static let sizeFontLocationLabel: CGFloat = 14
    static let colorFontLocationLabel = UIColor(red: 82/225, green: 82/225, blue: 82/225, alpha: 1)
    
    static let padding: CGFloat = 15
    
    static let alive = "Alive"
    static let dead = "Dead"
    static let sizeFontStatusLabel: CGFloat = 14
    static let sizeHeightStatusLabel: CGFloat = 25
    static let radiusStatusLabel: CGFloat = 25
    
    static let aliveColorTextStatusLabel = UIColor(red: 49/225, green: 159/225, blue: 22/225, alpha: 1)
    static let aliveColorBackgroundStatusLabel = UIColor(red: 199/225, green: 255/225, blue: 185/225, alpha: 1)
    static let aliveSizeWidthStatusLabel: CGFloat = 56
    
    static let deadColorTextStatusLabel = UIColor(red: 233/225, green: 56/225, blue: 0/225, alpha: 1)
    static let deadColorBackgroundStatusLabel = UIColor(red: 233/225, green: 56/225, blue: 0/225, alpha: 0.1)
    static let deadSizeWidthStatusLabel: CGFloat = 55
    
    static let unknownColorTextStatusLabel = UIColor(red: 160/225, green: 160/225, blue: 160/225, alpha: 1)
    static let unknowColorBackgroundStatusLabel = UIColor(red: 160/225, green: 160/225, blue: 160/225, alpha: 0.1)
    static let unknownSizeWidthStatusLabel: CGFloat = 92
}
