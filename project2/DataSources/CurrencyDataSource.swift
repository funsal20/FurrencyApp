//
//  CurrencyDataSource.swift
//  project2
//
//  Created by Tarık MacBook on 22.01.2024.
//

import Foundation
import SwiftUI

struct CurrencyDataSource {

    static var baseCurrency: String = ""

    var delegate: CurrencyDataSourceDelegate?
    func loadCurrencyList() {

        let session = URLSession.shared
        guard let url = URL(string: "https://api.fastforex.io/fetch-all?from=\(CurrencyDataSource.baseCurrency)&api_key=e264ef0f7b-37ec1ccf26-s7ojph") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = session.dataTask(with: request) {data, _, error in
            guard let data else {return} // make sure we have data (unwrapping)
            let decoder = JSONDecoder()

            do {
                let currencyList = try decoder.decode(CurrencyRates.self, from: data)
                DispatchQueue.main.async {
                    delegate?.currencyListLoaded(currencyList: currencyList.results)
                }

                print(currencyList.results.count)
            } catch {
                print(error)
            }

        }
        dataTask.resume()
    }

}
