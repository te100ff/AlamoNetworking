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
    
    private var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner = showSpinner(in: view)
        fetchImage()
        characterInfo.text = character.description
    }
    
    
    private func fetchImage() {
        guard let url = URL(string: character.imageUrl ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.characterImage.image = UIImage(data: image)
            }
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    
}
