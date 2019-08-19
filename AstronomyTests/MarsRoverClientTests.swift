//
//  MarsRoverClientTests.swift
//  AstronomyTests
//
//  Created by Sean Acres on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {

    func testFetchingRover() {
        var mockLoader = MockLoader()
        mockLoader.data = validRoverJSON
        
        let marsRoverClient = MarsRoverClient(dataLoader: mockLoader)
        let fetchRoverExpectation = expectation(description: "waiting for rover results")
        
        marsRoverClient.fetchMarsRover(named: "Curiosity") { (rover, error) in
            fetchRoverExpectation.fulfill()
            XCTAssertNotNil(rover)
        }
        
        waitForExpectations(timeout: 10)
    }
    
    func testFetchingRoverPhotos() {
        var mockLoader = MockLoader()
        mockLoader.data = validSol1JSON
        let solDescription = SolDescription(sol: 1, totalPhotos: 10, cameras: [""])
        let rover = MarsRover(name: "Curiousity", launchDate: Date(), landingDate: Date(), status: .active, maxSol: 10, maxDate: Date(), numberOfPhotos: 10, solDescriptions: [solDescription])
        
        let marsRoverClient = MarsRoverClient(dataLoader: mockLoader)
        let fetchPhotosExpectation = expectation(description: "waiting for rover photos")
        
        marsRoverClient.fetchPhotos(from: rover, onSol: 1) { (photos, error) in
            fetchPhotosExpectation.fulfill()
            XCTAssertTrue(photos!.count > 1)
        }
        
        waitForExpectations(timeout: 10)
        
    }

}
