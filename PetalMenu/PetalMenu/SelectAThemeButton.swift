//
//  SelectAThemeButton.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct SelectAThemeButton: View {
    let colorTheme: Color
    
    var gradient: LinearGradient {
        LinearGradient(colors: [colorTheme.opacity(0.6), colorTheme ], startPoint: .top, endPoint: .bottom)
    }
    
    @Binding var menuOpen: Bool
    
    var body: some View {
            ZStack {
                // Button base layer
                Capsule()
                    .foregroundStyle(gradient)
                    .frame(width: 200, height: 44)
                    .shadow(color: menuOpen ? .black : .black.opacity(0.2), radius: menuOpen ? 2 : 10, y: menuOpen ? 0 : 7)
                
                // Button Text
                Text("Select a theme")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                
            }
        
            // Open menu
            .onTapGesture {
                withAnimation(.bouncy){
                    menuOpen.toggle()
                }
            }
        
    }
}

#Preview {
    SelectAThemeButton(colorTheme: .blue, menuOpen: .constant(false))
}
