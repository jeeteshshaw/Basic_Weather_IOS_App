//
//  ContentView.swift
//  WeatherApp
//
//  Created by Jeetesh Shaw on 03/03/24.
//

import SwiftUI

struct CommentSt: Hashable, Codable{
    let id: Int
    let postId: Int
    let userId: Int
    let comment: String
}

struct ContentView: View {
    @State private var isNight = false
//    @Published var comment =
    func UpdateWeatherData(){
      
        guard let url = URL(string: "https://api.tomorrow.io/v4/weather/forecast?location=new%20york&apikey=jYsWOKxiHJkitmDmePK9iSUYloZR3Gq9") else {
                    print("Invalid URL")
                    return
                }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error: Invalid response")
                return
            }
            
            guard let data = data else {
                print("Error: No data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response: \(json)")
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
        
    }
    var body: some View {
        ZStack{
            
            BackgroundGradient(isNight: $isNight) // $ used if child struct using binding var
            VStack{

                CityNameView(name: "Noida, India")

                CurrentWeatherView(
                    currentImageName: isNight ? "moon.stars.fill":"cloud.sun.fill",
                    temp: 23
                )
                
                HStack(alignment: .center, spacing: 30){
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temp: 24
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.sun.rain.fill",
                        temp: 20
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "cloud.bolt.rain.fill",
                        temp: 18
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sun.max.fill",
                        temp: 28
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "snow",
                        temp: -2
                    )
                }
                Spacer()
                
                Button{
                    print("change")
                    isNight.toggle()
//                    UpdateWeatherData()
                }label: {
                    WeatherButton(
                        title: "Change Day Time",
                        backgroundColor: .white,
                        foreGroundColor: .blue
                    )
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundGradient: View {
    @Binding var isNight:Bool
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [isNight ? .black : .blue, isNight ? .gray: Color("lightBlue")]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityNameView: View{
    var name:String
    
    var body: some View{
        Text("Noida, India")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
//                    .padding(.bottom, 200)
//                the modifier sequence matters
//                    .background(Color.red)
//                    .frame(width: 200, height: 200)
//                    .background(Color.red)
        
       
    }
}


struct CurrentWeatherView: View{
    var currentImageName: String
    var temp: Int
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: currentImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .serif))
                .foregroundColor(.white)
            
        }.padding(.bottom, 100)
    }
}

