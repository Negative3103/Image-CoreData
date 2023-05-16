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
    internal var coordinator: SearchCoordinator?
    
    //MARK: - Attributes
    
    //MARK: - Actions
    @IBAction func searchButtonAction(_ sender: UIButton) {
        guard let name = view().imgNameTF.text , !name.isEmpty else {
            showAlert(title: "Error!", message: "Fill this field.")
            return
        }
        searchImage(name: name)
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Other funcs
extension SearchViewController {
    private func appearanceSettings() {
        
    }
    
    private func searchImage(name: String) {
        guard let url = URL(string: "https://dummyimage.com/500x500&text=\(name)") else { return }
            
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.view().imgView.image = image
                }
            }
        }
            
        task.resume()
    }
}
