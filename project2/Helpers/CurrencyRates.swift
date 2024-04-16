//
//  Rates.swift
//  project2
//
//  Created by Tarık MacBook on 22.01.2024.
//

import Foundation
import SwiftUI

struct CurrencyRates: Codable, Hashable {

     let base: String
     let results: [String: Float]
     let updated: String
    // swiftlint: disable identifier_name
     let ms: Int
    // swiftlint: enable identifier_name

}
