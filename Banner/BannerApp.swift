//
//  BannerApp.swift
//  Banner
//
//  Created by Dallin Jared on 3/24/23.
//

import SwiftUI

@main
struct BannerApp: App {
    @StateObject var bannerService = BannerService()

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView{
                    ContentView()
                }
                if let type = bannerService.bannerType {
                    BannerView(banner: type)
                }
            }
            .environmentObject(bannerService)
        }
    }
}
