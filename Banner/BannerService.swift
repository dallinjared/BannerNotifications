//
//  BannerService.swift
//  Banner
//
//  Created by Dallin Jared on 3/24/23.
//

import Foundation
import SwiftUI

class BannerService: ObservableObject{
    @Published var isAnimating = false
    @Published var dragOffset = CGSize.zero
    @Published var bannerType: BannerType? {
        didSet {
            withAnimation {
                switch bannerType {
                case .none:
                    isAnimating = false
                case .some:
                    isAnimating = true
                }
            }
        }
    }
    
    func setBanner(banner: BannerType) {
        self.bannerType = banner
    }

    func removeBanner() {
        withAnimation {
            self.bannerType = nil
            self.isAnimating = false
            self.dragOffset = .zero
        }
    }
}


