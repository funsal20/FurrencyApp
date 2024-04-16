//
//  FavoritesView.swift
//  project2
//
//  Created by Tarık MacBook on 24.01.2024.
//

import SwiftUI

struct FavoritesView: View {

    @ObservedObject var homeViewModel: HomeViewModel

    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }

    var body: some View {
        VStack {
            HStack {
                Text("Favorites")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding(Spacing.padding_3)
            List(homeViewModel.favCurrencies, id: \.self) {
                currency in Text(currency)
                }
            }
        }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(homeViewModel: HomeViewModel())

    }
}
