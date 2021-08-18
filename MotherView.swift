import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            // 画面遷移を管理
            if viewRouter.currentPage == "HomeView" {
                HomeView()
            } else if viewRouter.currentPage == "QuizView" {
                QuizView()
            } else if viewRouter.currentPage == "ScoreView" {
                ScoreView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
