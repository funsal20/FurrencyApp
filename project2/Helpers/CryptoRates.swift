//
//  CryptoRates.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import Foundation

struct CryptoRates: Codable, Hashable {
    let data: [Coin]
    let timestamp: TimeInterval
}

struct Coin: Codable, Hashable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String
    let maxSupply: String?
    let marketCapUsd: String
    let volumeUsd24Hr: String
    let priceUsd: String
    let changePercent24Hr: String
    let vwap24Hr: String?
    let explorer: String?
}
