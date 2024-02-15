//
//  Coordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 15.02.2024.
//

import UIKit

enum CoordinatorType{
    case menu
    case contacts
    case basket
    case profile
}
protocol CoordinatorProtocol: AnyObject{
    var childCoordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationControll: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
    
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol){
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator}
    }
}


protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol)
}
