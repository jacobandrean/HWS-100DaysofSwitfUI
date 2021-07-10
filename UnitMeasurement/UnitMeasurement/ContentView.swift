//
//  ContentView.swift
//  UnitMeasurement
//
//  Created by Jacob Andrean on 25/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = "0"
    @State private var unitName = "Temperature"
    @State private var inputTemperature = UnitTemperature.celsius//"Celcius"
    @State private var inputLength = "meters"
    @State private var inputTime = "seconds"
    @State private var inputVolume = "milliliters"
    @State private var outputTemperature = UnitTemperature.celsius//"Celcius"
    @State private var outputLength = "meters"
    @State private var outputTime = "seconds"
    @State private var outputVolume = "milliliters"
    let units = ["Temperature", "Length conversion", "Times conversion", "Volume conversion"]
//    let temperatures = ["Celcius", "Fahrenheit", "Kelvin"]
    let temperatures = [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
    let lengths = ["meters", "kilometers", "feet", "yards", "miles"]
    let times = ["seconds", "minutes", "hours", "days"]
    let volumes = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var outputValue: Double {
        switch unitName {
        case "Temperature":
            switch (inputTemperature, outputTemperature) {
            case (.celsius, .fahrenheit):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.celsius).converted(to: UnitTemperature.fahrenheit)
                return convertedTemp.value
            case (.celsius, .kelvin):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.celsius).converted(to: UnitTemperature.kelvin)
                return convertedTemp.value
            case (.fahrenheit, .celsius):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit).converted(to: UnitTemperature.celsius)
                return convertedTemp.value
            case (.fahrenheit, .kelvin):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit).converted(to: UnitTemperature.kelvin)
                return convertedTemp.value
            case (.kelvin, .celsius):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.kelvin).converted(to: UnitTemperature.celsius)
                return convertedTemp.value
            case (.kelvin, .fahrenheit):
                let convertedTemp = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.kelvin).converted(to: UnitTemperature.fahrenheit)
                return convertedTemp.value
            default:
                return Double(inputValue) ?? 0
            }
            
        case "Length conversion":
            return 3
        case "Times conversion":
            return 4
        case "Volume conversion":
            return 5
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose your unit", selection: $unitName) {
                        ForEach(units, id: \.self) { unit in
                            Text("\(unit)")
                        }
                    }
                }
                
                Section(header: Text("Input Unit")) {
                    TextField("Input Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                    
                    switch unitName {
                    case "Temperature":
                        Picker("", selection: $inputTemperature) {
                            ForEach(temperatures, id: \.self) { temp in
                                Text("\(temp.symbol)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Length conversion":
                        Picker("", selection: $inputLength) {
                            ForEach(lengths, id: \.self) { leng in
                                Text("\(leng)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Times conversion":
                        Picker("", selection: $inputTime) {
                            ForEach(times, id: \.self) { tim in
                                Text("\(tim)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Volume conversion":
                        Picker("", selection: $inputVolume) {
                            ForEach(volumes, id: \.self) { vol in
                                Text("\(vol)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    default:
                        Text("")
                    }
                }
                
                Section(header: Text("Output Unit")) {
                    switch unitName {
                    case "Temperature":
                        Picker("", selection: $outputTemperature) {
                            ForEach(temperatures, id: \.self) { temp in
                                Text("\(temp.symbol)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Length conversion":
                        Picker("", selection: $outputLength) {
                            ForEach(lengths, id: \.self) { leng in
                                Text("\(leng)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Times conversion":
                        Picker("", selection: $outputTime) {
                            ForEach(times, id: \.self) { tim in
                                Text("\(tim)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    case "Volume conversion":
                        Picker("", selection: $outputVolume) {
                            ForEach(volumes, id: \.self) { vol in
                                Text("\(vol)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    default:
                        Text("")
                    }
                    
                    Text("\(outputValue, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Unit Measurement")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
