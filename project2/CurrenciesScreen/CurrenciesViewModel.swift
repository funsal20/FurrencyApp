//
//  CurrenciesViewModel.swift
//  project2
//
//  Created by Tarık MacBook on 18.01.2024.
//

import Foundation
import SwiftUI

class CurrenciesViewModel: ObservableObject {

    @Published var baseCurrency: String
    private var dataSource = CurrencyDataSource()
    @Published var currencyList: [String: Float] = [:]
    @Published var isLoading = true
    @Published var converterPresented = false

    init(baseCurrency: String) {
        self.baseCurrency = baseCurrency
        dataSource.delegate = self
    }

    func loadCurrencyList() {
        dataSource.loadCurrencyList()
    }

    func converterTapped() {
        converterPresented = true
    }

}

extension CurrenciesViewModel: CurrencyDataSourceDelegate {
    func currencyListLoaded(currencyList: [String: Float]) {
        self.currencyList = currencyList
        isLoading = false
    }
}
