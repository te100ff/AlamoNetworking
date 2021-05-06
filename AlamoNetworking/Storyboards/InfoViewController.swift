//
//  InfoViewController.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 06.05.2021.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterInfo: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        characterInfo.text = character.description
    }
    
    
    private func fetchImage() {
        guard let url = URL(string: character.imageUrl ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: image)
            }
        }
    }
    
}
