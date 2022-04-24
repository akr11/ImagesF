//
//  ImagesFTests.swift
//  ImagesFTests
//
//  Created by andriy kruglyanko on 16.04.2022.
//

import XCTest
@testable import ImagesF

class ImagesFTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    var expectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetAllEventsMethod() {
        let expectation: XCTestExpectation = self.expectation(description: "getEvents")
        
        
            NetworkService.sharedService.getAllEvents(success: { (responseData) in
                
                expectation.fulfill()
                XCTAssertNotNil(responseData, "Data is nil")
                
                do {
                    let json = try JSONSerialization.jsonObject(with: responseData, options: []) as! [String: Any?]
                    let events = json["all_images"] as! [[String: Any?]]
                    let firstEvent = events.first!
                    let firstEventName = firstEvent["name"] as! String
                    
                    XCTAssertTrue(firstEventName == "What's New in App Store Connect")
                    
                } catch let error {
                    print(error)
                }
            }) { (error) in
                expectation.fulfill()
                XCTFail((error?.localizedDescription)!)
            }
        
    }

}
