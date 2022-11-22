//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Rendi Wijiatmoko on 22/11/22.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokemonCollectionViewCell"
    
    // MARK: - UI Components
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    let pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 15
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        // MARK: - StackView
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(pokemonImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(codeLabel)
        stackView.alignment = .center
        stackView.setCustomSpacing(10, after: pokemonImage)
        stackView.setCustomSpacing(5, after: titleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        ])
        
    }
    
    // MARK: - Data Configuration
    func configuration(pokemon: PokemonList) {
        pokemonImage.image = UIImage(systemName: pokemon.image)
        titleLabel.text = pokemon.name
        codeLabel.text = String(pokemon.id)
    }
}
