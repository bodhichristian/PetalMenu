//
//  PetalMenu.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct PetalMenu: View {
    let colors: [Color] = [.orange, .yellow, .green, .cyan, .blue, .purple, .pink, .red]
    
    var degreesOffset: Double {
        360.0 / Double(colors.count)
    }
    
    @Binding var menuOpen: Bool
    @Binding var colorTheme: Color
    
    var body: some View {
        GeometryReader { geo in
            Circle()
                .foregroundStyle(.ultraThinMaterial)
                .shadow(radius: menuOpen ? 30 : /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
                .frame(width: menuOpen ? geo.size.width * 0.9 : geo.size.width * 0.4 , height: geo.size.width * 0.9)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
                .offset(y: -3)
            
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Capsule()
                        .frame(
                            width: geo.size.width * 0.25,
                            height: menuOpen
                            ? geo.size.width  * 0.40
                            : geo.size.width * 0.25)
                    
                        .foregroundStyle(LinearGradient(colors: [color, color, color.opacity(0.7)], startPoint: .top, endPoint: .bottom))
                        .offset(y: menuOpen ? -75 : 0)
                        .shadow(
                            color: menuOpen
                            ? .black.opacity(0.4)
                            : .clear,
                            radius: 5,
                            y: 12
                        )
                        .rotationEffect(
                            .degrees(menuOpen 
                                     ? (Double(colors.firstIndex(of: color)!) * degreesOffset)
                                     : 0 )
                        )
                        .onTapGesture {
                            withAnimation(.bouncy){
                                colorTheme = color
                                menuOpen.toggle()
                            }
                        }
                }
            }
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
            
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
