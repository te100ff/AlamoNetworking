//
//  CharacterCollectionViewCell.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 05.05.2021.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: CharacterImageView!
    @IBOutlet weak var characterLabel: UILabel!
    
    func setup(with character: Character) {
        characterLabel.text = character.fullName ?? "Unknown"
        characterImage.fetchImage(from: character.imageUrl ?? "")
    }
    
}
