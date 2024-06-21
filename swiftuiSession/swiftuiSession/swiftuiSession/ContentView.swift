//
//  ContentView.swift
//  swiftuiSession
//
//  Created by Nowen on 2024-06-21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme //Dark || Light mode
    
    @State private var value: String = ""
    @State private var result: Double = 0.0
    
    var body: some View {
        ZStack{
            //Background color
            //            (colorScheme == .dark ? Color.black : Color.white)
            //                       .edgesIgnoringSafeArea(.all)
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Measurement Calculator")
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.top, 40)
                Spacer()
                VStack {
                    TextField("Enter value in cm", text: $value)
                        .padding()
                        .background(Color.clear)
                        .background(colorScheme == .dark ? Color.black : Color.gray.opacity(0.2))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .keyboardType(.decimalPad)
                        .cornerRadius(30)
                }
                .padding()
                .background(Color.clear)
                .cornerRadius(30)
                .padding(.horizontal, 80)
                Spacer()
                Text("Result: \(result)")
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
                HStack{
                    Button(action: calculatorMeter) {
                        Text("CM -> M")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(40)
                            .padding()
                    }
                    .padding()
                    Button(action: calculatorInches) {
                        Text("CM -> INCHES")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(40)
                            .padding()
                    }
                    .padding()
                }
 
            }
        }
    }
    
    //Calculate CM -> M
    func calculatorMeter(){
        if let valueInCm = Double(value) {
            result = valueInCm / 100
        }
    }
    //Calculate CM -> Inches
    func calculatorInches(){
        if let valueInCm = Double(value) {
            result = valueInCm * 0.393701
        }
    }
    
}

#Preview {
    ContentView()
}
