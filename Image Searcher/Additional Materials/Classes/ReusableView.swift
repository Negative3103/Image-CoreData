//
//  ReusableView.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
