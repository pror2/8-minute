//
//  NoStorybord2_9_minute_ver_2_0_UITestsLaunchTests.swift
//  NoStorybord2(9 minute.ver.2.0)UITests
//
//  Created by Admin2 on 14.01.2022.
//

import XCTest

class NoStorybord2_9_minute_ver_2_0_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
