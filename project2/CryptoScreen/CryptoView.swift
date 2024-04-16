//
//  CryptoView.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import SwiftUI

struct CryptoView: View {

    @ObservedObject var viewModel: CryptoViewModel

    init(viewModel: CryptoViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if viewModel.isLoading {
            Loading()
                .onAppear {
                    viewModel.loadCoinList()
                }
        } else {
            NavigationView {
                    List {
                        ForEach(viewModel.coinList, id: \.self) { coin in
                            HStack {
                                Text(coin.name)
                                Spacer()

                                if let floatValue = Float(coin.priceUsd) {
                                    Text(CryptoViewModel.formatFloat(value: floatValue, decimalPlaces: 5))
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: infoButton)
                    .sheet(isPresented: $viewModel.infoPresented) {
                        InfoView(sortedCoinList: viewModel.sortedCoinList)
                    }
            }
        }
}
    var infoButton: some View {
        Button(action: {
            viewModel.infoTapped()
            viewModel.sortByChanges()
        })
        {
            Image(systemName: "info.circle")
                .font(.title2)
        }
    }
}

struct CryptoView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoView(viewModel: CryptoViewModel())
    }
}
