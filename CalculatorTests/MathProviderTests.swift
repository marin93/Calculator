//
//  MathProviderTests.swift
//  CalculatorTests
//
//  Created by martin.przystalka on 12/05/2019.
//  Copyright © 2019 Martin Przystalka. All rights reserved.
//

import XCTest
@testable import Calculator

final class MathProviderTests: XCTestCase {
    let mathProvider = MathProvider()

    func testMultiply() {
        let result = mathProvider.multiply(2, 4)
        XCTAssertEqual(result, "8")
    }

    func testDivide() {
        let result = mathProvider.divide(8, 4)
        XCTAssertEqual(result, "2")
    }

    func testAdd() {
        let result = mathProvider.add(8, 4)
        XCTAssertEqual(result, "12")
    }

    func testSubtract() {
        let result = mathProvider.subtract(33, 4)
        XCTAssertEqual(result, "29")
    }

    func testCalculateAdd() {
        let result = mathProvider.calculate(expression: "55+10")
        XCTAssertEqual(result, "65")
    }

    func testCalculateDivide() {
        let result = mathProvider.calculate(expression: "50/10")
        XCTAssertEqual(result, "5")
    }

    func testCalculateSubtract() {
        let result = mathProvider.calculate(expression: "50-10")
        XCTAssertEqual(result, "40")
    }

    func testCalculateMultiply() {
        let result = mathProvider.calculate(expression: "50*10")
        XCTAssertEqual(result, "500")
    }

    func testCalculateFewOperations() {
        let result = mathProvider.calculate(expression: "50*10+30/3")
        XCTAssertEqual(result, "510")
    }

    func testCalculateFewOperationsOne() {
        let result = mathProvider.calculate(expression: "22-20*5")
        XCTAssertEqual(result, "-78")
    }

    func testCalculateFewOperationsTwo() {
        let result = mathProvider.calculate(expression: "50-10+30-3")
        XCTAssertEqual(result, "67")
    }

    func testCalculateFewOperationsThree() {
        let result = mathProvider.calculate(expression: "2*8/4")
        XCTAssertEqual(result, "4")
    }

    func testCalculateFewOperationsFour() {
        let result = mathProvider.calculate(expression: "3*8-8*2")
        XCTAssertEqual(result, "8")
    }

    func testCalculateFewOperationsFive() {
        let result = mathProvider.calculate(expression: "3*8-8*2+20+20")
        XCTAssertEqual(result, "48")
    }

    func testCalculateFewOperationsSix() {
        let result = mathProvider.calculate(expression: "20/5-3*8-8*2+20+20")
        XCTAssertEqual(result, "4")
    }

    func testCalculateFewOperationsSeven() {
        let result = mathProvider.calculate(expression: "55*9*9-3-9*5-88+9*444+30/15")
        XCTAssertEqual(result, "8317")
    }

    func testCalculateWithBrackets() {
        let result = mathProvider.calculate(expression: "(2+2)")
        XCTAssertEqual(result, "4")
    }

    func testCalculateWithBracketsTwo() {
        let result = mathProvider.calculate(expression: "(2+2)-(6+6)")
        XCTAssertEqual(result, "-8")
    }

    func testCalculateWithBracketsThree() {
        let result = mathProvider.calculate(expression: "(55/5+66)*(9/3*9+66+3-99)")
        XCTAssertEqual(result, "-231")
    }

    func testCalculateWithBracketsFour() {
        let result = mathProvider.calculate(expression: "(55/5+66)*(9/3*9+66+3-99)-(88*5)*6*(33-6)")
        XCTAssertEqual(result, "-71511")
    }

    func testCalculateWithBracketsFive() {
        let result = mathProvider.calculate(expression: "4(3+2)")
        XCTAssertEqual(result, "20")
    }

    func testCalculateWithBracketsSix() {
        let result = mathProvider.calculate(expression: "4(3+2)*(15-13)")
        XCTAssertEqual(result, "40")
    }

    func testCalculateWithBracketsSeven() {
        let result = mathProvider.calculate(expression: "2(5+5)(4-2)-30")
        XCTAssertEqual(result, "10")
    }

    func testCalculateWithBracketsEight() {
        let result = mathProvider.calculate(expression: "4(3+2)*2(15-13)")
        XCTAssertEqual(result, "80")
    }

    func testCalculateStartingFromMinus() {
        let result = mathProvider.calculate(expression: "-3(5-3*4)")
        XCTAssertEqual(result, "21")
    }

    func testCalculateComplexDividing() {
        let result = mathProvider.calculate(expression: "58/99/26*9")
        XCTAssertEqual(result, "0.20279720279720279")
    }

    func testCalculateComplexDividingTwo() {
        let result = mathProvider.calculate(expression: "33/9/6/8*5/222*1000/9")
        XCTAssertEqual(result, "0.19116338560783003")
    }

}
