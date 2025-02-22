//
//  CharactersViewController.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit

final class CharactersViewController: UIViewController, CharactersViewInputProtocol {
    var output: CharactersOutputProtocol?
    
    private let tableView = UITableView()
    private let indicatorLoading = UIActivityIndicatorView(style: .medium)
    private var chars: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func setupIndicator() {
        view.backgroundColor = .white
        indicatorLoading.translatesAutoresizingMaskIntoConstraints = false
        indicatorLoading.startAnimating()
        view.addSubview(indicatorLoading)
        indicatorLoading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorLoading.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupUI() {
        indicatorLoading.stopAnimating()
        indicatorLoading.removeFromSuperview()
        title = K.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(CharacterCell.self, forCellReuseIdentifier: K.cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func displayError(_ message: String) {
        let alert = UIAlertController(title: K.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.ok, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setCharacters(_ characters: [Character]) {
        self.chars = characters
        tableView.reloadData()
    }
    
    func appendCharacters(_ characters: [Character]) {
        let startIndex = chars.count
        chars.append(contentsOf: characters)
        let indexPaths = (startIndex..<chars.count).map { IndexPath(row: $0, section: 0) }
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > tableView.contentSize.height - 100 - scrollView.frame.size.height {
            output?.pagination()
        }
    }
    
    func updateCharacterImage(_ image: UIImage?, for indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CharacterCell, let image = image else {
            return
        }
        cell.setImage(image)
    }
}

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellReuseIdentifier, for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        let character = chars[indexPath.row]
        cell.configure(with: character)
        output?.loadImage(from: character.image ?? "", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        K.sizeHeightImageView + 2 * K.padding
    }
}
