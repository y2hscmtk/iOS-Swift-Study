//
//  UMC_Mission_Week9_Drug_InfoUITestsLaunchTests.swift
//  UMC-Mission-Week9-Drug-InfoUITests
//
//  Created by Choi76 on 2023/12/08.
//

import XCTest

final class UMC_Mission_Week9_Drug_InfoUITestsLaunchTests: XCTestCase {

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
