import SwiftUI

struct ContentView: View {
    @State private var marksInput: String = ""
    @State private var grade: String = ""
    @FocusState private var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Student Grade Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Enter marks", text: $marksInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .focused($isInputFocused)

            Button(action: calculateGrade) {
                Text("Calculate Grade")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Text(grade)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding()
        .onTapGesture {
            isInputFocused = false // Dismiss the keyboard
        }
    }

    // Logic to calculate the grade
    private func calculateGrade() {
        guard let marks = Int(marksInput) else {
            grade = "Invalid input. Please enter a number."
            return
        }

        switch marks {
        case 80..<101:
            grade = "Grade: A+"
        case 70..<80:
            grade = "Grade: A"
        case 60..<70:
            grade = "Grade: A-"
        case 50..<60:
            grade = "Grade: B+"
        case 40..<50:
            grade = "Grade: B"
        case 0..<40:
            grade = "Grade: F"
        default:
            grade = "Invalid marks. Enter a number between 0 and 100."
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
