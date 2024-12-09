
import SwiftUI

// MARK: - MainView
/// The main view containing the TabView and managing the coordinators for each tab.
/// Initializes and manages the coordinators for each tab and passes them to CustomTabView
struct MainView: View {
    @StateObject private var firstTabCoordinator = FirstTabCoordinator()
    @StateObject private var secondTabCoordinator = SecondTabCoordinator()
    @StateObject private var thirdTabCoordinator = ThirdTabCoordinator()

    var body: some View {
        TabView {
            // First tab
            CustomTabView(
                coordinator: firstTabCoordinator,
                rootView: { FirstTabView() },
                destinationBuilder: firstTabCoordinator.view(for:),
                sheetBuilder: firstTabCoordinator.sheet(for:),
                tabTitle: "FirstTab",
                tabImage: "message"
            )
            // Second tab
            CustomTabView(
                coordinator: secondTabCoordinator,
                rootView: { SecondTabView() },
                destinationBuilder: secondTabCoordinator.view(for:),
                sheetBuilder: secondTabCoordinator.sheet(for:),
                tabTitle: "SecondTab",
                tabImage: "phone"
            )
            // Third tab
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
