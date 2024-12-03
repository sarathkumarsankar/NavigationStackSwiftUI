
import SwiftUI

struct MainTabView: View {
    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
    @StateObject private var secondTabCoordinator = SecondTabCoordinator()
    @StateObject private var thirdTabCoordinator = ThirdTabCoordinator()
    
    var body: some View {
        TabView {
            NavigationStack(path: $firstTabCoordinator.path) {
                FirstTabView()
                    .sheet(item: $firstTabCoordinator.presentedDestination) { destination in
                        switch destination {
                        case .present(let modalType):
                            switch modalType {
                            case .modalDetail:
                                Text("Modal Detail for Conversation")
                            }
                        default:
                            EmptyView()
                        }
                    }
                    .navigationDestination(for: FirstTabCoordinator.Destination.DetailType.self) { detailType in
                        switch detailType {
                        case .detail:
                            Text("Home Details View")
                        case .bookMark:
                            Text("Book mark View")
                        }
                    }
                   
            }
            .environmentObject(firstTabCoordinator)
            .tabItem {
                Label("Conversation", systemImage: "message")
            }
            
            NavigationStack(path: $secondTabCoordinator.path) {
                SecondTabView(coordinator: secondTabCoordinator)
            }
            .tabItem {
                Label("PhoneBook", systemImage: "phone")
            }
            
            NavigationStack(path: $thirdTabCoordinator.path) {
                ThirdTabView(coordinator: thirdTabCoordinator)
            }
            .tabItem {
                Label("TAC Webview", systemImage: "star")
            }
        }
    }
}
