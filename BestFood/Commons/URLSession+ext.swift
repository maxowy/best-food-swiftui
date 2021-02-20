//
//  URLSession+ext.swift
//  BestFood
//
//  Created by Łukasz Andrzejewski on 17/02/2021.
//

import Foundation
import Combine

enum RequestError: Error {
    
    case invalidUrl
    case requestFailed(Int, String)
    case encodingFailed
    case decodingFailed
    
}

enum HttpMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    
}

struct EmptyResponse: Decodable {
}

extension URLSession {
    
    func request<Payload: Encodable, Response: Decodable>(for urlString: String, method: HttpMethod = .post, payload: Payload, encoder: JSONEncoder = JSONEncoder(), decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, RequestError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: RequestError.invalidUrl).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        do {
            request.httpBody =  try encoder.encode(payload)
        } catch {
            return Fail(error: RequestError.encodingFailed)
                .eraseToAnyPublisher()
        }
        return send(request)
            .decode(type: Response.self, decoder: decoder)
            .mapError { _ in RequestError.decodingFailed }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func request<Payload: Encodable>(for urlString: String, method: HttpMethod = .post, payload: Payload, encoder: JSONEncoder = JSONEncoder()) -> AnyPublisher<Void, RequestError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: RequestError.invalidUrl).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        do {
            request.httpBody =  try encoder.encode(payload)
        } catch {
            return Fail(error: RequestError.encodingFailed).eraseToAnyPublisher()
        }
        return send(request)
            .map { _ in }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func request<Response: Decodable>(for urlString: String, method: HttpMethod = .get, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, RequestError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: RequestError.invalidUrl).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return send(request)
            .decode(type: Response.self, decoder: decoder)
            .mapError { _ in RequestError.decodingFailed }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func send(_ request: URLRequest) -> AnyPublisher<Data, RequestError> {
        return dataTaskPublisher(for: request)
            .mapError { RequestError.requestFailed($0.errorCode, $0.localizedDescription) }
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
}
