import UIKit

class FeedViewController: UIViewController {

    private let feedTitleLabel = UILabel()
    private let feedCardView = UIView()
    private let quoteLabel = UILabel()
    private let authorLabel = UILabel()
    private let sourceLabel = UILabel()

    var viewModel: FeedViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    private func setupUI() {
        view.backgroundColor = .black

        // Feed Title
        feedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        feedTitleLabel.text = "Feed"
        feedTitleLabel.textColor = .white
        feedTitleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        view.addSubview(feedTitleLabel)

        // Feed Card View
        feedCardView.translatesAutoresizingMaskIntoConstraints = false
        feedCardView.backgroundColor = UIColor.systemTeal.withAlphaComponent(0.3)
        feedCardView.layer.cornerRadius = 12
        view.addSubview(feedCardView)

        // Quote Label
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.text = "\"Success only comes to those who dare to attempt.\""
        quoteLabel.font = UIFont.boldSystemFont(ofSize: 20)
        quoteLabel.textColor = .white
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center
        feedCardView.addSubview(quoteLabel)

        // Author Label
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.text = "Mallika Tripathi - Poet - Writer"
        authorLabel.font = UIFont.systemFont(ofSize: 16)
        authorLabel.textColor = .white
        authorLabel.textAlignment = .center
        feedCardView.addSubview(authorLabel)

        // Source Label
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.text = "Elkwood Quotes of the Day"
        sourceLabel.font = UIFont.italicSystemFont(ofSize: 14)
        sourceLabel.textColor = .lightGray
        sourceLabel.textAlignment = .center
        feedCardView.addSubview(sourceLabel)

        // Layout constraints
        NSLayoutConstraint.activate([
            feedTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            feedTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            feedCardView.topAnchor.constraint(equalTo: feedTitleLabel.bottomAnchor, constant: 30),
            feedCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedCardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            feedCardView.heightAnchor.constraint(equalToConstant: 200),

            quoteLabel.topAnchor.constraint(equalTo: feedCardView.topAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: feedCardView.leadingAnchor, constant: 10),
            quoteLabel.trailingAnchor.constraint(equalTo: feedCardView.trailingAnchor, constant: -10),

            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 10),
            authorLabel.centerXAnchor.constraint(equalTo: feedCardView.centerXAnchor),

            sourceLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            sourceLabel.centerXAnchor.constraint(equalTo: feedCardView.centerXAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel = FeedViewModel()
    }
}
