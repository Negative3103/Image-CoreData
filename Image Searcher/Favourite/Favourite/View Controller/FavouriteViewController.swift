//
//  FavouriteViewController.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//


import UIKit

final class FavouriteViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = FavouriteView
    
    //MARK: - Services
    internal var coordinator: FavouriteCoordinator?
    
    //MARK: - Attributes
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Other funcs
extension FavouriteViewController {
    private func appearanceSettings() {
        
    }
}
