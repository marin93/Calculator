//
//  MathProvider.swift
//  Calculator
//
//  Created by martin.przystalka on 11/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import Foundation

//    swiftlint:disable identifier_name
final class MathProvider {

    func calculate(expression: String) -> String {
        let expres = stringToArray(text: expression)

        let one = resolveBrackets(operations: expres)
        let two = doCalculations(operations: one, option: 1)
        let three = doCalculations(operations: two, option: 2)
        let resultString = three.first ?? "0"
        return resultString.roundUp()
    }

    func multiply(_ a: Double, _ b: Double) -> String {
        return "\(a * b)".roundUp()
    }

    func divide(_ a: Double, _ b: Double) -> String {
        return "\(a / b)".roundUp()
    }

    func subtract(_ a: Double, _ b: Double) -> String {
        return "\(a - b)".roundUp()
    }

    func add(_ a: Double, _ b: Double) -> String {
        return "\(a + b)".roundUp()
    }

    private func resolveBrackets(operations: [String]) -> [String] {
        var expres = operations
        guard let open = operations.firstIndex(of: "("), let close = operations.firstIndex(of: ")") else {
            return operations
        }
        expres.remove(at: close)
        expres.remove(at: open)
        let brackets = expres[open...close - 2]
        let result = resolveExpression(operations: Array(brackets))
        expres.removeSubrange(open...close - 2)
        expres.insert(result, at: open)
        return resolveBrackets(operations: expres)
    }

    private func resolveExpression(operations: [String]) -> String {
        let two = doCalculations(operations: operations, option: 1)
        let three = doCalculations(operations: two, option: 2)
        return three.first ?? ""
    }

    private func doCalculations(operations: [String], option: Int) -> [String] {
        var expres = operations
        var step = 0
        var firstNumber = ""
        var secondNumber = ""
        var operation = ""
        let options = [1: "*/", 2: "-+"]

        for element in expres {
            if Double(element) != nil {
                if firstNumber.count == 0 {
                    firstNumber = element
                } else {
                    secondNumber = element
                }
                step += 1
                continue
            }
            if secondNumber.count > 0 && firstNumber.count > 0 {
                let result = perform(operation: operation, firstNumber, secondNumber)
                expres.remove(at: step - 1)
                expres.remove(at: step - 2)
                expres.remove(at: step - 3)
                expres.insert(result, at: step - 3)
                return doCalculations(operations: expres, option: option)
            } else if let first = element.first {
                if options[option]?.contains(first) ?? false {
                    operation = element
                } else {
                    firstNumber = ""
                }
            }
            step += 1
        }
        if secondNumber.count > 0 && firstNumber.count > 0 {
            step + 1 == expres.count ? step += 1 : ()
            let result = perform(operation: operation, firstNumber, secondNumber)
            expres.remove(at: step - 1)
            expres.remove(at: step - 2)
            expres.remove(at: step - 3)
            expres.insert(result, at: step - 3)
        }
        return expres
    }

    private func perform(operation: String, _ a: String, _ b: String) -> String {
        guard let a = Double(a), let b = Double(b) else {
            return "0"
        }
        switch operation {
        case "*": return multiply(a, b)
        case "/": return divide(a, b)
        case "-": return subtract(a, b)
        case "+": return add(a, b)
        default: return "0"
        }
    }

    private func stringToArray(text: String) -> [String] {
        var number = ""
        var expres: [String] = []

        for char in text {
            if Double(String(char)) != nil {
                number += String(char)
                continue
            }

            if number.count > 0 {
                expres.append(String(number))
                number = ""
            }
            if char == Character("(")
                && !"-+*/".contains(expres.last?.last ?? Character("0"))
                && expres.count > 0 {
                expres.append("*")
            }
            if char == Character("-") && expres.count == 0 {
                number += String(char)
            } else {
                expres.append(String(char))
            }
        }
        if number.count > 0 {
            expres.append(number)
        }
        return expres
    }
}
