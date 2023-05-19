//
//  Image_SearcherUITestsLaunchTests.swift
//  Image SearcherUITests
//
//  Created by Хасан Давронбеков on 18/05/23.
//

import XCTest

@testable import Image_Searcher

final class Image_SearcherUITestsLaunchTests: XCTestCase {
    
    //MARK: - Attributes
    let app = XCUIApplication()

    //MARK: - Lifecycles
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunch() throws {
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "SearchView"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
