//
//  CustomTabBarController.swift
//  MyPets
//
//  Created by Дмитрий Ахмеров on 15.10.2020.
//

import UIKit

class CustomTabBarController: UITabBarController {
    let mainVC = UINavigationController(rootViewController: MainViewController())
    let petVC = UINavigationController(rootViewController: PetViewController())
    let locationVC = UINavigationController(rootViewController: LocationViewController())
    let profileVC = UINavigationController(rootViewController: ProfileViewController())
    
    var controllers: [UIViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        
        controllers = [mainVC, petVC, locationVC, profileVC]
        
        tabBar.backgroundColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = UIColor.CustomColor.purple
    }
    
    func setupItems() {
        mainVC.tabBarItem.title = "Главная"
        mainVC.tabBarItem.image = UIImage(named: "generalIcon")
        
        petVC.tabBarItem.title = "Питомцы"
        petVC.tabBarItem.image = UIImage(named: "petIcon")
        
        locationVC.tabBarItem.title = "Места"
        locationVC.tabBarItem.image = UIImage(named: "locationIcon")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(named: "profileIcon")
    }
}