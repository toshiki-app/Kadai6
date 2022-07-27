import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var slider: UISlider!
    
    private var goal = Int.random(in: 1...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = goal.description
    }

    @IBAction private func judge() {
        let firstLine: String
        if Int(slider.value) == goal {
            firstLine = "あたり！"
        } else {
            firstLine = "はずれ！"
        }
        let alert = UIAlertController(title: "結果", message: "\(firstLine)\nあなたの値: \(Int(slider.value))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.slider.value = 50
            self.goal = Int.random(in: 1...100)
            self.label.text = self.goal.description
        }))
        present(alert, animated: true)
    }
    
}
