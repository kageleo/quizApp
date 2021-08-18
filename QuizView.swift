import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State var counter: Int = 0
    @State var judgeImageView: String = "correct"
    @State var opacity = 0.0
    @State var uicolors: [Color] = [.green, .green, .green, .green]
    
    func answerAction(answer: String) {
        if csvArray[counter][1] == answer {
            self.viewRouter.correctAnswer += 1
            judgeImageView = "correct"
        } else {
            judgeImageView = "incorrect"
        }
        opacity = 0.9
        uicolors = [.blue, .blue, .blue, .blue]
        uicolors[Int(csvArray[counter][1])!-1] = .red
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("第 \(counter+1) 問")
                    .font(.system(size: 30, weight: .bold, design: .default))
                Text(csvArray[counter][0])
                    .frame(height: 220)
                    .lineLimit(20)
                    .padding()
                VStack(spacing: 15) {
                    Button(action: {
                        answerAction(answer: "1")
                    }) {
                        ButtonDesign(text: csvArray[counter][2], width: 315, backColor: uicolors[0])
                    }
                    Button(action: {
                        answerAction(answer: "2")
                    }) {
                        ButtonDesign(text: csvArray[counter][3], width: 315, backColor: uicolors[1])
                    }
                    Button(action: {
                        answerAction(answer: "3")
                    }) {
                        ButtonDesign(text: csvArray[counter][4], width: 315, backColor: uicolors[2])
                    }
                    Button(action: {
                        answerAction(answer: "4")
                    }) {
                        ButtonDesign(text: csvArray[counter][5], width: 315, backColor: uicolors[3])
                    }
                }
                .padding(.top)
                Spacer()
            }
            if opacity == 0.9 {
                ZStack {
                    Image(judgeImageView)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .opacity(opacity)
                }
                .contentShape(RoundedRectangle(cornerRadius: 20))
                .onTapGesture {
                    opacity = 0.0
                    uicolors = [.green, .green, .green, .green]
                    if counter < self.viewRouter.questions - 1 {
                        counter += 1
                        self.viewRouter.currentPage = "QuizView"
                    } else {
                        self.viewRouter.currentPage = "ScoreView"
                    }
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView().environmentObject(ViewRouter())
    }
}



