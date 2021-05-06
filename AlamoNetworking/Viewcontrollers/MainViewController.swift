//
//  ViewController.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 04.05.2021.
//

import UIKit

enum URLList: String {
    case bookImage = "https://images.askmen.com/1080x540/2016/08/01-094345-hbo_launches_game_of_thrones_election_voting.jpg"
    case allCharachters = "https://thronesapi.com/api/v2/Characters"
}

class MainViewController: UIViewController {
    
    private let topCollor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    private let bottomColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: topCollor, bottomColor: bottomColor)
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characters" {
            guard let charachterVC = segue.destination as? CharactersCollectionViewController else { return }
            charachterVC.topCollor = topCollor
            charachterVC.bottomColor = bottomColor
            NetworkManager.shared.alamofireFetchData(url: URLList.allCharachters.rawValue) { value in
                charachterVC.characters = Character.getCharacters(from: value)
                DispatchQueue.main.async {
                    charachterVC.spiner.stopAnimating()
                    charachterVC.collectionView.reloadData()
                }
            }
        } else if segue.identifier == "about" {
            guard let aboutVC = segue.destination as? AboutViewController else { return }
            aboutVC.topCollor = topCollor
            aboutVC.bottomColor = bottomColor
        }
    }

}

extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
        gradient.type = .axial
        
    }
}

