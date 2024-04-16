//
//  CryptoViewModel.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import Foundation
import SwiftUI

class CryptoViewModel: ObservableObject {

    @Published var coinList: [Coin] = []
    @Published var sortedCoinList: [Coin] = []
    @Published var isLoading = true
    @Published var infoPresented = false
    private var dataSource = CryptoDataSource()

    init() {
        dataSource.delegate = self
    }

    func loadCoinList() {
        dataSource.loadCoinList()
    }

    static func formatFloat(value: Float, decimalPlaces: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = decimalPlaces
        formatter.maximumFractionDigits = decimalPlaces

        return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    func infoTapped() {
        infoPresented = true
    }

    func sortByChanges() {
        sortedCoinList.sort {
            guard let change1 = Float($0.changePercent24Hr),
                  let change2 = Float($1.changePercent24Hr) else {
                return false
            }
            return change1 > change2
        }
    }

}

extension CryptoViewModel: CryptoDataSourceDelegate {
    func coinListLoaded(coinList: [Coin]) {
        self.coinList = coinList
        self.sortedCoinList = coinList
        isLoading = false
    }
}
