
import UIKit

protocol ProductSelectionDelegate {
    func didSelectProduct(name:String, imageName:String)
}

class ModalViewController: UIViewController {
    
    let iphoneButton = UIButton();
    let macbookButton = UIButton();
    let iPad = UIButton();
    let label = UILabel()
    
    var delegate: ProductSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Este é um modal!"
        
        iphoneButton.translatesAutoresizingMaskIntoConstraints = false
        var iphoneButtonConfig = UIButton.Configuration.filled()
        iphoneButtonConfig.title = "Iphone"
        iphoneButtonConfig.imagePadding = 8
        iphoneButtonConfig.image = UIImage(systemName: "iphone")
        iphoneButtonConfig.baseBackgroundColor = .systemCyan
        iphoneButtonConfig.background.cornerRadius = 10
        iphoneButton.configuration = iphoneButtonConfig
        iphoneButton.addTarget(self, action: #selector(onTapButtonIphone), for: .touchDown)
        
        macbookButton.translatesAutoresizingMaskIntoConstraints = false
        var macBookButtonConfig = UIButton.Configuration.filled()
        macBookButtonConfig.image = UIImage(systemName: "macbook")
        macBookButtonConfig.imagePadding = 8
        macBookButtonConfig.title = "MacBook"
        macBookButtonConfig.baseBackgroundColor = .systemCyan
        macBookButtonConfig.background.cornerRadius = 10
        macbookButton.configuration = macBookButtonConfig
        macbookButton.addTarget(self, action: #selector(onTapMacButton), for: .touchDown)
        
        iPad.translatesAutoresizingMaskIntoConstraints = false
        var ipadConfig = UIButton.Configuration.filled()
        ipadConfig.image = UIImage(systemName: "ipad")
        ipadConfig.imagePadding = 8
        ipadConfig.title = "Ipad"
        ipadConfig.baseBackgroundColor = .systemCyan
        ipadConfig.background.cornerRadius = 10
        iPad.configuration = ipadConfig
        iPad.addTarget(self, action: #selector(onTapIpad), for: .touchDown)
        
        
        
        
        view.addSubview(label)
        view.addSubview(iphoneButton)
        view.addSubview(macbookButton)
        view.addSubview(iPad)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            iphoneButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iphoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iphoneButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            iphoneButton.heightAnchor.constraint(equalToConstant: 50),
            
            macbookButton.topAnchor.constraint(equalTo: iphoneButton.bottomAnchor, constant: 20),
            macbookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            macbookButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            macbookButton.heightAnchor.constraint(equalToConstant: 50),
            
            iPad.topAnchor.constraint(equalTo: macbookButton.bottomAnchor, constant: 20),
            iPad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iPad.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            iPad.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func onTapButtonIphone(){
        delegate?.didSelectProduct(name: "iPhone", imageName: "iphone")
        self.dismiss(animated: true)
    }
    
    @objc func onTapMacButton(){
        delegate?.didSelectProduct(name: "MacButton", imageName: "mac")
        self.dismiss(animated: true)
    }
    
    @objc func onTapIpad(){
        delegate?.didSelectProduct(name: "Ipad", imageName: "ipad")
        self.dismiss(animated: true)
    }
}
