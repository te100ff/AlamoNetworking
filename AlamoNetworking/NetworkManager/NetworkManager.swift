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



