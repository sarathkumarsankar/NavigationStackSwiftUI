//
//  CustomTabView.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

//struct CustomTabView<CoordinatorType: Coordinator, RootView: View>: View {
//    @ObservedObject var coordinator: CoordinatorType
//    let rootView: () -> RootView
//    let destinationBuilder: (CoordinatorType.Route) -> AnyView
//    let sheetBuilder: ((CoordinatorType.SheetRoute) -> AnyView)?
//    let tabTitle: String
//    let tabImage: String
//
//    var body: some View {
//        NavigationStack(path: $coordinator.navigationPath) {
//            rootView()
//                .navigationDestination(for: CoordinatorType.Route.self) { route in
//                    destinationBuilder(route)
//                }
//                .sheet(item: $coordinator.activeSheet) { sheetRoute in
//                    if let sheetBuilder = sheetBuilder {
//                        sheetBuilder(sheetRoute)
//                    }                }
//        }
//        .environmentObject(coordinator)
//        .tabItem {
//            Label(tabTitle, systemImage: tabImage)
//        }
//    }
//}
