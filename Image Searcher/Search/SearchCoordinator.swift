//
//  SearchCoordinator.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage.appImage(.search), tag: 0)
        vc.tabBarItem.setImageOnly()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
