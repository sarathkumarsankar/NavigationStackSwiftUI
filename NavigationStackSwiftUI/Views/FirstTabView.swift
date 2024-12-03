//
//  FirstTabView.swift
//  LufthansaPOC
//
//  Created by Sarath on 03/12/24.
//
import SwiftUI

struct FirstTabView: View {
    @EnvironmentObject var coordinator: FirstTabCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Text("Home Screen")
                Button("Go to Details") {
                    coordinator.navigate(to: .push(.detail))
                }
                Button("Present Modal") {
                    coordinator.navigate(to: .present(.modalDetail))
                }
            }
            .navigationTitle("Home")
        }
    }
}
