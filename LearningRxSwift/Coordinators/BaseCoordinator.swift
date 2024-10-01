//
//  BaseCoordinator.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 16/01/2024.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get set }

    func start()
}

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }

        self.navigationController.pushViewController(vc, animated: false)
    }
}
