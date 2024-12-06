//
//  ThirdTabView.swift
//  LufthansaPOC
//
//  Created by Sarath on 03/12/24.
//
import SwiftUI

struct ThirdTabView: View {

    var body: some View {
        VStack {
            Text("Favorites Screen")
            Button("Go to Favorites Details") {
//                coordinator.navigate(to: .favoriteDetail)
            }
        }
        .navigationTitle("Favorites")
//        .navigationDestination(for: ThirdTabCoordinator.Destination.self) { destination in
//            switch destination {
//            case .favoriteDetail:
//                Text("Favorite Details View")
//            }
//        }
    }
}
