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
    
    func get<Response: Decodable>(from urlString: String, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, HttpClientError> {
        url(urlString).flatMap { [self] in
            dataTaskPublisher(for: $0)
                .map { $0.data }
                .decode(type: Response.self, decoder: decoder)
                .mapError { _ in HttpClientError.requestFailed }
                .receive(on: DispatchQueue.main)
        }
        .eraseToAnyPublisher()
    }
    
    func post<Body: Codable, Response: Decodable>(to urlString: String, body: Body,encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, HttpClientError> {
        url(urlString)
        
        //            .map {
        //                let request = URLRequest(url: $0)
        //                request.httpMethod = "POST"
        //            }
        
    }
    
    private func url(_ urlString: String) -> AnyPublisher<URL, HttpClientError> {
        Just(urlString).tryMap {
            guard let url = URL(string: $0) else { throw HttpClientError.invalidUrl }
            return url
        }
        .mapError { _ in HttpClientError.requestFailed }
        .eraseToAnyPublisher()
    }
    
}
