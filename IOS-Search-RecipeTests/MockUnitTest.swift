//
//  MockUnitTest.swift
//  IOS Task-SoftxpertTests
//
//  Created by Abeer Meckawi on 02/08/2021.
//

import XCTest

@testable import IOS_Task_Softxpert

class MockUnitTest
{
    var isError : Bool = false
    var error : Error?
    
    func loadFood() -> Data {
        // Obtain Reference to Bundlel
        let bundle = Bundle(for: type(of: self))
        // Ask Bundle for URL of Stubl
        let url = bundle.url(forResource:"JsonFileTest", withExtension: "json")
        // Use URL to Create Data Object
        return try! Data(contentsOf: url!)
    }
    
    func request(completion: @escaping (Result<Food>) -> ()) {
       
        let foodJson = loadFood()
        var food : Food?
        do{
         food = try JSONDecoder().decode(Food.self, from: foodJson)
            
        }catch let err{
            error = err
        }
        if error == nil{
            completion(.success(food!))
        }else{
            completion(.failure(error!))
        }
    }
}
