//
//  NetworkService.swift
//  NetworkingJSON
//
//  Created by Oleg on 09.06.2022.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let queue = DispatchQueue.global()
            queue.async {
                if let error = error {
                    print("Some Error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(tracks))
                } catch let jsonError {
                    print("Failed Decode", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
