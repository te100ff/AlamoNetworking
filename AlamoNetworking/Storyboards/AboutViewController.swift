//
//  AboutViewController.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 06.05.2021.
//

import UIKit
import Alamofire

class AboutViewController: UIViewController {
    @IBOutlet weak var bookImage: UIImageView!
    
    var spinner: UIActivityIndicatorView!
    
    var topCollor: UIColor!
    var bottomColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        spinner = showSpinner(in: view)
        view.addVerticalGradientLayer(topColor: topCollor, bottomColor: bottomColor)
    }
    
    private func fetchImage() {
        AF.request(URLList.bookImage.rawValue)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let data):
                    self.spinner.stopAnimating()
                    guard let image = UIImage(data: data) else { return }
                    self.bookImage.image = image
                case .failure(let error):
                    print(error.localizedDescription)
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
