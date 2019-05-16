//
//  String+RoundUp.swift
//  Calculator
//
//  Created by martin.przystalka on 16/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import Foundation

extension String {
    func roundUp() -> String {
        if let decimalNumber = Double(self) {
            return decimalNumber.roundUpToString()
        }
        return self
    }
}
