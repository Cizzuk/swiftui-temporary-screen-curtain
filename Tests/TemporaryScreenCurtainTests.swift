//
//  TemporaryScreenCurtainTests.swift
//  swiftui-temporary-screen-curtain
//
//  Created by Cizzuk on 2026/02/08.
//

import SwiftUI
import UIKit
import Testing

@testable import TemporaryScreenCurtain

@Suite("TemporaryScreenCurtain Tests")
@MainActor
struct TemporaryScreenCurtainTests {

    @Test("Initializes with default color")
    func curtainDefaultColor() {
        let curtain = TemporaryScreenCurtain()
        #expect(curtain.uiColor == .systemBackground)
    }

    @Test("Initializes with custom color")
    func curtainCustomColor() {
        let curtain = TemporaryScreenCurtain(uiColor: .blue)
        #expect(curtain.uiColor == .blue)
    }
}
