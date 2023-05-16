//
//  UINavigationBar.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

extension UINavigationBar {
    
    func setup() {
        tintColor = UIColor.white
        titleTextAttributes = [.foregroundColor: UIColor.white]
        largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    func clear() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
    }
    
    func reset() {
        shadowImage = nil
        setBackgroundImage(nil, for: .default)
    }
}
