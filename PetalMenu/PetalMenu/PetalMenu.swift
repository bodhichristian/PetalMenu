//
//  PetalMenu.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct PetalMenu: View {
    let colors: [Color] = [.orange, .yellow, .green, .cyan, .blue, .purple, .pink, .red]
    
    // Calculate degrees to offset petals based on
    // index of color in colors.
    var degreesOffset: Double {
        360.0 / Double(colors.count)
    }
    
    @Binding var menuOpen: Bool
    @Binding var colorTheme: Color
    
    var body: some View {
        GeometryReader { geo in
            
            // Base layer
            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .shadow(radius: menuOpen ? 30 : /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
                .frame(width: menuOpen ? geo.size.width * 0.9 : geo.size.width * 0.4 , height: geo.size.width * 0.9)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                .offset(y: -3)
            
            
            // Petals
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Capsule()
                        .foregroundStyle(
                            LinearGradient(
                                colors: [color, color, color.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    
                        // Capsule height bound to menuOpen state
                        // Resembles a circle when menuOpen == false
                        .frame(
                            width: geo.size.width * 0.25,
                            height: menuOpen
                            ? geo.size.width  * 0.40
                            : geo.size.width * 0.25)
                    
                        // Offset capsules when menuOpen == true
                        .offset(y: menuOpen ? -75 : 0)
                    
                        // Add shadow when menuOpen == true
                        .shadow(
                            color: menuOpen
                            ? .black.opacity(0.4)
                            : .clear,
                            radius: 5,
                            y: 12
                        )
                    
                        // Rotate capsule in relationship to its color's offset
                        .rotationEffect(
                            .degrees(menuOpen
                                     ? (Double(colors.firstIndex(of: color)!) * degreesOffset)
                                     : 0 )
                        )
                    
                        // Select a new colorTheme
                        .onTapGesture {
                            withAnimation(.bouncy){
                                colorTheme = color
                                menuOpen.toggle()
                            }
                        }
                }
            }
            // Center ZStack within Geometry Reader
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
            
            // Present current colorTheme when menuOpen == false
            if !menuOpen {
                Circle()
                    .frame(width: 120)
                    .foregroundStyle(menuOpen ? .clear : colorTheme)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2 - 3)
                
            }
        }
    }
}

#Preview {
    PetalMenu(menuOpen: .constant(false), colorTheme: .constant(.blue))
}
