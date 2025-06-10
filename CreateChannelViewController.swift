import UIKit

class CreateChannelViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var viewModel = CreateChannelViewModel()
    
    private let imageView = UIImageView()
    private let nameField = UITextField()
    private let descriptionField = UITextField()
    private let tagsField = UITextField()
    private let createButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        title = "Create Channel"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        view.addSubview(imageView)

   
        configureTextField(nameField, placeholder: "Enter channel name")

        configureTextField(descriptionField, placeholder: "Add channel description")

   
        configureTextField(tagsField, placeholder: "Add channel tags")
        
   
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitle("Create channel", for: .normal)
        createButton.backgroundColor = .darkGray
        createButton.layer.cornerRadius = 10
        createButton.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        view.addSubview(createButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.heightAnchor.constraint(equalToConstant: 50),

            descriptionField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            descriptionField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            descriptionField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 50),

            tagsField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 20),
            tagsField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            tagsField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            tagsField.heightAnchor.constraint(equalToConstant: 50),

            createButton.topAnchor.constraint(equalTo: tagsField.bottomAnchor, constant: 40),
            createButton.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func configureTextField(_ textField: UITextField, placeholder: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.backgroundColor = .darkGray
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.setLeftPaddingPoints(10)
        view.addSubview(textField)
    }

    @objc private func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }

    @objc private func createTapped() {
        viewModel.channel.name = nameField.text ?? ""
        viewModel.channel.description = descriptionField.text ?? ""
        viewModel.channel.tags = tagsField.text ?? ""
        
        viewModel.submitChannel { success in
            if success {
                let alert = UIAlertController(title: "Success", message: "Channel created!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Please enter a channel name.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage {
            imageView.image = img
            viewModel.channel.imageData = img.jpegData(compressionQuality: 0.7)
        }
        dismiss(animated: true, completion: nil)
    }
}
