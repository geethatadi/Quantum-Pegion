import Foundation

class LandingPageViewModel {

    var coordinator: LandingPageCoordinator?

    init() {
        // Initialize the coordinator
        coordinator = LandingPageCoordinator()
    }
    
    func navigateToNextScreen() {
        coordinator?.goToNextScreen()
    }
}
