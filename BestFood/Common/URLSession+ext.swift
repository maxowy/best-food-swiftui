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
    case encodingFailed
    
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
    
    func post<Body: Encodable>(to urlString: String, body: Body, encoder: JSONEncoder = JSONEncoder()) -> AnyPublisher<Void, HttpClientError> {
        return url(urlString).zip(encode(body: body, encoder: encoder))
            .map(createRequest(for:data:))
            .flatMap { [self] (request: URLRequest) in
                dataTaskPublisher(for: request)
                    .mapError { _ in HttpClientError.requestFailed }
                    .receive(on: DispatchQueue.main)
            }
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    private func createRequest(for url: URL, data: Data) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        return request
    }
    
    private func encode<Body: Encodable>(body: Body, encoder: JSONEncoder) -> AnyPublisher<Data, HttpClientError> {
        Just(body).encode(encoder: encoder)
            .mapError { _ in HttpClientError.encodingFailed }
            .eraseToAnyPublisher()
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
