//
//  CharacterCell.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit
import Alamofire

final class CharacterCell: UITableViewCell {
    
    private let charImageView = UIImageView()
    private let nameLabel = UILabel()
    private let detailLabel = UILabel()
    private let watchButton = UIButton(type: .system)
    private let locationLabel = UILabel()
    private let statusLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupImageView()
        nameLabelSetup()
        detailLabelSetup()
        locationLabelSetup()
        statusLabelSetup()
        watchButtonSetup()
        setupStacksView()
    }
    
    private func setupImageView() {
        charImageView.contentMode = .scaleAspectFill
        charImageView.clipsToBounds = true
        charImageView.layer.cornerRadius = K.radiusImageView
        charImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(charImageView)
        charImageView.widthAnchor.constraint(equalToConstant: K.sizeWidthImageView).isActive = true
        charImageView.heightAnchor.constraint(equalToConstant: K.sizeHeightImageView).isActive = true
    }
    
    private func nameLabelSetup() {
        nameLabel.font = UIFont.systemFont(ofSize: K.sizeFontNameLabel, weight: .medium)
        nameLabel.textColor = K.colorFontNameLabel
    }
    
    private func detailLabelSetup() {
        detailLabel.font = UIFont.systemFont(ofSize: K.sizeFontDetailLabel)
        detailLabel.textColor = K.colorFontDetailLabel
    }
        
    private func locationLabelSetup() {
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .darkGray
    }
        
    private func statusLabelSetup() {
        statusLabel.font = UIFont.boldSystemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .center
        statusLabel.layer.cornerRadius = 13
        statusLabel.layer.masksToBounds = true
        statusLabel.backgroundColor = .clear
        statusLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
        
    private func watchButtonSetup() {
        watchButton.setTitle(K.textButtonWatch, for: .normal)
        watchButton.titleLabel?.font = UIFont.systemFont(ofSize: K.sizeFontWatchButton)
        watchButton.setTitleColor(K.colorFontWatchButton, for: .normal)
        watchButton.backgroundColor = K.colorBackgroundWatchButton
        watchButton.layer.cornerRadius = K.radiusWatchButton
        watchButton.addTarget(self, action: #selector(didTapWatch), for: .touchUpInside)
        watchButton.widthAnchor.constraint(equalToConstant: K.sizeWidthWatchButton).isActive = true
        watchButton.heightAnchor.constraint(equalToConstant: K.sizeHeightWatchButton).isActive = true
    }
    
    private func setupStacksView() {
        let nameAndStatusStackView = UIStackView(arrangedSubviews: [nameLabel, statusLabel])
        nameAndStatusStackView.axis = .horizontal
        nameAndStatusStackView.distribution = .fillProportionally
        nameAndStatusStackView.spacing = 10
        
        let watchButtonStackView = UIStackView(arrangedSubviews: [watchButton, UIView()])
        nameAndStatusStackView.axis = .horizontal
        nameAndStatusStackView.distribution = .fillProportionally
        nameAndStatusStackView.spacing = 10
        
        let locationImage = UIImageView(image: UIImage(named: "location"))
        locationImage.contentMode = .scaleAspectFit
        locationImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        let locationWithImageStackView = UIStackView(arrangedSubviews: [locationImage, locationLabel])
        locationWithImageStackView.axis = .horizontal
        locationWithImageStackView.distribution = .fillProportionally
        locationWithImageStackView.spacing = 5
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameAndStatusStackView, detailLabel, watchButtonStackView, locationWithImageStackView])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 10
        
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            charImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            charImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelsStackView.leadingAnchor.constraint(equalTo: charImageView.trailingAnchor, constant: 10),
            labelsStackView.topAnchor.constraint(equalTo: charImageView.topAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: charImageView.bottomAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func getStatusAndSizeColor(_ status: String) -> UIColor {
        switch status {
        case "Alive":
            statusLabel.constraints.last?.isActive = false
            statusLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
            return .systemGreen
        case "Dead":
            statusLabel.constraints.last?.isActive = false
            statusLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
            return .systemRed
        default:
            statusLabel.constraints.last?.isActive = false
            statusLabel.widthAnchor.constraint(equalToConstant: 92).isActive = true
            return .lightGray
        }
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name ?? ""
        detailLabel.text = "\(character.species ?? ""), \(character.gender?.lowercased() ?? "")"
        locationLabel.text = character.location?.name
        statusLabel.text = character.status?.uppercased()
        statusLabel.backgroundColor = getStatusAndSizeColor(character.status ?? "")
        
        AF.request(character.image ?? "", method: .get).response { response in
            switch response.result {
            case .success(let responseData):
                DispatchQueue.main.async {
                    self.charImageView.image = UIImage(data: responseData!, scale: 1)
                }
            case .failure(let error):
                print("error--->",error)
            }
        }
    }
    
    @objc func didTapWatch() {
        print("Tapped Watch Button")
    }
}
