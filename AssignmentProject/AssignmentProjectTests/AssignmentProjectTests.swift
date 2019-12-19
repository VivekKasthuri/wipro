//
//  AssignmentProjectTests.swift
//  AssignmentProjectTests
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import XCTest
@testable import AssignmentProject

class AssignmentProjectTests: XCTestCase {
    var list: Welcome?
 
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let count = 2
        NetworkRequest.sharedInstance.getTestList(url: url) { (result) in
            self.list = result
            XCTAssertEqual(count, self.list?.rows.count)
            XCTAssertTrue(count != self.list?.rows.count, "The objects are not be equal");
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testResponse() {
        
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        NetworkRequest.sharedInstance.getTestList(url: url) { (result) in
                self.list = result
                XCTAssertTrue((self.list?.rows.count)! > 0, "It has values");
                XCTAssertFalse(self.list?.rows.count == 0)
               }
    }
}
