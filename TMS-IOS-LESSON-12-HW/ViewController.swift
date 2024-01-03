import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var label = UIConstructor.createLabel(text: "test", font: .italicSystemFont(ofSize: 35), tag: nil)
    var button = UIConstructor.createButton(title: "Next", cornerRadius: 8, font: .italicSystemFont(ofSize: 20), backgroundColor: .systemYellow, tag: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupLabel()
        setupButton()
    }

    func setupLabel() {
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }

    func setupButton() {
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        
        button.addAction(UIAction(handler: { _ in
            let vc = SecondViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
        
    }

}

extension ViewController: InputsDelegate {
    func recieveString(text: String) {
        print("text", text)
        self.label.text = text
    }
}
