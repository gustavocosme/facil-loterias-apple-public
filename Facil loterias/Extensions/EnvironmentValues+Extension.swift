//
//  EnvironmentValues+Extension.swift
//  Facil loterias
//
//  Created by Gustavo Cosme on 19/05/23.
//

import SwiftUI

public extension EnvironmentValues {
    static var isPreview: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        #else
        return false
        #endif
    }
}
