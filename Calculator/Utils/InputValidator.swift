//
//  InputValidator.swift
//  Calculator
//
//  Created by martin.przystalka on 13/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import Foundation

final class InputValidator {
    private let operators = ["*", "/", "+", "-"]
    private let brackets = ["(", ")"]

    func shouldInputValue(_ value: String, currentText: String) -> Bool {
        if value == "(" {
            return shouldInputOpenBracket(currentText)
        }
        if value == ")" {
            return shouldInputClosedBracket(currentText)
        }

        //always allow if value is not a operator
        guard operators.contains(value) else {
            return true
        }
        //dont input operator if there is no number in front of it
        guard currentText.count > 0 else {
            return false
        }
        guard let last = currentText.last else {
            return true
        }
        //If operator is last value, do not insert operator
        if operators.contains("\(last)") {
            return false
        }
        //If open bracket is last value, do not insert operator
        if "(" == last {
            return false
        }
        return true
    }

    private func shouldInputOpenBracket(_ currentText: String) -> Bool {
        guard let last = currentText.last else {
            return true
        }
        if last == "(" {
            return false
        }
        return true
    }

    private func shouldInputClosedBracket(_ currentText: String) -> Bool {
        guard let last = currentText.last else {
            return false
        }
        let openBracketCount = currentText.components(separatedBy: "(").count - 1
        let closedBracketCount = currentText.components(separatedBy: ")").count - 1

        if openBracketCount <= closedBracketCount {
            return false
        }
        if last == "(" || last == ")" || operators.contains("\(last)") {
            return false
        }

        return true
    }

}
