//
//  CalculatorView.swift
//  BMICalculator
//
//  Created by Konrad Podrygalski on 02/08/2022.
//

import SwiftUI

struct CalculatorView: View {
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var height: String = ""
    @State var weight: String = ""
    @State private var result: Double = 0
    
    var heightNumberFormatted: Double {
        return (Double(height) ?? 0)
    }
    
    var weightNumberFormatted: Double {
        return (Double(weight) ?? 0)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            formView
        }
        .navigationTitle("BMI Calculator")
        .alert(alertTitle, isPresented: $showAlert) {
        } message: {
            Text(alertMessage)
        }

        //.alert(isPresented: $showAlert, content: getAlert) // THIS WILL BE DEPRECATED IN iOS 16
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalculatorView()
                .colorScheme(.light)
            
            CalculatorView()
                .colorScheme(.dark)
        }
        
    }
}

extension CalculatorView {
    
    private var formView: some View {
        Form {
            Section(header: Text("Height (M)")) {
                TextField("Enter your height in (M)...", text: $height)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Weight (KG)")) {
                TextField("Enter your weight in (KG)...", text: $weight)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Result")) {
                Text(String(format: "%.2f", result))
            }
            
            Button {
                self.result = calculateBMI(height: heightNumberFormatted, weight: weightNumberFormatted)
            } label: {
                Text("Calculate")
            }
            
        }
    }
    
    
    private func calculateBMI(height: Double, weight: Double) -> Double {
        if validateTextFields() {
            return weight / pow(height, 2)
        }else {
            return 0.0
        }
    }
    
    private func validateTextFields() -> Bool {
        if height.isEmpty || weight.isEmpty {
            // Setup alert
            alertTitle = "Upssss 😞"
            alertMessage = "One of the field is not filled up! Please enter the correct data."
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
//    THIS WILL BE DEPRECATED IN iOS 16
//    private func getAlert() -> Alert {
//        return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
//    }
    
}
