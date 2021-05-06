//
//  CharactersCollectionViewController.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 05.05.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CharactersCollectionViewController: UICollectionViewController {
    
    var characters: [Character] = []
    var spiner: UIActivityIndicatorView!
    
    var characterIndex: Int!
    var topCollor: UIColor!
    var bottomColor: UIColor!
    var x: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = UIView(frame: collectionView.bounds)
        x.addVerticalGradientLayer(topColor: topCollor, bottomColor: bottomColor)
        collectionView.addSubview(x)
        collectionView.backgroundView = x
        spiner = showSpinner(in: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let infoVC = segue.destination as? InfoViewController else { return }
            infoVC.character = characters[characterIndex]
            infoVC.topCollor = topCollor
            infoVC.bottomColor = bottomColor
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.setup(with: characters[indexPath.row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        characterIndex = indexPath.item
        performSegue(withIdentifier: "info", sender: nil)
    }
    
}

private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.color = .gray
    activityIndicator.startAnimating()
    activityIndicator.center = view.center
    activityIndicator.hidesWhenStopped = true
    
    view.addSubview(activityIndicator)
    
    return activityIndicator
}
