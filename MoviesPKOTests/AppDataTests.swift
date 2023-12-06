//
//  MoviesPKOTests.swift
//  MoviesPKOTests
//
//  Created by Michał Krupa on 04/12/2023.
//

import XCTest
@testable import MoviesPKO

final class AppDataTests: XCTestCase {

    private let sut = AppData()
    private let testId: Int64 = 0
    
    override func setUp() {
        super.setUp()
        sut.clearAppData()
    }

    func testAssertNil() throws {
        let someInt: Int? = sut.get(.some)
        XCTAssertNil(someInt)
    }

    func testAddAndRetrive() throws {
        sut.set(1, for: .some)
        let someInt: Int? = sut.get(.some)
        XCTAssertNotNil(someInt)
    }
    
    func testFailToRetrive() throws {
        sut.set("Some", for: .some)
        let someInt: Int? = sut.get(.some)
        XCTAssertNil(someInt)
    }
    
    func testOverWrite() throws {
        sut.set("Some", for: .some)
        XCTAssertEqual("Some", sut.get(.some))
        
        sut.set(1.0, for: .some)
        XCTAssertEqual(1.0, sut.get(.some))
        
        sut.set([0.1], for: .some)
        XCTAssertEqual([0.1], sut.get(.some))
    }

    func testAddAndRemove() throws {
        sut.set(1, for: .some)
        let someInt: Int? = sut.get(.some)
        XCTAssertNotNil(someInt)
        XCTAssertEqual(someInt, 1)
        
        sut.set(nil, for: .some)
        let otherInt: Int? = sut.get(.some)
        XCTAssertNil(otherInt)
    }
    
    func testNoMovieInFavorites() throws {
        XCTAssertFalse(sut.isMovieFavorite(testId))
    }
    
    func testAddToFavorite() throws {
        sut.addToFavorite(true, movieId: testId)
        XCTAssertTrue(sut.isMovieFavorite(testId))
    }
    
    func testAddAndRemoveFromFavorite() throws {
        sut.addToFavorite(true, movieId: testId)
        XCTAssertTrue(sut.isMovieFavorite(testId))
        
        sut.addToFavorite(false, movieId: testId)
        XCTAssertFalse(sut.isMovieFavorite(testId))
    }
}
