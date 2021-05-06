//
//  CharacterCollectionViewCell.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 05.05.2021.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    
    func setup(with character: Character) {
        characterLabel.text = character.fullName ?? "Unknown"
        
        guard let url = URL(string: character.imageUrl ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: image)
            }
        }
    }
    
}
