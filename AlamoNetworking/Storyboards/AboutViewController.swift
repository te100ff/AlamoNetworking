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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    private func fetchImage() {
        AF.request(URLList.bookImage.rawValue)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let data):
                    guard let image = UIImage(data: data) else { return }
                    self.bookImage.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
    }
    
    
}
