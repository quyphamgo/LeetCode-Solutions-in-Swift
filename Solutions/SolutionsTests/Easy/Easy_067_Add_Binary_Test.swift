//
//  Easy_067_Add_Binary_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/16/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Easy_067_Add_Binary_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [String] = ["11", "1"]
        let expected: String = "100"
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["10", "1"]
        let expected: String = "11"
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["10", "11"]
        let expected: String = "101"
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["0", "1"]
        let expected: String = "1"
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: String) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Easy_067_Add_Binary.addBinary(a: input[0], b: input[1]);
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
