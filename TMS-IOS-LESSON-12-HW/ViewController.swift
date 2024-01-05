import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var label = UIConstructor.createLabel(text: "", font: .systemFont(ofSize: 20), tag: nil)
    var button = UIConstructor.createButton(title: "Next", cornerRadius: 8, font: .italicSystemFont(ofSize: 20), backgroundColor: .systemYellow, tag: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        view.layoutIfNeeded()
        view.layoutSubviews()
        setupLabel()
        setupButton()
    }

    func setupLabel() {
        view.addSubview(label)
        label.numberOfLines = 3
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(200)
            make.height.equalTo(100)
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
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
        
    }

}

extension ViewController: InputsDelegate {
    func recieveString(text: String) {
        self.label.text = text
    }
}
