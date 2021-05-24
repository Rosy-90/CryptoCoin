//
//  CoinView.swift
//  CryptoCoin
//
//  Created by Rosy Patel on 21/05/2021.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        NavigationView {
            List {
                Group{
                    VStack{
                        HStack{
                        Text("Bitcoin")
                        Spacer()
                        Text("$40343.76")
                        }
                    }
                    VStack{
                        HStack{
                        Text("Ethereum")
                        Spacer()
                        Text("$2802.46")
                        }
                    }
                    VStack{
                        HStack{
                        Text("Tether USD")
                        Spacer()
                        Text("$1.00")
                        }
                    }
                    VStack{
                        HStack{
                        Text("Cardeno")
                        Spacer()
                        Text("$1.82")
                        }
                    }
                }
            }
            .navigationTitle("Coins")
            //.edgesIgnoringSafeArea(.all)
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
