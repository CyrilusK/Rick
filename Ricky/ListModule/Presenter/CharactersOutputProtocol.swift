//
//  CharactersOutputProtocol.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

protocol CharactersOutputProtocol: AnyObject {
    func viewDidLoad()
    func didFetchResponce(_ responce: APIResponse)
    func showError(_ error: String)
    func pagination()
    func loadImage(from url: String, for indexPath: IndexPath)
}
