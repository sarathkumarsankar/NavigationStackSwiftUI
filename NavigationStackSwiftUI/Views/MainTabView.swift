
import SwiftUI

struct MainTabView: View {
    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
    @StateObject private var secondTabCoordinator = SecondTabCoordinator()
    @StateObject private var thirdTabCoordinator = ThirdTabCoordinator()
    
    var body: some View {
        TabView {
            NavigationStack(path: $firstTabCoordinator.path) {
                FirstTabView()
                    .navigationDestination(for: FirstTabCoordinator.Destination.DetailType.self) { detailType in
                        switch detailType {
                        case .detail(let data):
                            DetailView(data: data)
                        case .favourite:
                            Text("Favourite view")
                        }
                    }
                    .sheet(item: $firstTabCoordinator.presentedDestination) { destination in
                        switch destination {
                        case .present(let modalType):
                            switch modalType {
                            case .modelSheet1:
                                Text("ModelSheet1")
                            case .modelSheet2:
                                Text("ModelSheet2")
                            }
                        default:
                            EmptyView()
                        }
                    }
                   
            }
            .environmentObject(firstTabCoordinator)
            .tabItem {
                Label("Conversation", systemImage: "message")
            }
            
//            NavigationStack(path: $secondTabCoordinator.path) {
//                SecondTabView(coordinator: secondTabCoordinator)
//            }
//            .tabItem {
//                Label("PhoneBook", systemImage: "phone")
//            }
//            
//            NavigationStack(path: $thirdTabCoordinator.path) {
//                ThirdTabView(coordinator: thirdTabCoordinator)
//            }
//            .tabItem {
//                Label("TAC Webview", systemImage: "star")
//            }
        }
    }
}
