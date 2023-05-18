//
//  SearchViewController.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class SearchViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = SearchView
    
    //MARK: - Services
    var coordinator: SearchCoordinator?
    
    //MARK: - Attributes
    var database = DatabaseHandler()
    var images = [Images]()
    
    //MARK: - Actions
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let name = view().imgNameTF.text , !name.isEmpty else {
            showAlert(title: "Error!", message: "Fill this field.")
            return
        }
        view().button.setImage(.appImage(.favoriteCircle), for: .normal)
        searchImage(name: name)
        view().button.isHidden = false
    }
    
    @IBAction func addToFavouriteAction(_ sender: UIButton) {
        if images.count > 4 {
            showAlertWithTwoButtons(title: "Storage is Full!", message: "Do you want delete last image and save new?", firstButtonText: "Yes", firstButtonAction: {
                self.removeAndSaveImage()
            }, secondButtonText: "No")
        } else {
            saveImage()
        }
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.images = database.retrieveData()
    }
}

//MARK: - Other funcs
extension SearchViewController {
    private func appearanceSettings() {
        title = "Search"
        self.images = database.retrieveData()
    }
    
    private func searchImage(name: String) {
        let widht = view().imgView.frame.width.description
        let height = view().imgView.frame.height.description
        let task = URLSession.shared.dataTask(with: "https://dummyimage.com/\(widht)x\(height)&text=\(name)".checkFileLink()) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.view().imgView.image = image
                }
            }
        }
        task.resume()
    }
    
    private func removeAndSaveImage() {
        database.deleteImage(image: images.removeFirst())
        saveImage()
    }
    
    private func saveImage() {
        database.image = view().imgView.image
        database.title = view().imgNameTF.text
        database.saveImage()
        view().button.setImage(.appImage(.activeFavoriteCircle), for: .normal)
    }
}
