//
//  CineBrowseApp.swift
//  CineBrowse
//
//  Created by Sajan Lawrence on 18/10/25.
//

import SwiftUI

@main
struct CineBrowseApp: App {
    @State private var showLoadingView: Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                HomeView()
                if showLoadingView{
                    LoadingView(showLoadingView: $showLoadingView)
                }
                
            }
        }
    }
}
