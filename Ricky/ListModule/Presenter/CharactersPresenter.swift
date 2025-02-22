//
//  CharactersPresenter.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

final class CharactersPresenter: CharactersOutputProtocol {
    weak var view: CharactersViewInputProtocol?
    var interactor: CharactersInteractorInputProtocol?
    
    private var response: APIResponse? = nil
    private var isLoading = false
    
    func viewDidLoad() {
        fetchResponce(urlString: K.apiKey)
        view?.setupIndicator()
    }
    
    private func fetchResponce(urlString: String) {
        isLoading = true
        Task {
            await interactor?.fetchResponce(urlString: urlString)
            DispatchQueue.main.async {
                self.view?.setupUI()
            }
        }
    }
    
    func didFetchResponce(_ responce: APIResponse) {
        isLoading = false
        DispatchQueue.main.async {
            guard let characters = responce.results else { return }
            if self.response == nil {
                self.view?.setCharacters(characters)
            }
            else {
                self.view?.appendCharacters(characters)
            }
            self.response = responce
        }
    }
    
    func showError(_ error: String) {
        self.isLoading = false
        DispatchQueue.main.async {
            self.view?.displayError("Failed to load news: \(error)")
        }
    }
    
    func pagination() {
        guard !isLoading, let nextPage = response?.info?.next else { return }
        
        fetchResponce(urlString: nextPage)
    }
    
    func loadImage(from url: String, for indexPath: IndexPath) {
        Task {
            let image = await interactor?.fetchImage(from: url)
            DispatchQueue.main.async {
                self.view?.updateCharacterImage(image, for: indexPath)
            }
        }
    }
}
