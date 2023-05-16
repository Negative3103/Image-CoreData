//
//  FavouriteView.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class FavouriteView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: FavouriteCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FavouriteCollectionViewCell.defaultReuseIdentifier)
        }
    }
    
}
