//
//  String.swift
//  Image Searcher
//
//  Created by Хасан Давронбеков on 16/05/23.
//
import UIKit

extension String {
    func checkFileLink() -> URL {
        guard let fileLink = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let fileURL = URL(string: fileLink) else { return URL(fileURLWithPath: "") }
        return fileURL
    }
}
