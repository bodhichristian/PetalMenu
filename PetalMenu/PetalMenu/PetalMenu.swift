//
//  PetalMenu.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct PetalMenu: View {
    let colors: [Color]
    
    // Get petal rotation angle
    var degreesOffset: Double {
        360.0 / Double(colors.count)
    }
    
    @Binding var selectedColor: Color
    @State private var menuOpen: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // Tap background to close menu
                Rectangle()
                    .foregroundStyle(.white.opacity(0.1))
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.bouncy){
                            menuOpen = false
                        }
                    }
                
                // MARK: Accessibility - Close Menu
                    .accessibilityLabel("Cancel selection.")
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHidden(!menuOpen)
                
                // Base layer
                Circle()
                    .foregroundStyle(.thinMaterial)
                    .shadow(radius: menuOpen ? 30 : /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
                    .frame(
                        width: menuOpen
                        ? geo.size.width * 0.9
                        : geo.size.width * 0.4,
                        height: geo.size.width * 0.9
                    )
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    .offset(y: -3)
                
                // MARK: Accessibility - Decorative Elememt
                    .accessibilityHidden(true)
                
                // Petals
                ForEach(Array(colors.enumerated()), id: \.offset) { index, color in
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
                            .offset(y: menuOpen ? -geo.size.width * 0.2 : 0)
                        
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
                                         ? (Double(index) * degreesOffset)
                                         : 0 )
                            )
                        
                        // Update selected color
                            .onTapGesture {
                                withAnimation(.bouncy){
                                    selectedColor = color
                                    menuOpen = false
                                }
                            }
                        
                        // MARK: Accessibility - Option Labels
                            .accessibilityLabel("Option 1: \(color.description)")
                            .accessibilityAddTraits(.isButton)
                            .accessibilityHidden(!menuOpen)
                    }
                }
                
                // Present selectedColor when menuOpen == false
                if !menuOpen {
                    Circle()
                        .frame(width: geo.size.width * 0.3)
                        .foregroundStyle(menuOpen ? .clear : selectedColor)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2 - 3)
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                menuOpen = true
                            }
                        }
                    
                    // MARK: Accessibility - Open Menu
                        .accessibilityLabel("Select a Color")
                        .accessibilityAddTraits(.isButton)
                        .accessibilityHidden(menuOpen)
                }
                
            }
            
            // Center in GeometryReader
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
            
        }
    }
}

#Preview {
    PetalMenu(colors: ColorPalette.warm, selectedColor: .constant(.white))
}
