
import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype Destination: Hashable & Identifiable
    var navigationPath: NavigationPath { get set }
    var activeSheet: Destination? { get set }
    func navigate(to destination: Destination)
    func reset()
}

protocol DestinationProtocol: Hashable, Identifiable {
    associatedtype DetailType: Hashable
}

class FirstTabCoordinator: ObservableObject, Coordinator {
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet: Destination?
    
    enum Destination: Hashable, Identifiable {
        case push(Route)
        case present(Sheet)
        
        enum Route: Hashable {
            case detail(String)
            case favourite
            case favourite2
        }
        
        enum Sheet: Hashable {
            case modelSheet1
            case modelSheet2
        }
        
        var id: String {
            switch self {
            case .push(let detailType): return "push-\(detailType)"
            case .present(let modalType): return "present-\(modalType)"
            }
        }
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .push(let route):
            navigationPath.append(route)
        case .present(let sheetRoute):
            activeSheet = .present(sheetRoute)
        }
    }
    
    
    func reset() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
}



class SecondTabCoordinator: ObservableObject, Coordinator {
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet: Destination?
    
    enum Destination: Hashable, Identifiable {
        case push(Route)
        case present(Sheet)
        
        enum Route: Hashable {
            case detail(String)
            case favourite
            case favourite2
        }
        
        enum Sheet: Hashable {
            case modelSheet1
            case modelSheet2
        }
        
        var id: String {
            switch self {
            case .push(let detailType): return "push-\(detailType)"
            case .present(let modalType): return "present-\(modalType)"
            }
        }
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .push(let route):
            navigationPath.append(route)
        case .present(let sheetRoute):
            activeSheet = .present(sheetRoute)
        }
    }
    
    
    func reset() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
}


class ThirdTabCoordinator: ObservableObject, Coordinator {
    
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet: Destination?
    
    enum Destination: Hashable, Identifiable {
        case push(Route)
        case present(Sheet)
        
        enum Route: Hashable {
            case detail(String)
            case favourite
            case favourite2
        }
        
        enum Sheet: Hashable {
            case modelSheet1
            case modelSheet2
        }
        
        var id: String {
            switch self {
            case .push(let detailType): return "push-\(detailType)"
            case .present(let modalType): return "present-\(modalType)"
            }
        }
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .push(let route):
            navigationPath.append(route)
        case .present(let sheetRoute):
            activeSheet = .present(sheetRoute)
        }
    }
    
    
    func reset() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
}
