//
//  CharactersConfigurator.swift
//  Ricky
//
//  Created by Cyril Kardash on 22.02.2025.
//

import UIKit

final class CharactersConfigurator {
    func configure() -> UIViewController {
        let view = CharactersViewController()
        let presenter = CharactersPresenter()
        let interactor = CharactersInteractor()
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        return view
    }
}
