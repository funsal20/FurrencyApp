//
//  Loading.swift
//  project2
//
//  Created by Tarık MacBook on 23.01.2024.
//

import SwiftUI

struct Loading: View {

    var body: some View {
        VStack(spacing: Spacing.padding_1) {
            ProgressView()
            Text("Loading...")
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
