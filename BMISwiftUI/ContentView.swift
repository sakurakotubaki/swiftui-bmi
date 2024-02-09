import SwiftUI

struct ContentView: View {
    
    @State var weight: String = ""
    @State var height: String = ""
    @State var bmi: Double = 0
    @State var classification: String = ""
    
    var body: some View {
        VStack {
            Text("BMI Calculator").font(.largeTitle)
            TextField("Enter weight (in kilograms)", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            TextField("Enter height (in kilograms)", text: $height)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            Button(action: {
                if let weightDouble = Double(self.weight),
                    let heightDouble = Double(self.height),
                    heightDouble != 0 {
                        self.bmi = weightDouble/(heightDouble * heightDouble)
                        
                        if self.bmi < 18.5 {
                            self.classification = "Underweight"
                        }
                        else if bmi < 24.9 {
                            self.classification = "Healthy Weight"
                        }
                        else if bmi < 29.9 {
                            self.classification = "Overweight"
                        }
                        else {
                            self.classification = "Obese"
                        }
                    }
                    else {
                        self.classification = "Invalid input"
                    }
            }) {
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
