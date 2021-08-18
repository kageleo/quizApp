import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Spacer()
            Text("正解数")
                .font(.system(size: 40, weight: .bold, design: .default))
                .padding()
            Text("\(self.viewRouter.correctAnswer) / \(self.viewRouter.questions + 1)")
                .font(.system(size: 80, weight: .bold, design: .default))
            Spacer()
            Button(action: {
                self.viewRouter.currentPage = "HomeView"
                self.viewRouter.correctAnswer = 0
                csvArray = loadCSV(fileName: self.viewRouter.selectionDifficulty)
            }) {
                ButtonDesign(text: "Topに戻る", width: 170)
            }
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(ViewRouter())
    }
}
