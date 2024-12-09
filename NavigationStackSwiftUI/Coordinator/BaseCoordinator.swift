//
//  BaseCoordinator.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

// MARK: - BaseCoordinator
/// A generic base class implementing the `Coordinator` protocol.
open class BaseCoordinator<RouteType: Hashable, SheetRouteType: Hashable & Identifiable>: ObservableObject, Coordinator {
    @Published public var navigationPath = NavigationPath()
    @Published public var activeSheet: SheetRouteType?

    public init() {}

    /// Adds a route to the navigation path for push navigation.
    open func navigate(to route: RouteType) {
        navigationPath.append(route)
    }

    /// Sets the `activeSheet` to present a sheet.
    open func present(sheet: SheetRouteType) {
        activeSheet = sheet
    }

    /// Removes the last route or dismisses the sheet.
    open func reset() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        } else {
            activeSheet = nil
        }
    }
}

