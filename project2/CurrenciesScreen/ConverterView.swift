//
//  ConverterView.swift
//  project2
//
//  Created by Tarık MacBook on 18.01.2024.
//

import SwiftUI

struct ConverterView: View {

    @State private var amount: String = ""
    @ObservedObject var viewModel: CurrenciesViewModel

    init(viewModel: CurrenciesViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("Converting from \(viewModel.baseCurrency)")
                TextField("Enter amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .padding()

                if let convertedAmount = calculateConvertedAmount() {
                    Text("Equivalent amount in other currencies:")
                        .font(.headline)
                        .padding(.top)

                    List {
                        ForEach(viewModel.currencyList.sorted(by: { $0.0 < $1.0 }), id: \.key) { key, exchangeRate in
                            let convertedValue = convertedAmount * exchangeRate
                            HStack {
                                Text("\(convertedValue, specifier: "%.2f")")
                                Spacer()
                                Text(key)
                            }
                        }
                    }
                }
            }
            .navigationTitle("CONVERTER")
            .padding()
        }
    }

    func convertAmount() {
        guard let inputAmount = Float(amount) else {
            // Handle invalid input (non-numeric or negative)
            return
        }

        viewModel.currencyList = viewModel.currencyList.mapValues { $0 * inputAmount }
    }

    func calculateConvertedAmount() -> Float? {
        guard let inputAmount = Float(amount) else {
            return nil
        }

        return inputAmount
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CurrenciesViewModel(baseCurrency: "USD")
        viewModel.isLoading = false
        return ConverterView(viewModel: viewModel)
    }
}
