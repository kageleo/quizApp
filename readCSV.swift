import Foundation

var csvArray: [[String]] = loadCSV(fileName: "quizEasy")


func loadCSV(fileName:String) -> [[String]] {
    var csvArray: [String] = []
    var dataArray: [[String]] = [[]]
    let csvBundle = Bundle.main.path(forResource: fileName, ofType:"csv")!
    do{
        let csvData = try String(contentsOfFile: csvBundle,encoding:String.Encoding.utf8 )
        let csvLines = csvData.components(separatedBy: .newlines)
        csvArray = csvLines
        // 最後にできる余分な配列を削除
        csvArray.removeLast()
        for i in 0..<csvArray.count {
            dataArray.append(csvArray[i].components(separatedBy: ","))
        }
        // 初期値の空配列を削除
        dataArray.removeFirst()
    }catch{
        print("エラー")
    }

    dataArray.shuffle()
    return dataArray
}
