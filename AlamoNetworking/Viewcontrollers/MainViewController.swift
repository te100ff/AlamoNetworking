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

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characters" {
            guard let charachterVC = segue.destination as? CharactersCollectionViewController else { return }
            NetworkManager.shared.alamofireFetchData(url: URLList.allCharachters.rawValue) { value in
                charachterVC.characters = Character.getCharacters(from: value)
                DispatchQueue.main.async {
                    charachterVC.spiner.stopAnimating()
                    charachterVC.collectionView.reloadData()
                }
            }
        } else if segue.identifier == "about" {
            guard let aboutVC = segue.destination as? AboutViewController else { return }
            NetworkManager.shared.alamofireFetchData(url: URLList.bookImage.rawValue) { value in
                guard let image = value as? UIImage else { return }
                aboutVC.bookImage.image = image
            }
        }
    }

}


