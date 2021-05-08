//
//  NetworkManager.swift
//  AlamoNetworking
//
//  Created by Stanislav Testov on 06.05.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
   
    func alamofireFetchData(url: String, completionHandler: @escaping(Any) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error.localizedDescription )
                }
            }
    }
    private init() {}
    
}

class ImageManger {
    static var shared = ImageManger()
    
    private init () {}
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            guard url == response.url else { return }
            
            DispatchQueue.main.async {
                completion(data,response)
            }
        }.resume()
    }
    
}


