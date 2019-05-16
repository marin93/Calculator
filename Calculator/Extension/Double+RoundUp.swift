//
//  Double+RoundUp.swift
//  Calculator
//
//  Created by martin.przystalka on 16/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import Foundation

extension Double {
    func roundUpToString() -> String {
        let naturalNumber = Int(self)
        if Double(naturalNumber) == self {
            return "\(naturalNumber)"
        }
        return "\(self)"
    }
}
