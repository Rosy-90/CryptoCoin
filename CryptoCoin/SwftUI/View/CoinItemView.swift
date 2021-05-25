//
//  CoinItemView.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 24/05/2021.
//

import SwiftUI

struct CoinItemView: View {
    
    @ObservedObject var viewModel: CoinViewModel
    
    var body: some View {
        if let results = viewModel.coinResult?.data.coins {
            List(results) { result in
                //CoinView(result: result)
                CoinView(viewModel: viewModel)
                
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
