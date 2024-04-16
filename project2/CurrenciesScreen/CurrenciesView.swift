//
//  CurrenciesView.swift
//  project2
//
//  Created by Tarık MacBook on 18.01.2024.
//

import SwiftUI

struct CurrenciesView: View {

    @ObservedObject var viewModel: CurrenciesViewModel

    init(viewModel: CurrenciesViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: Spacing.padding_3) {
            caonverterButton
            if viewModel.isLoading {
                Loading()
                    .onAppear {
                        CurrencyDataSource.baseCurrency = viewModel.baseCurrency
                        viewModel.loadCurrencyList()
                    }
            } else {
                VStack {
                    Text("1 \(viewModel.baseCurrency) equals: ")
                    List {
                        ForEach(viewModel.currencyList.sorted(by: { $0.0 < $1.0 }), id: \.key) { key, value in

                            HStack(spacing: .zero) {
                                Text(key)
                                    .bold()
                                Spacer()
                                Text("\(value)")
                                    .foregroundColor(.gray)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .navigationBarItems(trailing: caonverterButton)
                    .sheet(isPresented: $viewModel.converterPresented) {
                        ConverterView(viewModel: viewModel)
                    }

                }
            }
        }
    }

    var caonverterButton: some View {
        Button(action: {
            viewModel.converterTapped()

        })
        { Image(systemName: "minus.slash.plus")
                .font(.title2)
        }
    }
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {

        let viewModel = CurrenciesViewModel(baseCurrency: "usd")
                viewModel.isLoading = false
                return CurrenciesView(viewModel: viewModel)
    }
}
