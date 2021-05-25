//
//  CoinView.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import SwiftUI

struct CoinView: View {
    //var result: Coin
    //let modelManager = ModelManager(webService: NetworkService())
    
    @StateObject var viewModel: CoinViewModel
    //var viewModel: CoinViewModel
    //@ObservedObject private var coinItemView = CoinItemView(viewModel: viewModel)
    
    var body: some View {
        NavigationView {
            List {
                Group{
                    VStack{
                        HStack{
                            //Text(result.name)
                            Text(viewModel.coinResult?.data.coins[0].name ?? "")
                        Spacer()
                            //Text(result.price)
                            Text(viewModel.coinResult?.data.coins[0].price ?? "")
                        }
                    }
//                    VStack{
//                        HStack{
//                        Text("Ethereum")
//                        Spacer()
//                        Text("$2802.46")
//                        }
//                    }
                }
            }
            .navigationTitle("Coins")
            //.edgesIgnoringSafeArea(.all)
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    
    static var previews: some View {
        //CoinView(result: [Coin(id: "", name: "", price: "")])
        //return CoinView(result: Coin(id: "", name: "", price: ""))
        
        CoinView(viewModel: CoinViewModel(modelManager: ModelManager(webService: NetworkService())))
        
    }
}
