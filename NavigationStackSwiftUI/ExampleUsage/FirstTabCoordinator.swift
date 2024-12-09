//
//  FirstTabCoordinator.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

public protocol ViewFactory {
    associatedtype Route: Hashable
    associatedtype SheetRoute: Hashable & Identifiable

    func view(for route: Route) -> AnyView
    func sheet(for sheetRoute: SheetRoute) -> AnyView
}

public extension ViewFactory {
    func sheet(for sheetRoute: SheetRoute) -> AnyView {
        AnyView(EmptyView())
    }
}

// MARK: - FirstTabCoordinator
/// Coordinator for the first tab, which supports both push and sheet navigation.
final class FirstTabCoordinator: BaseCoordinator<FirstTabCoordinator.Route, FirstTabCoordinator.SheetRoute>, ViewFactory {
    enum Route: Hashable {
        case detail(String)
        case favorite
    }
    
    enum SheetRoute: Hashable, Identifiable {
        case modelSheet1
        case modelSheet2
        
        var id: String {
            switch self {
            case .modelSheet1: return "modelSheet1"
            case .modelSheet2: return "modelSheet2"
            }
        }
    }
    
    /// Returns the view for a specific route.
    func view(for route: Route) -> AnyView {
        switch route {
        case .detail(let data):
            return AnyView(DetailView(data: data))
        case .favorite:
            return AnyView(Text("Favorite View"))
        }
    }
    
    /// Returns the view for a specific sheet route.
    func sheet(for sheetRoute: SheetRoute) -> AnyView {
        switch sheetRoute {
        case .modelSheet1:
            return AnyView(Text("Model Sheet 1"))
        case .modelSheet2:
            return AnyView(Text("Model Sheet 2"))
        }
    }
}

