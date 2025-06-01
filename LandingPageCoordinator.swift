import UIKit

class LandingPageCoordinator {
    
    func goToNextScreen() {
        let loginVC = LoginViewController()
        
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    func goToFeedScreen() {
        let feedVC = FeedViewController()  // Initialize FeedViewController
        
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.navigationController?.pushViewController(feedVC, animated: true)
        }
    }
}
