//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 24/05/2021.
//

import Foundation

struct CryptoDataContainer: Codable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Codable {
    let coins:[Coin]
}

struct Coin: Codable, Identifiable {
    let id: Int
    let name: String
    let price: String
}
