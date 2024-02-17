//
//  ProfileCoordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 17.02.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .systemGray
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

