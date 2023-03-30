//
//  ApiManager.swift
//  NewsAppNew2
//
//  Created by Indira on 30/3/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()

    let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-28&sortBy=publishedAt&apiKey=7718e2ff81c44a339870e53d7e3f266e"
    
    func getData(completion: @escaping (Result<NewsData, Error>) -> Void) {
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {return}
            
            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(newsData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
