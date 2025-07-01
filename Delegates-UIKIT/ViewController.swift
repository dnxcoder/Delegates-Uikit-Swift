//
//  ViewController.swift
//  Delegates-UIKIT
//
//  Created by Denis Coder on 6/30/25.
//

import UIKit

class ViewController: UIViewController, ProductSelectionDelegate{
    
    let label = UILabel()
    let labelCont = UILabel()
    let chooseProductButton = UIButton()
    var selectedProductImage = UIImageView()
    var cont : Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupView()
    }
    
    func incrementCont(){
        cont+=1;
        labelCont.text = String(cont)
    }
    
    func setupView(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to UIKit";
        label.font = UIFont.systemFont(ofSize: 24)
        
        chooseProductButton.translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.title = "Choose a Product"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        config.cornerStyle = .large
        chooseProductButton.configuration = config
        chooseProductButton.addTarget(self, action: #selector(openModal), for: .touchDown)
        
        selectedProductImage.translatesAutoresizingMaskIntoConstraints = false
        selectedProductImage.image = UIImage(named: "all-products")
        selectedProductImage.contentMode = .scaleAspectFill
        
        view.addSubview(label)
        view.addSubview(selectedProductImage)
        view.addSubview(chooseProductButton)
        view.addSubview(labelCont)
        
        NSLayoutConstraint.activate([
            selectedProductImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            selectedProductImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectedProductImage.widthAnchor.constraint(equalToConstant: 200),
            selectedProductImage.heightAnchor.constraint(equalToConstant: 200),

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: selectedProductImage.bottomAnchor, constant: 50),
            
            
            chooseProductButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseProductButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
        ])
    }
    
    //delegates
    
    func didSelectProduct(name: String, imageName: String) {
        
        selectedProductImage.image = UIImage(named: imageName);
        label.text = name
    }
    
    
    // listeners
    
    @objc func incrementButtonTap(){
        
        incrementCont();
    }
    
    @objc func openModal() {
        let modalVC = ModalViewController()
        
        modalVC.delegate = self
        modalVC.modalPresentationStyle = .pageSheet // ou .formSheet, .overCurrentContext
        modalVC.sheetPresentationController?.detents = [.medium()]
        modalVC.sheetPresentationController?.prefersGrabberVisible = true
        present(modalVC, animated: true)
    }


}
