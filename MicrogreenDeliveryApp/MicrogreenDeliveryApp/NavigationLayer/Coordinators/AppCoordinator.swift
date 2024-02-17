//
//  AppCoordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 15.02.2024.
//

import UIKit

class AppCoordinator: Coordinator  {
    override func start() {
        //showOnboardingFlow()
        showMainFlow()
    }
   
    override func finish() {
        print("AppCoordinator finish")
    }
}
 
// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let menuNavigationController = UINavigationController()
        let menuCoordinator = MenuCoordinator(type: .menu, navigationController: menuNavigationController)
        menuNavigationController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage.init(systemName: "figure.walk"), tag: 0)
        menuCoordinator.finishDelegate = self
        menuCoordinator.start()
        
        let contactsNavigationController = UINavigationController()
        let contactsCoordinator = ContactsCoordinator(type: .contacts, navigationController: contactsNavigationController)
        contactsNavigationController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage.init(systemName: "figure.walk"), tag: 1)
        contactsCoordinator.finishDelegate = self
        contactsCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        let cartCoordinator = CartCoordinator(type: .cart, navigationController: cartNavigationController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage.init(systemName: "figure.walk"), tag: 2)
        cartCoordinator.finishDelegate = self
        cartCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "figure.walk"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(menuCoordinator)
        addChildCoordinator(contactsCoordinator)
        addChildCoordinator(cartCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [menuNavigationController, contactsNavigationController, cartNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatro)
        
        switch childCoordinatro.type {
        case .app:
              return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

