//
//  TabbarController.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Attributes
    internal let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    internal var favouriteCoordinator = FavouriteCoordinator(navigationController: UINavigationController())
    
    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

// MARK: - Other funcs
extension TabBarController {
    private func createControllers() {
        searchCoordinator.start()
        favouriteCoordinator.start()
        
        viewControllers = [searchCoordinator.navigationController,
                           favouriteCoordinator.navigationController]
    }
    
    private func appearanceSettings() {
        tabBar.setup()
    }
}
