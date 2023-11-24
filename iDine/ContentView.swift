//
//  ContentView.swift
//  iDine
//
//  Created by Seven on 18.11.2023.
//

import SwiftUI
import SwiftData
import Combine

struct ContentView: View {
    @State private var name = "Seven"
    @State private var isNight = false
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [ isNight ? Color.black : Color.blue, Color.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing : 10){
                Text("California City")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                VStack{
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("77°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)
                }
                HStack{
                    VStack{
                        Text("Hello world")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .cornerRadius(7)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
