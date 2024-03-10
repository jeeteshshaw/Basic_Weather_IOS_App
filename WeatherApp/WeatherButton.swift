//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Jeetesh Shaw on 04/03/24.
//

import SwiftUI

struct WeatherButton: View{
    var title: String
    var backgroundColor: Color
    var foreGroundColor: Color
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(foreGroundColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10.0)
    }
}

