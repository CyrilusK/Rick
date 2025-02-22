//
//  ImageLoader.swift
//  Ricky
//
//  Created by Cyril Kardash on 21.02.2025.
//

import UIKit
import Alamofire

final class ImageLoader {
    func loadImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            print("[DEBUG] Invalid URL")
            throw URLError(.badURL)
        }
        
        let data = try await AF.request(url, method: .get).serializingData().value
        
        guard let image = UIImage(data: data) else {
            print("[DEBUG] Failed to download image")
            throw URLError(.cannotDecodeRawData)
        }
        return image
    }
}
