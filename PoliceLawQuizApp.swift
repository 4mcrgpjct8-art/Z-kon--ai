
import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let paragraph: String
    let optionA: String
    let optionB: String
    let correctAnswer: String
}

struct ContentView: View {
    @State private var currentIndex = 0
    @State private var score = 0
    @State private var selectedAnswer: String? = nil

    let questions: [Question] = [
        Question(
            paragraph: "§ 1 ods. 2",
            optionA: "Činnosť Policajného zboru kontroluje Národná rada Slovenskej republiky a vláda Slovenskej republiky.",
            optionB: "Činnosť Policajného zboru kontroluje Ministerstvo spravodlivosti Slovenskej republiky.",
            correctAnswer: "A"
        ),
        Question(
            paragraph: "§ 2 ods. 1",
            optionA: "Policajný zbor plní úlohy vo veciach vnútorného poriadku a bezpečnosti.",
            optionB: "Policajný zbor plní úlohy len v oblasti súdnictva.",
            correctAnswer: "A"
        )
    ]

    var body: some View {
        let question = questions[currentIndex]

        VStack(spacing: 25) {
            Text(question.paragraph)
                .font(.largeTitle)
                .bold()

            Text("Skóre: \(score)")
                .font(.headline)

            Button(action: {
                checkAnswer("A")
            }) {
                Text(question.optionA)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(12)
            }

            Button(action: {
                checkAnswer("B")
            }) {
                Text(question.optionB)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(12)
            }

            Spacer()
        }
        .padding()
    }

    func checkAnswer(_ answer: String) {
        let question = questions[currentIndex]

        if answer == question.correctAnswer {
            score += 1
        }

        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }
}

@main
struct PoliceLawQuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
