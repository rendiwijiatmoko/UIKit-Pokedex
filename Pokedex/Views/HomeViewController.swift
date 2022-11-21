//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Rendi Wijiatmoko on 21/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.text = "Search for Pokémon by name or using its National Pokédex number."
        return label
    }()
    let searchTextField: UITextField = {
        let textField = UITextField()
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 24, height: 24))
        iconView.contentMode = .scaleAspectFit
        iconView.image = UIImage(systemName: "magnifyingglass")
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        
        textField.leftViewMode = .always
        textField.leftView = iconContainerView
        textField.backgroundColor = UIColor.systemGray5
        textField.layer.cornerRadius = 5
        textField.textColor = .secondaryLabel
        textField.tintColor = .secondaryLabel
        return textField
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // MARK: - Description Label
        self.view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
        ])
        
        // MARK: - Seacrch Text Field
        self.view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            searchTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            searchTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

}
