//
//  ContentView.swift
//  Weather-iOS
//
//  Created by PRANTAE-WS-07  on 04/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    
    fileprivate func backgroundColor(topColor: Color, bottomColor: Color) -> some View {
        return LinearGradient(
            colors: [topColor,bottomColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        ZStack {
            if(isNight){
                backgroundColor(topColor: .blue, bottomColor: Color("LightBlue"))
            } else {
                backgroundColor(topColor: .black, bottomColor: .gray)
            }
            VStack {
                Text("Cupertino, CA")
                    .font(.system(
                        size: 32,
                        weight: .medium,
                        design: .default
                    ))
                    .foregroundColor(.white)
                    .padding() 
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "cloud.sun.fill" : "moon.stars.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°C")
                        .font(.system(
                        size: 70,
                        weight: .medium
                        )
                    )
                        .foregroundColor(.white)
                }
                ForecastList()
                    .padding(.top, 100)
                Spacer()
                Button {
                    isNight = !isNight
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ForecastList: View{
    var body: some View {
        HStack (spacing: 25) {
            Forecast(
                day: "TUE",
                icon: "cloud.sun.fill",
                temperature: "74°"
            )
            Forecast(
                day: "WED",
                icon: "sun.max.fill",
                temperature: "70°"
            )
            Forecast(
                day: "THU",
                icon: "wind.snow",
                temperature: "55°"
            )
            Forecast(
                day: "THU",
                icon: "cloud.rain.fill",
                temperature: "60°"
            )
            Forecast(
                day: "THU",
                icon: "moon.circle.fill",
                temperature: "69°"
            )
        }
    }
}

struct Forecast: View{
    var day: String
    var icon: String
    var temperature: String
    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
            Image(systemName: icon)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 40, height: 40)
            Text(temperature)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
