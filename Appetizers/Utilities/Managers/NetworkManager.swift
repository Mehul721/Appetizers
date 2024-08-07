//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mehul Jain on 18/07/24.
//

import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        // let task=URLSession.shared.dataTask(with:URLRequest(url: url)){
             // data,response,error in
             //if let _ = error{
              //   completed(.failure(.unabletoComplete))
             //    return
             //}
             //guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                 //completed(.failure(.invalidResponse))
                 //return
             //}
             //guard let data = data else{
                 //completed(.failure(.invalidData))
                 //return
             //}
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    //task.resume()
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
