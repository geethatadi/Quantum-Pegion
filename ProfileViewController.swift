import UIKit

class ProfileViewController: UIViewController {

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let earningsLabel = UILabel()
    private let askMeButton = UIButton()
    private let questionsAskedLabel = UILabel()
    private let channelsButton = UIButton()
    
    private let actionButton = UIButton()  // This will be for the "+" button

    var viewModel: ProfileViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .black
        
        // Profile Image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.image = UIImage(named: "profile_picture") // Placeholder image
        view.addSubview(profileImageView)
        
        // Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Geetha Tadi"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(nameLabel)
        
        // Username Label
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "@geetha_tadi"
        usernameLabel.textColor = .lightGray
        usernameLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(usernameLabel)
        
        // Earnings Label
        earningsLabel.translatesAutoresizingMaskIntoConstraints = false
        earningsLabel.text = "Earnings: $0.00"
        earningsLabel.textColor = .white
        view.addSubview(earningsLabel)
        
        // Ask Me Button
        askMeButton.translatesAutoresizingMaskIntoConstraints = false
        askMeButton.setTitle("Ask Me", for: .normal)
        askMeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        askMeButton.backgroundColor = .systemPurple
        askMeButton.layer.cornerRadius = 10
        askMeButton.addTarget(self, action: #selector(didTapAskMe), for: .touchUpInside)
        view.addSubview(askMeButton)
        
        // Questions Asked Label
        questionsAskedLabel.translatesAutoresizingMaskIntoConstraints = false
        questionsAskedLabel.text = "Questions Asked"
        questionsAskedLabel.textColor = .white
        questionsAskedLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(questionsAskedLabel)
        
        // Channels Button
        channelsButton.translatesAutoresizingMaskIntoConstraints = false
        channelsButton.setTitle("Channels", for: .normal)
        channelsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        channelsButton.layer.cornerRadius = 10
        channelsButton.layer.borderWidth = 1
        channelsButton.layer.borderColor = UIColor.white.cgColor
        channelsButton.addTarget(self, action: #selector(didTapChannels), for: .touchUpInside)
        view.addSubview(channelsButton)
        
        // Action "+" Button (centered at bottom)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle("+", for: .normal)
        actionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        actionButton.backgroundColor = .systemPurple
        actionButton.layer.cornerRadius = 40
        actionButton.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        view.addSubview(actionButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Profile Image Constraints
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // Name Label Constraints
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Username Label Constraints
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Earnings Label Constraints
            earningsLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 20),
            earningsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Ask Me Button Constraints
            askMeButton.topAnchor.constraint(equalTo: earningsLabel.bottomAnchor, constant: 40),
            askMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            askMeButton.widthAnchor.constraint(equalToConstant: 200),
            askMeButton.heightAnchor.constraint(equalToConstant: 45),
            
            // Questions Asked Label Constraints
            questionsAskedLabel.topAnchor.constraint(equalTo: askMeButton.bottomAnchor, constant: 20),
            questionsAskedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Channels Button Constraints
            channelsButton.topAnchor.constraint(equalTo: questionsAskedLabel.bottomAnchor, constant: 20),
            channelsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            channelsButton.widthAnchor.constraint(equalToConstant: 200),
            channelsButton.heightAnchor.constraint(equalToConstant: 45),
            
            // Action Button Constraints (at the bottom of the screen)
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 80),
            actionButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    private func bindViewModel() {
        viewModel = ProfileViewModel()
    }
    
    @objc private func didTapAskMe() {
        viewModel.askMeFeature()
    }
    
    @objc private func didTapChannels() {
        viewModel.addChannels()
    }
    
    @objc private func didTapAction() {
        viewModel.performAction()
    }
}
