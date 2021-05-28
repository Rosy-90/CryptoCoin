//
//  CoinView.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import SwiftUI

struct CoinView: View {
    
    @StateObject var viewModel: CoinViewModel
    
    init(viewModel: CoinViewModel = .init(modelManager:
                                            ModelManager(webService: NetworkService()))) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if let results = viewModel.coinResult?.data.coins {
            NavigationView{
                List(results) { result in
                    Text(result.name)
                    Spacer()
                    Text(result.price)
                }
                .navigationTitle("Coins")
            }
        }
        else {
            Text("Loading...")
                .onAppear() {
                    self.viewModel.fetchCoins()
                }
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(viewModel: CoinViewModel(modelManager: ModelManager(webService: NetworkService())))
    }
}
