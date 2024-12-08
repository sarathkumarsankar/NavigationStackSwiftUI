
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

// MARK: - CustomTabView
///  A reusable view that binds a tab to its coordinator, root view, navigation, and optional sheets.
struct CustomTabView<CoordinatorType: Coordinator, RootView: View>: View {
    @ObservedObject var coordinator: CoordinatorType
    let rootView: () -> RootView
    let destinationBuilder: (CoordinatorType.Route) -> AnyView
    let sheetBuilder: ((CoordinatorType.SheetRoute) -> AnyView)?
    let tabTitle: String
    let tabImage: String

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            rootView()
                .navigationDestination(for: CoordinatorType.Route.self) { route in
                    destinationBuilder(route)
                }
                .sheet(item: $coordinator.activeSheet) { sheetRoute in
                    if let sheetBuilder = sheetBuilder {
                        sheetBuilder(sheetRoute)
                    }
                }
        }
        .environmentObject(coordinator)
        .tabItem {
            Label(tabTitle, systemImage: tabImage)
        }
    }
}


// MARK: - FirstTabCoordinator
/// Coordinator for the first tab, which supports both push and sheet navigation.
final class FirstTabCoordinator: BaseCoordinator<FirstTabCoordinator.Route, FirstTabCoordinator.SheetRoute> {
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

// MARK: - SecondTabCoordinator
/// Coordinator for the second tab, which also supports both push and sheet navigation.
final class SecondTabCoordinator: BaseCoordinator<SecondTabCoordinator.Route, SecondTabCoordinator.SheetRoute> {
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

// MARK: - ThirdTabCoordinator
/// Coordinator for the third tab, which only supports push navigation.
final class ThirdTabCoordinator: BaseCoordinator<ThirdTabCoordinator.Route, Never> {
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
}

// MARK: - MainView
/// The main view containing the TabView and managing the coordinators for each tab.
/// Initializes and manages the coordinators for each tab and passes them to CustomTabView
struct MainView: View {
    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
    @StateObject private var secondTabCoordinator = SecondTabCoordinator()
    @StateObject private var thirdTabCoordinator = ThirdTabCoordinator()

    var body: some View {
        TabView {
            CustomTabView(
                coordinator: firstTabCoordinator,
                rootView: { FirstTabView() },
                destinationBuilder: firstTabCoordinator.view(for:),
                sheetBuilder: firstTabCoordinator.sheet(for:),
                tabTitle: "FirstTab",
                tabImage: "message"
            )
            
            CustomTabView(
                coordinator: secondTabCoordinator,
                rootView: { SecondTabView() },
                destinationBuilder: secondTabCoordinator.view(for:),
                sheetBuilder: secondTabCoordinator.sheet(for:),
                tabTitle: "SecondTab",
                tabImage: "phone"
            )

            CustomTabView(
                coordinator: thirdTabCoordinator,
                rootView: { ThirdTabView() },
                destinationBuilder: thirdTabCoordinator.view(for:),
                sheetBuilder: nil,
                tabTitle: "ThirdTab",
                tabImage: "star"
            )
        }
    }
}
