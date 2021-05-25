//
//  CryptoCoinApp.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import SwiftUI

@main
struct CryptoCoinApp: App {
    //@StateObject var modelManager = ModelManager(webService: NetworkService())
    let modelManager = ModelManager(webService: NetworkService())
    @StateObject var viewModel = CoinViewModel(modelManager: ModelManager(webService: NetworkService()) )

    var body: some Scene {
        WindowGroup {
            //let modelManager = ModelManager(webService: NetworkService())
            //let viewModel = CoinViewModel(modelManager: modelManager)
           CoinView(viewModel: viewModel)
            //CoinView(result: Coin(id: "", name: "Rosy", price: "5"))
            //CoinView(result: (viewModel.coinResult?.data.coins[0])!)
           // CoinView(result: CoinView.init(result: viewModel.coinResult?.data.coins[0]))
        }
    }
}
