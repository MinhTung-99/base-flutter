//
//  Browser.swift
//  Runner
//
//  Created by Tung on 09/05/2023.
//

import Foundation

class Browser {
    func openBrowser() {
        let url = URL(string:"https://www.google.com/")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(url)
        }
    }
}
