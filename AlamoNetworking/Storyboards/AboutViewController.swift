//
//  AboutViewController.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 06.05.2021.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var bookImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        guard let url = URL(string: URLList.bookImage.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.bookImage.image = image
            }
        }.resume()
    }
    
    
    
}
