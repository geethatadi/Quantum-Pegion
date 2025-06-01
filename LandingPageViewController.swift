import UIKit

class LandingPageViewController: UIViewController {

    private let logoImageView = UIImageView()
    private let appNameLabel = UILabel()
    private let proceedButton = UIButton()
    
    var viewModel: LandingPageViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .black
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "quantu_pigeon_logo") 
      view.addSubview(logoImageView)
        
        // Setup app name label
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "Quantu Pigeon"
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .center
        view.addSubview(appNameLabel)
        
        // Setup proceed button
        proceedButton.translatesAutoresizingMaskIntoConstraints = false
        proceedButton.setTitle("Get Started", for: .normal)
        proceedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        proceedButton.backgroundColor = .systemPurple
        proceedButton.layer.cornerRadius = 10
        proceedButton.addTarget(self, action: #selector(didTapProceed), for: .touchUpInside)
        view.addSubview(proceedButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            proceedButton.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 50),
            proceedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            proceedButton.widthAnchor.constraint(equalToConstant: 200),
            proceedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func bindViewModel() {
        viewModel = LandingPageViewModel()
    }
    func navigateToFeedScreen() {
    coordinator?.goToFeedScreen()
}

  @objc private func didTapProceed() {
    viewModel.navigateToFeedScreen()
}
}
