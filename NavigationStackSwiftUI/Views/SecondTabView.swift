//
//  SecondTabView.swift
//  LufthansaPOC
//
//  Created by Sarath on 03/12/24.
//
import SwiftUI

struct SecondTabView: View {
    @ObservedObject var coordinator: SecondTabCoordinator

    var body: some View {
        VStack {
            Text("Search Screen")
            Button("Go to Search Details") {
                coordinator.navigate(to: .searchDetail)
            }
        }
        .navigationTitle("Search")
        .navigationDestination(for: SecondTabCoordinator.Destination.self) { destination in
            switch destination {
            case .searchDetail:
                Text("Search Details View")
            }
        }
    }
}
