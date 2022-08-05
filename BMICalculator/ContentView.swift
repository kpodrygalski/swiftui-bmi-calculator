//
//  ContentView.swift
//  BMICalculator
//
//  Created by Konrad Podrygalski on 02/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CalculatorView()
        }.navigationTitle("BMI Calculator")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
