//
//  CryptoDataSourceDelegate.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import Foundation

protocol CryptoDataSourceDelegate: AnyObject {

    func coinListLoaded(coinList: [Coin])

}
