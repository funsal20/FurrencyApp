//
//  CurrencyDataSourceDelegate.swift
//  project2
//
//  Created by Tarık MacBook on 22.01.2024.
//

import Foundation
import SwiftUI

protocol CurrencyDataSourceDelegate: AnyObject {
    func currencyListLoaded(currencyList: [String: Float])
}
