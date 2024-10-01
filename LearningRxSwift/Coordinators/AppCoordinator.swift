//
//  AppCoordinator.swift
//  LearningRxSwift
//
//  Created by Tran Van Quang on 16/01/2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = {
        let navigationVC = UINavigationController()
        return navigationVC
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let baseCoordinator = BaseCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(baseCoordinator)
        baseCoordinator.start()
        
        self.window.rootViewController = self.navigationController
        self.window.makeKeyAndVisible()
    }
    
}
