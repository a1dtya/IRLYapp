


import SwiftUI

struct Default: View {
    // State variable to track if image change should occur
    @State private var shouldChangeImage = false
    
    // Array to store questions and correct options
    let questions = ["I went skinny dipping", "Win an argument", "Attempted DIY home"]
    let correctOptions = ["Yes", "No", "Yes"]
    
    // State variable to track current question index
    @State private var currentQuestionIndex = 0
    
    // State variable to track marked answers
    @State private var markedAnswers = Array(repeating: "", count: 3)
    
    // State variables to store button images
    @State private var leftButtonImage = "Yes"
    @State private var rightButtonImage = "No"
    
    // State variable to store whether answers are correct
    @State private var isAnswerCorrectList: [Bool] = []
    
    // State variable to control navigation to ListView
    @State private var showListView = false
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 358, height: 358)
            .cornerRadius(15.47, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
            .shadow(color: Color.black.opacity(0.21), radius: 8, x: 0, y: 4)
            .opacity(1)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // Start with the first question on appearance
                askQuestion(index: 0)
            }
            .overlay {
                VStack {
                    Image("HS-NHIE")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 358, height: 130)
                        .cornerRadius(15.47, corners: [.topLeft, .topRight])
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 340, height: 200.02)
                        .padding(10)
                        .overlay {
                            VStack {
                                Text(questions[currentQuestionIndex])
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(width: 343, height: 10.18)
                                    .padding(.vertical, 15)
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        // Action for Yes button
                                        answerQuestion(option: "Yes")
                                    }) {
                                        Image(leftButtonImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 138.44, height: 110.02)
                                            .padding(.horizontal,10)
                                    }
                                    
                                    Button(action: {
                                        // Action for No button
                                        answerQuestion(option: "No")
                                    }) {
                                        Image(rightButtonImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 138.44, height: 110.02)
                                            .padding(.horizontal,10)
                                    }
                                    Spacer()
                                }
                                .padding()
                                
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .fill(Color(red: 213/255, green: 197/255, blue: 244/255))
                                        .frame(width: 120, height: 4)
                                        .cornerRadius(30)
                                    
                                    Rectangle()
                                        .fill(Color(red: 119/255, green: 67/255, blue: 219/255))  // Color #7743DB
                                        .frame(width: CGFloat(currentQuestionIndex + 1) / CGFloat(questions.count) * 120, height: 4)
                                        .cornerRadius(30)
                                        .animation(.easeInOut(duration: 0.5))
                                }
                                .padding(.vertical, 10)
                                
                                Spacer()
                            }
                            .padding()
                        }
                }
            }
            .fullScreenCover(isPresented: $showListView) {
                ListView() // Navigate to ListView
            }
    }
    
    //  to ask a question
    private func askQuestion(index: Int) {
        currentQuestionIndex = index
        shouldChangeImage = false
        leftButtonImage = "Yes"
        rightButtonImage = "No"
    }
    
    // Function to answer a question
    private func answerQuestion(option: String) {
        markedAnswers[currentQuestionIndex] = option
        let correctOption = correctOptions[currentQuestionIndex]
        
        if option == "Yes" {
            if option == correctOption {
                leftButtonImage = "YesBoth"
                rightButtonImage = "No"
            } else {
                leftButtonImage = "YesUser"
                rightButtonImage = "NoDate"
            }
        } else {
            if option == correctOption {
                rightButtonImage = "NoBoth"
                leftButtonImage = "Yes"
            } else {
                rightButtonImage = "NoUser"
                leftButtonImage = "YesDate"
            }
        }
        
        // Record whether the answer is correct
        isAnswerCorrectList.append(option == correctOption)
        
        // Update UI
        shouldChangeImage = true
        
        // Reset the images after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if currentQuestionIndex == 2 { // Check if it's the third question
                self.showListView = true // Navigate to ListView
            } else {
                askQuestion(index: (currentQuestionIndex + 1) % questions.count)
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct MatchScoreCalculator {
    static func calculateMatchScore(correctMarkedAnswers: [Bool]) -> Int {
        let totalCorrectMarkedAnswers = correctMarkedAnswers.filter { $0 }.count
        return Int((Double(totalCorrectMarkedAnswers) / 3.0) * 100)
    }
}

struct Default_Previews: PreviewProvider {
    static var previews: some View {
        Default()
    }
}
