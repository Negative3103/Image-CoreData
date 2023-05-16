//
//  UITabBarItem.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//

import UIKit

extension UITabBarItem {
   func setImageOnly(){
       imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
       setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .selected)
       setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear], for: .normal)
   }
}
