//
//  defining.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//
import SwiftUI
// MARK: - Coordinator Protocol
/// A protocol defining the base requirements for a navigation coordinator.
public protocol Coordinator: ObservableObject {
    associatedtype Route: Hashable
    associatedtype SheetRoute: Hashable & Identifiable
    
    /// Represents the navigation path for push navigation.
    var navigationPath: NavigationPath { get set }
    
    /// Represents the currently active sheet.
    var activeSheet: SheetRoute? { get set }
    
    /// Navigate to a specific route by adding it to the navigation path.
    func navigate(to route: Route)
    
    /// Present a sheet with a specific route.
    func present(sheet: SheetRoute)
    
    /// Reset navigation by removing the last route or dismissing the active sheet.
    func reset()
}
