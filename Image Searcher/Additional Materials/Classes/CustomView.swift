//
//  CustomView.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

class CustomView: UIView {

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundColor()
    }
    
    // MARK: - UI Setup
    private func setupBackgroundColor() {
        backgroundColor = UIColor.appColor(.mainBackground)
    }
    
}
