
import SwiftUI

protocol Coordinator {
    associatedtype Destination: Hashable
    var path: NavigationPath { get set }
    func navigate(to destination: Destination)
    func reset()
}

// First Tab Coordinator
class FirstTabCoordinator: ObservableObject, Coordinator {
    @Published var path = NavigationPath()
    @Published var presentedDestination: Destination?
    
    enum Destination: Hashable, Identifiable {
        case push(DetailType)
        case present(ModalType)

        enum DetailType: Hashable {
            case detail
            case bookMark
        }

        enum ModalType: Hashable {
            case modalDetail
        }

        // Identifiable conformance
        var id: String {
            switch self {
            case .push(let detailType):
                return "push-\(detailType)"
            case .present(let modalType):
                return "present-\(modalType)"
            }
        }
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .push(let detailType):
            path.append(detailType)
        case .present(let modalType):
            presentedDestination = .present(modalType)
        }
    }
    
    func reset() {
        path.removeLast()
    }

}






class SecondTabCoordinator: ObservableObject, Coordinator {
    @Published var path = NavigationPath()
    
    enum Destination: Hashable {
        case searchDetail
    }
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func reset() {
        path.removeLast()
    }
}

class ThirdTabCoordinator: ObservableObject, Coordinator {
    @Published var path = NavigationPath()
    
    enum Destination: Hashable {
        case favoriteDetail
    }
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func reset() {
        path.removeLast()
    }
}
