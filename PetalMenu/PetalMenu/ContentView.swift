//
//  ContentView.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    let colors = ColorPalette.multicolor
    
    var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [selectedColor.opacity(0.2), 
                     selectedColor.opacity(0.5),
                     selectedColor
                    ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    @State private var selectedColor: Color = .purple
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            
            PetalMenu(colors: colors, selectedColor: $selectedColor)
            
        }
    }
}

#Preview {
    ContentView()
}





