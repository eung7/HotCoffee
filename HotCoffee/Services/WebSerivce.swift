//
//  WebSerivce.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMehotd: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> { /// T는 Codable 프로토콜을 따르는 어떠한 타입도 OK
    let url: URL
    var httpMethod: HttpMehotd = .get
    var body: Data?
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class WebSerivce {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
