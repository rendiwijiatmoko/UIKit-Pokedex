//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Rendi Wijiatmoko on 21/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Variables
    let data: [PokemonList] = [
        PokemonList(name: "bulbasaur", image: "person", id: 1),
        PokemonList(name: "ivysaur", image: "person", id: 2),
        PokemonList(name: "venusaur", image: "person", id: 3),
        PokemonList(name: "charmander", image: "person", id: 4),
        PokemonList(name: "charmeleon", image: "person", id: 5),
        PokemonList(name: "bulbasaur", image: "person", id: 1),
        PokemonList(name: "ivysaur", image: "person", id: 2),
        PokemonList(name: "venusaur", image: "person", id: 3),
        PokemonList(name: "charmander", image: "person", id: 4),
        PokemonList(name: "charmeleon", image: "person", id: 5),
    ]
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
    
    let listCollectionPokemon: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
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
        
        // MARK: - Collection List Pokemon
        self.view.addSubview(listCollectionPokemon)
        listCollectionPokemon.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        listCollectionPokemon.dataSource = self
        listCollectionPokemon.delegate = self
        listCollectionPokemon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listCollectionPokemon.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 30),
            listCollectionPokemon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            listCollectionPokemon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -24),
            listCollectionPokemon.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell {
            cell.configuration(pokemon: data[indexPath.row])
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 10) / 2
        return CGSize(width: size, height: size)
    }
}
