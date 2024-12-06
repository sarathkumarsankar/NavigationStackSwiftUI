//
//  SecondTabView.swift
//  LufthansaPOC
//
//  Created by Sarath on 03/12/24.
//
import SwiftUI

struct SecondTabView: View {
    var body: some View {
        VStack {
            Text("Search Screen")
            Button("Go to Search Details") {
//                $coordinator.navigate(to: .searchDetail)
            }
        }
        .navigationTitle("Search")
    }
}
