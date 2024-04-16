//
//  CryptoDataSource.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import Foundation
import SwiftUI

struct CryptoDataSource {

    private let baseURL = "https://api.coincap.io/v2/assets"
    var delegate: CryptoDataSourceDelegate?
    func loadCoinList() {

        let session = URLSession.shared
        guard let url = URL(string: "\(baseURL)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let dataTask = session.dataTask(with: request) {data, _, error in
            guard let data else {return} // make sure we have data (unwrapping)
            let decoder = JSONDecoder()

            do {
                let coinList = try decoder.decode(CryptoRates.self, from: data)
                DispatchQueue.main.async {
                    delegate?.coinListLoaded(coinList: coinList.data)
                }

                print(coinList.data.count)
            } catch {
                print(error)
            }

        }
        dataTask.resume()
    }

}
