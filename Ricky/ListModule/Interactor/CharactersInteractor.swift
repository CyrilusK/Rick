//
//  CharactersInteractor.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

final class CharactersInteractor: CharactersInteractorInputProtocol {
    weak var output: CharactersOutputProtocol?
    
    func fetchResponce(urlString: String) async {
        do {
            let response = try await ApiManager().fetchResponce(urlString: urlString)
            output?.didFetchResponce(response)
        }
        catch {
            output?.showError(error.localizedDescription)
        }
    }
    
    func fetchImage(from url: String) async -> UIImage? {
        do {
            return try await ImageLoader().loadImage(urlString: url)
        }
        catch {
            return UIImage(systemName: K.shareplay)
        }
    }
}
