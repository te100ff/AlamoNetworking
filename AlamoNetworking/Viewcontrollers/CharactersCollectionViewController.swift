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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spiner = showSpinner(in: view)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.setup(with: characters[indexPath.row])
        
        return cell
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
