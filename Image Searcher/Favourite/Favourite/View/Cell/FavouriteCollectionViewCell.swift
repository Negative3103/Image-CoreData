//
//  FavouriteCollectionViewCell.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

final class FavouriteCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //MARK: - Attributes
    var item: Images? {
        didSet {
            guard let item = item else { return }
            
            if let data = item.images {
                imgView.image = UIImage(data: data)
            }
            
            if let title = item.title {
                titleLabel.text = title
            } else {
                titleLabel.text = "" 
            }
        }
    }
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 10
        self.imgView.layer.cornerRadius = 10
    }
}
