//
//  SecondTabCoordinator.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

// MARK: - SecondTabCoordinator
/// Coordinator for the second tab, which also supports both push and sheet navigation.
final class SecondTabCoordinator: BaseCoordinator<SecondTabCoordinator.Route, SecondTabCoordinator.SheetRoute>, ViewFactory {
    enum Route: Hashable {
        case search(String)
    }
    
    enum SheetRoute: Hashable, Identifiable {
        case modelSheet1
        
        var id: String {
            switch self {
            case .modelSheet1: return "modelSheet1"
            }
        }
    }
    
    /// Returns the view for a specific route.
    func view(for route: Route) -> AnyView {
        switch route {
        case .search(let data):
            return AnyView(DetailView(data: data))
        }
    }
    
    /// Returns the view for a specific sheet route.
    func sheet(for sheetRoute: SheetRoute) -> AnyView {
        switch sheetRoute {
        case .modelSheet1:
            return AnyView(Text("Model Sheet 1"))
        }
    }
}
