//
//  TemporaryScreenCurtain.swift
//  swiftui-temporary-screen-curtain
//
//  Created by Cizzuk on 2026/02/08.
//

#if !canImport(SwiftUI)
#error("TemporaryScreenCurtain requires SwiftUI-compatible platform.")
#else
import SwiftUI
#endif

#if !canImport(UIKit)
#error("TemporaryScreenCurtain requires UIKit-compatible platform.")
#else
import UIKit
#endif

public extension View {
    func temporaryScreenCurtain(
        isPresented: Binding<Bool>,
        uiColor: UIColor = .systemBackground
    ) -> some View {
        self
            .opacity(isPresented.wrappedValue ? 0.0 : 1.0)
            .fullScreenCover(isPresented: isPresented, content: {
                TemporaryScreenCurtain(uiColor: uiColor)
            })
    }
}

public struct TemporaryScreenCurtain: View {
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.dismiss) private var dismiss
    
    var uiColor: UIColor
    
    public init(uiColor: UIColor = .systemBackground) {
        self.uiColor = uiColor
    }
    
    public var body: some View {
        NavigationStack {
            Color(uiColor: uiColor)
                .ignoresSafeArea()
                .accessibilityLabel("Close Curtain")
                .accessibility(addTraits: [.isModal, .isButton])
                .accessibilityAction(.escape) { dismiss() }
                .onTapGesture { dismiss() }
                .onChange(of: scenePhase) {
                    if scenePhase == .inactive { dismiss() }
                }
        }
    }
}
