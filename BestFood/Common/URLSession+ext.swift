//
//  URLSession+ext.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation
import Combine

enum HttpClientError: Error {
    
    case invalidUrl
    case requestFailed
    
}

extension URLSession {
    
    func request<Response: Decodable>(forUrl urlString: String, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, HttpClientError> {
        url(urlString).flatMap {
            URLSession.shared.dataTaskPublisher(for: $0)
                .map { $0.data }
                .decode(type: Response.self, decoder: decoder)
                .mapError { _ in HttpClientError.requestFailed }
                .receive(on: DispatchQueue.main)
        }
        .eraseToAnyPublisher()
    }
    
    func request<Body: Codable, Response: Decodable>(forUrl urlString: String, body: Body,encoder: Encoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, HttpClientError> {
        url(urlString)
            
//            .map {
//                let request = URLRequest(url: $0)
//                request.httpMethod = "POST"
//            }
        
    }
    
    private func url(_ urlString: String) -> AnyPublisher<URL, HttpClientError> {
        Just(urlString)
            .tryMap { urlString -> URL in
                if let url = URL(string: urlString) {
                    return url
                }
                throw HttpClientError.invalidUrl
            }
            .mapError { _ in HttpClientError.requestFailed }
            .eraseToAnyPublisher()
    }
    
}
