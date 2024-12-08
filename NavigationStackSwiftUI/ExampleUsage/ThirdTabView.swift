//
//  ThirdTabView.swift
//  LufthansaPOC
//
//  Created by Sarath on 03/12/24.
//
import SwiftUI

struct ThirdTabView: View {
    @EnvironmentObject var coordinator: ThirdTabCoordinator

    var body: some View {
        VStack {
            Text("Third TabView")
            Button("Go to Favorites Details") {
                coordinator.navigate(to: .favouriteDetailView)
            }
        }
        .navigationTitle("Third TabView")
    }
}

struct FavouriteDetailView: View {
    var body: some View {
        VStack {
            Text("FavouriteDetailView")
        }
        .navigationTitle("Favorites")
    }
}
