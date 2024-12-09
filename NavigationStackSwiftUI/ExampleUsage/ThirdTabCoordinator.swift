//
//  ThirdTabCoordinator.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

// MARK: - ThirdTabCoordinator
/// Coordinator for the third tab, which only supports push navigation.
final class ThirdTabCoordinator: BaseCoordinator<ThirdTabCoordinator.Route, Never>, ViewFactory {
    enum Route: Hashable {
        case settings
        case favouriteDetailView
    }

    /// Returns the view for a specific route.
    func view(for route: Route) -> AnyView {
        switch route {
        case .settings:
            return AnyView(Text("Settings View"))
        case .favouriteDetailView:
            return AnyView(FavouriteDetailView())
        }
    }
    func sheet(for sheetRoute: SheetRoute) -> AnyView { }
}
