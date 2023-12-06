//
//  ContentView.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var menuOpen = false
    @State private var colorTheme: Color = .blue
    
    var gradient: LinearGradient {
        LinearGradient(
            colors: [colorTheme.opacity(0.2), colorTheme.opacity(0.5), colorTheme],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var body: some View {
        ZStack {
            gradient
                .ignoresSafeArea()
            
            VStack {
                PetalMenu(menuOpen: $menuOpen, colorTheme: $colorTheme)
                
                SelectAThemeButton(menuOpen: $menuOpen, colorTheme: colorTheme)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
