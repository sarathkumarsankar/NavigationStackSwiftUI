//
//  BaseCoordinator.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 08/12/24.
//

import SwiftUI

//public protocol Coordinator: ObservableObject {
//    associatedtype Route: Hashable
//    associatedtype SheetRoute: Hashable & Identifiable
//    var navigationPath: NavigationPath { get set }
//    var activeSheet: SheetRoute? { get set }
//    func navigate(to route: Route)
//    func present(sheet: SheetRoute)
//    func reset()
//}
//
//open class BaseCoordinator<RouteType: Hashable, SheetRouteType: Hashable & Identifiable>: ObservableObject, Coordinator {
//    @Published public var navigationPath = NavigationPath()
//    @Published public var activeSheet: SheetRouteType?
//
//    public init() {}
//
//    open func navigate(to route: RouteType) {
//        navigationPath.append(route)
//    }
//
//    open func present(sheet: SheetRouteType) {
//        activeSheet = sheet
//    }
//
//    open func reset() {
//        if !navigationPath.isEmpty {
//            navigationPath.removeLast()
//        } else {
//            activeSheet = nil
//        }
//    }
//}
//
