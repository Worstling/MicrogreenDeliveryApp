//
//  TabBarController.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 17.02.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarControllers: [UIViewController]){
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = AppColors.specialBeige
        tabBar.tintColor = AppColors.specialGreen
    }
}
