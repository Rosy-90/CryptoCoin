//
//  ModelManager.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 24/05/2021.
//

import Foundation
import Combine

typealias ModelPublisher = AnyPublisher<CryptoDataContainer?, Error>

protocol ModelManagerProtocol {
    func modelPublisher() -> ModelPublisher
}

class ModelManager: ModelManagerProtocol {
    private let webService: NetWorkServiceProtocol
    
    init(webService: NetWorkServiceProtocol) {
        self.webService = webService
    }
    func modelPublisher() -> ModelPublisher {
        let url =  Environment.baseUrl
        guard url != nil else {
            return Fail(error: ConnectionError.invalidSearchItem).eraseToAnyPublisher()
        }
        return webService.dataPublisher(url: url).decode(type: CryptoDataContainer.self, decoder: JSONDecoder()).map { model in
            print(model)
            return model
        }
        .tryCatch { error in
            Fail(error: error)
                .eraseToAnyPublisher()
        }
        .eraseToAnyPublisher()
    }
}
