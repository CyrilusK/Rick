//
//  CharactersViewController.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    private let tableView = UITableView()
    private var chars: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = K.title
        navigationController?.navigationBar.prefersLargeTitles = true
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func setup() {
        setupTableView()
        ApiManager().fetchCharacters(urlString: "https://rickandmortyapi.com/api/character/?page=1") { result in
            switch result {
            case .success(let characters):
                print("✅ Получено \(characters.count) персонажей")
                print(characters)
                DispatchQueue.main.async {
                    self.chars = characters
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("❌ Ошибка загрузки: \(error.localizedDescription)")
            }
        }
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.register(CharacterCell.self, forCellReuseIdentifier: K.cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //output?.presentNewsDetail(chars[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
