//
//  shapeStyle.swift
//  movieDB
//
//  Created by Yazan Ghunaim on 10/7/23.
//

import Foundation
import SwiftUI

struct DynamicColorShapeStyle: ShapeStyle {
    let light: Color
    let dark: Color

    func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        if environment.colorScheme == .light {
            return light
        } else {
            return dark
        }
    }
}

extension ShapeStyle where Self == DynamicColorShapeStyle {
    static func `dynamic`(light: Color, dark: Color) -> DynamicColorShapeStyle {
        DynamicColorShapeStyle(light: light, dark: dark)
    }
}
