//
//  BackUpView.swift
//  NavigationStackSwiftUI
//
//  Created by Sarath on 07/12/24.
//


import SwiftUI
//
//struct MainTabView: View {
//    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
//    var body: some View {
//        TabView {
//            CustomTabView(
//                coordinator: firstTabCoordinator,
//                rootView: { FirstTabView() },
//                destinationBuilder: firstTabCoordinator.view(for:),
//                sheetBuilder: firstTabCoordinator.sheet(for:)
//            )
//            .tabItem {
//                Label("Conversation", systemImage: "message")
//            }
//        }
//    }
//}
//
//// CustomTabView.swift
//struct CustomTabView<CoordinatorType: Coordinator, RootView: View>: View {
//    @ObservedObject var coordinator: CoordinatorType
//    let rootView: () -> RootView
//    let destinationBuilder: (CoordinatorType.Route) -> AnyView
//    let sheetBuilder: (CoordinatorType.SheetRoute) -> AnyView
//
//    var body: some View {
//        NavigationStack(path: $coordinator.navigationPath) {
//            rootView()
//                .navigationDestination(for: CoordinatorType.Route.self) { route in
//                    destinationBuilder(route)
//                }
//                .sheet(item: $coordinator.activeSheet) { sheetRoute in
//                    sheetBuilder(sheetRoute)
//                }
//        }
//        .environmentObject(coordinator)
//    }
//}
//
//// Coordinator.swift
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
//// FirstTabCoordinator.swift
//final class FirstTabCoordinator: BaseCoordinator<FirstTabCoordinator.Route, FirstTabCoordinator.SheetRoute> {
//    enum Route: Hashable {
//        case detail(String)
//        case favorite
//        case favoriteAlt
//    }
//
//    enum SheetRoute: Hashable, Identifiable {
//        case modelSheet1
//        case modelSheet2
//
//        var id: String {
//            switch self {
//            case .modelSheet1: return "modelSheet1"
//            case .modelSheet2: return "modelSheet2"
//            }
//        }
//    }
//
//    func view(for route: Route) -> AnyView {
//        switch route {
//        case .detail(let data):
//            return AnyView(DetailView(data: data))
//        case .favorite:
//            return AnyView(Text("Favorite View"))
//        case .favoriteAlt:
//            return AnyView(Text("Alternate Favorite View"))
//        }
//    }
//
//    func sheet(for sheetRoute: SheetRoute) -> AnyView {
//        switch sheetRoute {
//        case .modelSheet1:
//            return AnyView(Text("Model Sheet 1"))
//        case .modelSheet2:
//            return AnyView(Text("Model Sheet 2"))
//        }
//    }
//}





//
//import SwiftUI
//
//struct MainTabView: View {
//    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
//    var body: some View {
//        TabView {
//            CustomTabView(
//                coordinator: firstTabCoordinator,
//                rootView: { FirstTabView() },
//                destinationBuilder: firstTabCoordinator.view(for:),
//                sheetBuilder: firstTabCoordinator.sheet(for:),
//                tabItemBuilder: {
//                    AnyView(Label("Conversation", systemImage: "message"))
//                }
//            )
//        }
//    }
//}
//
//struct CustomTabView<CoordinatorType: Coordinator, RootView: View>: View {
//    @ObservedObject var coordinator: CoordinatorType
//    let rootView: () -> RootView
//    let destinationBuilder: (CoordinatorType.Route) -> AnyView
//    let sheetBuilder: (CoordinatorType.SheetRoute) -> AnyView
//    let tabItemBuilder: () -> AnyView
//
//    var body: some View {
//        NavigationStack(path: $coordinator.navigationPath) {
//            rootView()
//                .navigationDestination(for: CoordinatorType.Route.self) { route in
//                    destinationBuilder(route)
//                }
//                .sheet(item: $coordinator.activeSheet) { sheetRoute in
//                    sheetBuilder(sheetRoute)
//                }
//        }
//        .environmentObject(coordinator)
//        .tabItem {
//            tabItemBuilder() // Tab item content
//        }
//    }
//}
//
//// Coordinator.swift
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
//
//public protocol ViewFactory {
//    associatedtype Route: Hashable
//    associatedtype SheetRoute: Hashable & Identifiable
//
//    func view(for route: Route) -> AnyView
//    func sheet(for sheetRoute: SheetRoute) -> AnyView
//}
//
//public extension ViewFactory {
//    func sheet(for sheetRoute: SheetRoute) -> AnyView {
//        AnyView(EmptyView())
//    }
//}
//
//// FirstTabCoordinator.swift
//final class FirstTabCoordinator: BaseCoordinator<FirstTabCoordinator.Route, FirstTabCoordinator.SheetRoute>, ViewFactory {
//    enum Route: Hashable {
//        case detail(String)
//        case favorite
//        case favoriteAlt
//    }
//
//    enum SheetRoute: Hashable, Identifiable {
//        case modelSheet1
//        case modelSheet2
//
//        var id: String {
//            switch self {
//            case .modelSheet1: return "modelSheet1"
//            case .modelSheet2: return "modelSheet2"
//            }
//        }
//    }
//
//    func view(for route: Route) -> AnyView {
//        switch route {
//        case .detail(let data):
//            return AnyView(DetailView(data: data))
//        case .favorite:
//            return AnyView(Text("Favorite View"))
//        case .favoriteAlt:
//            return AnyView(Text("Alternate Favorite View"))
//        }
//    }
//
//    func sheet(for sheetRoute: SheetRoute) -> AnyView {
//        switch sheetRoute {
//        case .modelSheet1:
//            return AnyView(Text("Model Sheet 1"))
//        case .modelSheet2:
//            return AnyView(Text("Model Sheet 2"))
//        }
//    }
//}
