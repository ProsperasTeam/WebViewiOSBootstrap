//
//  Extensions.swift
//  Prosperas-sdk
//
//  Created by Endrit on 9.8.23.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value:self, comment: self)
    }
}
