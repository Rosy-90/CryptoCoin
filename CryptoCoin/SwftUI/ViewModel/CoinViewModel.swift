//
//  CoinViewModel.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 24/05/2021.
//

import Foundation
import Combine

protocol CoinViewModelProtocol {
    func fetchCoins()
}

class CoinViewModel: CoinViewModelProtocol, ObservableObject {
    
    private var modelManager: ModelManagerProtocol
    @Published private(set) var coinResult: CryptoDataContainer?
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(modelManager: ModelManagerProtocol) {
        self.modelManager = modelManager
    }
    
    func fetchCoins() {
        modelManager.modelPublisher()
            .sink(receiveCompletion: { completion in
                //
            }, receiveValue: { [weak self] model in
                DispatchQueue.main.async { [weak self] in
                    self?.coinResult = model
                    
                }
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach {
            $0.cancel()
        }
    }
}

