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
            VStack {
                Text("Home Screen")
                Button("Go to Details") {
                    coordinator.navigate(to: .push(.detail("Sarath")))
                }
                Button("Go to Favourites") {
                    coordinator.navigate(to: .push(.favourite2))
                }
                Button("Present Modal 1") {
                    coordinator.navigate(to: .present(.modelSheet1))
                }
                Button("Present Modal 2") {
                    coordinator.navigate(to: .present(.modelSheet2))
                }
            }
            .navigationTitle("Home")
    }
}

struct DetailView: View {
    let data: String

    var body: some View {
        VStack {
            Text("Detail View")
            Text("Received Data: \(data)")
        }
        .navigationTitle("Detail")
    }
}
