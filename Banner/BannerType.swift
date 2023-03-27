//
//  BannerType.swift
//  Banner
//
//  Created by Dallin Jared on 3/24/23.
//

import Foundation
import SwiftUI

enum BannerType {
    var id: Self { self }
    case success(message: String, isPersistent: Bool = false)
    case error(message: String, isPersistent: Bool = false)
    case warning(message: String, isPersistent: Bool = false)
    
    var backgroundColor: Color {
        switch self {
        case .success: return Color.green
        case .warning: return Color.yellow
        case .error: return Color.red
        }
    }
    
    var imageName: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
    
    var message: String {
        switch self { case let .success(message, _), let .warning(message, _), let .error(message, _): return message }
    }
    
    var isPersistent: Bool {
        switch self { case let .success(_, isPersistent), let .warning(_, isPersistent), let .error(_, isPersistent): return isPersistent }
    }
}
