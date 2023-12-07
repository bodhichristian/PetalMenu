//
//  ColorPalette.swift
//  PetalMenu
//
//  Created by christian on 12/6/23.
//

import Foundation
import SwiftUI

struct ColorPalette {
    static let multicolor: [Color] = [.orange, .yellow, .green, .cyan, .blue, .purple, .pink, .red]
    
    static let cool: [Color] = [.blue, .cyan, .teal, .mint, .green, .purple, .indigo]
    
    static let warm: [Color] = [.red, .white, .orange, .white, .yellow, .white, .pink, .white]
    
    static let monochromatic: [Color] = [
        Color(hue: 0, saturation: 0, brightness: 1),
        Color(hue: 0, saturation: 0, brightness: 0.8),
        Color(hue: 0, saturation: 0, brightness: 0.7),
        Color(hue: 0, saturation: 0, brightness: 0.5),
        Color(hue: 0, saturation: 0, brightness: 0.4),
        Color(hue: 0, saturation: 0, brightness: 0.3),
        Color(hue: 0, saturation: 0, brightness: 0.2),
        Color(hue: 0, saturation: 0, brightness: 0.1),
    ]
    
}
