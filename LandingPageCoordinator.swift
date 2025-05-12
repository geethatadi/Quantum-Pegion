import UIKit

class LandingPageCoordinator {
    
    func goToNextScreen() {
        let loginVC = LoginViewController()
        
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}
