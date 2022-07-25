import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var slider: UISlider!
    
    private var goal = (0...100).randomElement()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = goal.description
    }

    @IBAction private func judge() {
        let alert: UIAlertController
        if Int(slider.value) == goal {
            alert = UIAlertController(title: "結果", message: "あたり！\nあなたの値: \(Int(slider.value))", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "結果", message: "はずれ！\nあなたの値: \(Int(slider.value))", preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.slider.value = 50
            self.goal = (0...100).randomElement()!
            self.label.text = self.goal.description
        }))
        present(alert, animated: true)
    }
    
}
