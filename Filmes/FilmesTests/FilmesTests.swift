//
//  FilmesTests.swift
//  FilmesTests
//
//  Created by Leticia Sousa Siqueira on 18/01/21.
//

import XCTest
@testable import Filmes

class FilmesTests: XCTestCase {

    var vc: ViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        vc = ViewController()
        vc.viewDidLoad()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
