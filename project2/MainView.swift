//
//  MainView.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var currenciesViewModel: CurrenciesViewModel
    @ObservedObject var cryptoViewModel: CryptoViewModel

    init(currenciesViewModel: CurrenciesViewModel, cryptoViewModel: CryptoViewModel) {
        self.currenciesViewModel = currenciesViewModel
        self.cryptoViewModel = cryptoViewModel
    }

    var body: some View {

        TabView {
            CurrenciesView(viewModel: currenciesViewModel)
                .tabItem {
                    Label("Currency", systemImage: "dollarsign")
                }

            CryptoView(viewModel: cryptoViewModel)
                .tabItem {
                    Label("Crypto", systemImage: "bitcoinsign.circle")
                }

            VStack {
                UserProfileView()
                    .environmentObject(AuthenticationViewModel())
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(currenciesViewModel: CurrenciesViewModel(baseCurrency: "usd"), cryptoViewModel: CryptoViewModel())
            .environmentObject(AuthenticationViewModel())

    }
}
