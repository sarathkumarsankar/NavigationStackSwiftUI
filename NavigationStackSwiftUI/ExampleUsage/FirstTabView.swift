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
            Text("First TabView")
            Button("Go to Details") {
                coordinator.navigate(to: .detail("Sample Data"))
            }
            Button("Present Modal 1") {
                coordinator.present(sheet: .modelSheet1)
            }
            Button("Present Modal 2") {
                coordinator.present(sheet: .modelSheet2)
            }
        }
        .navigationTitle("First Tab")
    }
}

struct DetailView: View {
    let data: String

    var body: some View {
        VStack {
            Text("Received Data: \(data)")
        }
        .navigationTitle("Detail")
    }
}
