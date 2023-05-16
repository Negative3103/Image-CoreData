//
//  FavouriteCoordinator.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class FavouriteCoordinator: Coordinator {
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = FavouriteViewController()
        vc.tabBarItem = UITabBarItem(title: nil, image: .appImage(.starDefault), selectedImage: .appImage(.staractive))
        vc.tabBarItem.tag = 1
        vc.tabBarItem.setImageOnly()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
