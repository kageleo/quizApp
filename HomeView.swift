import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Spacer()
            Text("QUIZ")
                .font(.system(size: 60, weight: .bold, design: .default))
            Spacer()
            HStack {
                Button(action: {
                    self.viewRouter.selectionDifficulty = "quizDifficult"
                    csvArray = loadCSV(fileName: self.viewRouter.selectionDifficulty)
                }) {
                    if self.viewRouter.selectionDifficulty == "quizDifficult" {
                        ButtonDesign(text: "難しい", foreColor: .green, backColor: .white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.green, lineWidth: 4)
                            )
                    } else {
                        ButtonDesign(text: "難しい")
                    }
                }
                Button(action: {
                    self.viewRouter.selectionDifficulty = "quizNomal"
                    csvArray = loadCSV(fileName: self.viewRouter.selectionDifficulty)
                }) {
                    if self.viewRouter.selectionDifficulty == "quizNomal" {
                        ButtonDesign(text: "普通", foreColor: .green, backColor: .white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.green, lineWidth: 4)
                            )
                    } else {
                        ButtonDesign(text: "普通")
                    }
                }
                Button(action: {
                    self.viewRouter.selectionDifficulty = "quizEasy"
                    csvArray = loadCSV(fileName: self.viewRouter.selectionDifficulty)
                }) {
                    if self.viewRouter.selectionDifficulty == "quizEasy" {
                        ButtonDesign(text: "易しい", foreColor: .green, backColor: .white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.green, lineWidth: 4)
                            )
                    } else {
                        ButtonDesign(text: "易しい")
                    }
                }
            }
            .padding()
            Button(action: {
                self.viewRouter.currentPage = "QuizView"
                self.viewRouter.questions = 3
            }) {
                ButtonDesign(text: "3問", width: 315)
            }
            
            Button(action: {
                self.viewRouter.currentPage = "QuizView"
                self.viewRouter.questions = 5
            }) {
                ButtonDesign(text: "5問", width: 315)
            }
            
            Button(action: {
                self.viewRouter.currentPage = "QuizView"
                self.viewRouter.questions = 10
            }) {
                ButtonDesign(text: "10問", width: 315)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewRouter())
    }
}


struct ButtonDesign: View {
    
    var text: String
    var foreColor: Color = .white
    var width: CGFloat = 100
    var hight: CGFloat = 60
    var backColor: Color = .green
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(foreColor)
            .padding()
            .frame(width: width, height: hight)
            .background(backColor)
            .cornerRadius(15.0)
    }
}
