import Foundation

// 以下の変数が変更されると画面が更新される
class ViewRouter: ObservableObject {
    @Published var currentPage: String = "HomeView"         // ユーザから見える現在の画面
    @Published var selectionDifficulty: String = "quizEasy" // 問題の難易度
    @Published var correctAnswer: Int = 0                   // 正解数を格納
    @Published var questions: Int = 0                       // 問題数を格納
}
