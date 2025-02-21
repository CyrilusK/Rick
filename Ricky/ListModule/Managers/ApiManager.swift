//
//  ApiManager.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit
import Alamofire

final class ApiManager {
    func fetchCharacters(urlString: String, completion: @escaping (Result<[Character], Error>) -> Void)  {
        guard URL(string: urlString) != nil else {
            print("[DEBUG] Invalid URL")
            completion(.failure(URLError(.badURL)))
            return
        }
        AF.request(urlString)
            .validate()
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
