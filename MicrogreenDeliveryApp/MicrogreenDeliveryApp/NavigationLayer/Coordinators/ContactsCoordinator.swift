//
//  ContactsCoordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 17.02.2024.
//

import UIKit

class ContactsCoordinator: Coordinator {
    
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .orange
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}

