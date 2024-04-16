//
//  InfoView.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import SwiftUI

struct InfoView: View {

    var sortedCoinList: [Coin]

    init(sortedCoinList: [Coin]) {
        self.sortedCoinList = sortedCoinList
    }

    var body: some View {
        VStack {

            List {
                ForEach(sortedCoinList, id: \.id) { coin in
                    HStack {
                        Text(coin.name)
                        Spacer()
                        if let floatValue = Float(coin.changePercent24Hr) {
                            if floatValue > 0 {
                                Text("%\(CryptoViewModel.formatFloat(value: floatValue, decimalPlaces: 5))")
                                    .font(.subheadline)

                                    .foregroundColor(.green)
                            } else {
                                Text("%\(CryptoViewModel.formatFloat(value: floatValue, decimalPlaces: 5))")
                                    .font(.subheadline)

                                    .foregroundColor(.red)

                            }
                        }
                    }
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(sortedCoinList: [])
    }
}
