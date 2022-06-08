//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Adgebenro on 5/31/22.
//

import SwiftUI

struct ContentView: View {
    @State private var Input = 100.0
    @State private var InputUnit = "Meters"
    @State private var OutputUnit = "Kilometers"
    @FocusState private var inputIsFocused: Bool
    
    let units = ["Feet", "Kilometers" , "Meters", "Miles", "Yards"]
    
    var result: String {
        let inputToMetersMultiplier: Double
        let metersToOutputMultiplier: Double
        
        switch InputUnit {
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "kiloMeters":
            inputToMetersMultiplier = 1000
            case "Miles":
            inputToMetersMultiplier = 1609.34
        case "Yards":
            inputToMetersMultiplier = 0.9144
        default:
            inputToMetersMultiplier = 1.0
        }
        switch OutputUnit {
        case "Feet":
            metersToOutputMultiplier = 3.28084
        case "kiloMeters":
            metersToOutputMultiplier = 0.001
            case "Miles":
            metersToOutputMultiplier = 0.000621371
        case "Yards":
            metersToOutputMultiplier = 1.09361
        default:
            metersToOutputMultiplier = 1.0
        }
        let inputInMeters = Input * inputToMetersMultiplier
        let output = inputInMeters * metersToOutputMultiplier
        
        
        let outputString = output.formatted()
        return "\(outputString) \(OutputUnit.lowercased())"
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $Input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text ("Enter Number")
                }
                Section {
                    Picker("Convert from", selection: $InputUnit) {
                        ForEach(units , id:\.self) {
                            Text($0)
                        }
                    }
                    
                    
                    Picker("Convert to", selection: $OutputUnit) {
                        ForEach(units , id:\.self) {
                            Text($0)
                            
                        }
                    }
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
                
                
            }.navigationTitle("Unit Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            inputIsFocused = false
                        }
                    }
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

