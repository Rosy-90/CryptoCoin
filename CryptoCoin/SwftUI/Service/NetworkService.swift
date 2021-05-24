//
//  NetworkService.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import Foundation
import Combine

protocol NetWorkServiceProtocol {
    func dataPublisher(url: URL) -> AnyPublisher<Data, Error>
}

class NetworkService: NetWorkServiceProtocol {
    func dataPublisher(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url).tryMap { (data, response) -> Data in
            guard let httpResponsse = response as? HTTPURLResponse, httpResponsse.statusCode == 200 else {
                throw ConnectionError.badServerResponse
            }
            return data
        }
        .eraseToAnyPublisher()
    }
}
