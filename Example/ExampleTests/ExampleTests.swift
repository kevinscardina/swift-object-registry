//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Kevin Scardina on 6/21/19.
//  Copyright © 2019 DaVita. All rights reserved.
//

import XCTest
import ObjectRegistry

@testable import Example

class ExampleTests: XCTestCase {
    var viewController: ViewController!
    override func setUp() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateInitialViewController() as? ViewController else {
            XCTFail("unable to get view controller")
        }
        self.viewController = viewController
    }

    func testViewControllerNoSessionManager() {
        ObjectRegistry.unregister(SessionManager.self)

        XCTAssertFalse(viewController.isLoggedIn)
    }

    func testViewControllerNoAccess() {
        ObjectRegistry.register(SessionManager(firstName: "foo",
                                               lastName: "bar",
                                               token: "not correct",
                                               refreshToken: "not correct"))

        XCTAssertFalse(viewController.isLoggedIn)
    }

    func testViewControllerAccessRefreshToken() {
        ObjectRegistry.register(SessionManager(firstName: "foo",
                                               lastName: "bar",
                                               token: "not correct",
                                               refreshToken: "refresh"))

        XCTAssertTrue(viewController.isLoggedIn)
    }

    func testViewControllerAccessToken() {
        ObjectRegistry.register(SessionManager(firstName: "foo",
                                               lastName: "bar",
                                               token: "token",
                                               refreshToken: "not correct"))

        XCTAssertTrue(viewController.isLoggedIn)
    }
}
