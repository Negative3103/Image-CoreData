//
//  SearchView.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class SearchView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var button: Button!
    @IBOutlet weak var imgNameTF: UITextField! {
        didSet {
            imgNameTF.bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
            
        }
    }
    @IBOutlet weak var imgView: UIImageView!
}
