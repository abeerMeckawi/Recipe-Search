//
//  NetworkTest.swift
//  IOS Task-SoftxpertTests
//
//  Created by Abeer Meckawi on 02/08/2021.
//

import XCTest


@testable import IOS_Task_Softxpert

class NetworkTest: XCTestCase {
    
    var networkLayer : NetworkLayer!
    var mockNetworkLayer : MockUnitTest!
    
    override func setUpWithError() throws {
        networkLayer = NetworkLayer()
        mockNetworkLayer = MockUnitTest()
    }
    
    func testNetwork() throws {
        let expectationObj = expectation(description: "Waiting response")
        networkLayer.request(SearchRouterNetwork.getRecipe(query: ["coffee"],health: ""), decodeToType: Food.self){result in
            expectationObj.fulfill()
            switch result {
            case .success(let food):do {
                XCTAssertNotEqual(food.count,0)
            }
            case .failure(_): do {
                XCTFail()
            }
            
            }
        }
        waitForExpectations(timeout: 10)
    }
    
    func testMock(){
        
        mockNetworkLayer.request(){
            result in
            switch result {
            case .success(let food):do {
                XCTAssertEqual(food.count,2)
                XCTAssertEqual(food.from, 1)
                XCTAssertEqual(food.hits?.count,2)
            }
            case .failure(_): do {
                XCTFail()
            }
            
            }
        }
    }
    
    override func tearDownWithError() throws {
        networkLayer = nil
        mockNetworkLayer = nil
    }
    
}
