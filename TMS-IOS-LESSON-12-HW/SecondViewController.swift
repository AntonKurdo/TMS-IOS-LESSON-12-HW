import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    var delegate: InputsDelegate?
    
    var button = UIConstructor.createButton(title: "Approve", cornerRadius: 8, font: .italicSystemFont(ofSize: 20), backgroundColor: .purple, tag: nil)
    
    var textFieldFirst = UIConstructor.createTextField()
    var textFieldSecond = UIConstructor.createTextField()
    var textFieldThird = UIConstructor.createTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let vc = ViewController()
        self.delegate = vc
        
        
        setupButton()
        
        [textFieldFirst, textFieldSecond, textFieldThird].enumerated().forEach { (index, tf) in
            setupTextField(tf: tf, offset: (index + 1) * 110)
        }
        
    }
    
    func setupButton() {
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-70)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        button.addAction(UIAction(handler: { _ in
            if let delegate = self.delegate {
                delegate.recieveString(text: "first: \(self.textFieldFirst.text ?? "")")

            }
            self.navigationController?.popViewController(animated: true)
            
        }), for: .touchUpInside)
        
    }
    
    func setupTextField(tf: UITextField, offset: ConstraintOffsetTarget) {
        view.addSubview(tf)
        tf.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(offset)
            make.centerX.equalToSuperview()
            make.width.equalTo(screenSize.width * 0.9)
            make.height.equalTo(50)
        }
        
    }
}

