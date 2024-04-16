//
//  ContentView.swift
//  project2
//
//  Created by Tarık MacBook on 19.01.2024.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var searchText = ""

    var body: some View {

        NavigationStack {
            VStack(spacing: .zero) {
                Text("Select base currency from the list below: ")
                    .fontWeight(.semibold)

                Spacer()
                List(searchResults, id: \.self) { currency in
                    NavigationLink(destination:

                                    MainView(currenciesViewModel: CurrenciesViewModel(baseCurrency: currency),
                                             cryptoViewModel: CryptoViewModel()))
                    {
                        Text(currency)
                    }.swipeActions {
                        Button("Fav") {
                            viewModel.favCurrencies.append(currency)
                        }
                        .tint(.green)

                        Button("Unfav") {
                            DispatchQueue.main.async {
                                if let index = viewModel.favCurrencies.firstIndex(of: currency) {
                                    viewModel.favCurrencies.remove(at: index)
                                }
                            }
                        }
                        .tint(.red)
                    }
                    .navigationTitle("FURRENCY")
                    .searchable(text: $searchText)

                }
            }
            .environmentObject(viewModel)
        }

        var searchResults: [String] {
            if searchText.isEmpty {
                return viewModel.currencies
            } else {
                return viewModel.currencies.filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .environmentObject(HomeViewModel())
        }
    }
}
