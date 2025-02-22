//
//  CharactersInteractorInputProtocol.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

protocol CharactersInteractorInputProtocol: AnyObject {
    func fetchResponce(urlString: String) async
    func fetchImage(from url: String) async -> UIImage?
}
