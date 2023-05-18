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
    var favouriteDataProvider = FavouriteDataProvider()
    var database = DatabaseHandler()
    var images: [Images]? {
        didSet {
            guard let images = images else { return }
            favouriteDataProvider.viewController = self
            favouriteDataProvider.collectionView = view().collectionView
            favouriteDataProvider.items = images
        }
    }
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        images?.removeAll()
        images = database.retrieveData()
    }
}

//MARK: - Other funcs
extension FavouriteViewController {
    private func appearanceSettings() {
        title = "Favorites"
        images = database.retrieveData()
    }
    
    func deleteImage(image: Images) {
        showAlertWithTwoButtons(title: "Are you sure want delete this image in favurite list?", message: "", firstButtonText: "Yes", firstButtonAction: {
            self.database.deleteImage(image: image)
            self.images?.removeAll()
            self.images = self.database.retrieveData()
        } , secondButtonText: "No")
    }
}
