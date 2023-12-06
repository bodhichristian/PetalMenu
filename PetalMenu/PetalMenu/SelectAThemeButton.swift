//
//  SelectAThemeButton.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import SwiftUI

struct SelectAThemeButton: View {
    @Binding var menuOpen: Bool
    let colorTheme: Color
    
    var gradient: LinearGradient {
        LinearGradient(colors: [colorTheme.opacity(0.6), colorTheme ], startPoint: .top, endPoint: .bottom)
    }
    var body: some View {
            ZStack {
                Capsule()
                    .foregroundStyle(gradient)
                    .frame(width: 200, height: 44)
                    .shadow(color: menuOpen ? .black : .black.opacity(0.2), radius: menuOpen ? 2 : 10, y: menuOpen ? 0 : 7)
                
                Text("Select a theme")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                
            }
            .onTapGesture {
                withAnimation(.bouncy){
                    menuOpen.toggle()
                }
            }
        
    }
}

#Preview {
    SelectAThemeButton(menuOpen: .constant(false), colorTheme: .blue)
}
