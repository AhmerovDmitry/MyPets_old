//
//  AuthorizationViewController.swift
//  MyPets
//
//  Created by Дмитрий Ахмеров on 09.10.2020.
//

import UIKit

class AuthorizationViewController: UIViewController {
    private let mainStackView = UIStackView()
    private let logoLabel = UIImageView()
    private let textLabel = UIImageView()
    
    private let logInButton = UIButton(type: .system)
    
    private let socialNetworksLabel = UILabel()
    private let textLine = UILabel()
    
    private let socialIconsStackView = UIStackView()
    private let facebookButton = UIButton(type: .custom)
    private let okButton = UIButton(type: .custom)
    private let vkButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
}

extension AuthorizationViewController: AuthorizationViewControllerProtocol {
    func setup() {
        setupConstraint()
        setupViewsAndLabels()
    }
    
    func setupConstraint() {
        //MARK: - Logo Constraints
        view.addSubview(mainStackView)
        socialNetworksLabel.addSubview(textLine)
        
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 202).isActive = true
        //mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 205).isActive = true
        
        [logoLabel,
         textLabel,
         logInButton,
         textLine,
         socialNetworksLabel,
         socialIconsStackView].forEach({ mainStackView.addArrangedSubview($0) })
        
        logoLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoLabel.heightAnchor.constraint(equalToConstant: 124).isActive = true
        
        textLabel.widthAnchor.constraint(equalToConstant: 141).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
        logInButton.widthAnchor.constraint(equalToConstant: 311).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        socialNetworksLabel.widthAnchor.constraint(equalToConstant: 213).isActive = true
        socialNetworksLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        textLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        textLine.widthAnchor.constraint(equalToConstant: 343).isActive = true
        textLine.centerYAnchor.constraint(equalTo: socialNetworksLabel.centerYAnchor).isActive = true
        
        socialIconsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        [facebookButton,
         okButton,
         vkButton].forEach({ icon in
            socialIconsStackView.addArrangedSubview(icon)
            
            icon.widthAnchor.constraint(equalToConstant: 44).isActive = true
            icon.heightAnchor.constraint(equalToConstant: 44).isActive = true
         })
    }
    
    func setupViewsAndLabels() {
        [mainStackView,
         logoLabel,
         textLabel,
         logInButton,
         socialNetworksLabel,
         textLine,
         socialIconsStackView,
         facebookButton,
         okButton,
         vkButton].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
         })
        //MARK: - Main UIStackView Settings
        mainStackView.alignment = .center
        mainStackView.spacing = 15
        mainStackView.axis = .vertical
        mainStackView.setCustomSpacing(22, after: textLabel)
        mainStackView.setCustomSpacing(77, after: logInButton)
        
        //MARK: - Logo Settings
        logoLabel.image = UIImage(named: "mainIcon")
        textLabel.image = UIImage(named: "myPetsText")
        
        //MARK: - Authorization Settings
        logInButton.setTitle("Войти", for: .normal)
        logInButton.backgroundColor = UIColor.CustomColor.purple
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 25
        
        //MARK: - Social Networks Settings
        textLine.backgroundColor = .black
        socialNetworksLabel.text = "Войти через социальные сети"
        socialNetworksLabel.font = UIFont.systemFont(ofSize: 14)
        socialNetworksLabel.textAlignment = .center
        socialNetworksLabel.backgroundColor = .white
        socialNetworksLabel.textColor = .black
        
        //MARK: - Social UIStackView Settings
        socialIconsStackView.alignment = .center
        socialIconsStackView.spacing = 16
        socialIconsStackView.axis = .horizontal
        
        //MARK: - Social Networ Icon Settings
        facebookButton.setImage(UIImage(named: "facebookIcon"), for: .normal)
        okButton.setImage(UIImage(named: "okIcon"), for: .normal)
        vkButton.setImage(UIImage(named: "vkIcon"), for: .normal)
        
        logInButton.addTarget(self, action: #selector(pushOnboard), for: .touchUpInside)
    }
}
