//
//  ApiManager.swift
//  Ricky
//
//  Created by Cyril Kardash on 20.02.2025.
//

import UIKit
import Alamofire

final class ApiManager {
    func fetchResponce(urlString: String) async throws -> APIResponse {
        guard let url = URL(string: urlString) else {
            print("[DEBUG] Invalid URL")
            throw URLError(.badURL)
        }
        
        let data = try await AF.request(url)
            .validate()
            .serializingDecodable(APIResponse.self)
            .value
        
        return data
    }
}
