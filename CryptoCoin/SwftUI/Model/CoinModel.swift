//
//  CoinModel.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 24/05/2021.
//

import Foundation

struct CryptoDataContainer: Decodable {
    let status: String
    let data: CryptoData
}

struct CryptoData: Decodable{
    let coins:[Coin]
}

struct Coin: Decodable {
    let name: String
    let price: String
}
