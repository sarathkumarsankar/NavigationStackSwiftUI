
import SwiftUI
//// First tab(required both push and present)
//final class FirstTabCoordinator: BaseCoordinator<FirstTabCoordinator.Route, FirstTabCoordinator.SheetRoute> {
//    enum Route: Hashable {
//        case detail(String)
//        case favorite
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
//// Second tab(required both push and present)
//class SecondTabCoordinator: BaseCoordinator<SecondTabCoordinator.Route, SecondTabCoordinator.SheetRoute> {
//    enum Route: Hashable {
//        case search(String)
//    }
//    
//    enum SheetRoute: Hashable, Identifiable {
//        case modelSheet1
//        
//        var id: String {
//            switch self {
//            case .modelSheet1: return "modelSheet1"
//            }
//        }
//    }
//    
//    func view(for route: Route) -> AnyView {
//        switch route {
//        case .search(let data):
//            return AnyView(DetailView(data: data))
//        }
//    }
//    
//    func sheet(for sheetRoute: SheetRoute) -> AnyView {
//        switch sheetRoute {
//        case .modelSheet1:
//            return AnyView(Text("Model Sheet 1"))
//        }
//    }
//}
//
//// Third tab(only push )
//final class ThirdTabCoordinator: BaseCoordinator<ThirdTabCoordinator.Route, Never> {
//    enum Route: Hashable {
//        case settings
//        case favouriteDetailView
//    }
//
//    func view(for route: Route) -> AnyView {
//        switch route {
//        case .settings:
//            return AnyView(Text("Settings View"))
//        case .favouriteDetailView:
//            return AnyView(FavouriteDetailView())
//        }
//    }
//}
