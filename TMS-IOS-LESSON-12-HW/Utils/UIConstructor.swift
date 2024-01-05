import Foundation
import UIKit

class UIConstructor {
    static func createView() -> UIView {
        return {
            let view = UIView()
            return view
        }()
    }
    
    static func createLabel(text: String, textColor: UIColor = UIColor.white, textAlignment: NSTextAlignment = .center, font: UIFont = UIFont.boldSystemFont(ofSize: 16), tag: Int?) -> UILabel {
        return {
            let label = UILabel()
//            label.numberOfLines = 0
            label.text = text
            label.textColor = textColor
//            label.textAlignment = textAlignment
            label.font = font
            if(tag != nil) {
                label.tag = tag!
            }
            
            return label
        }()
    }
    
    static func createRoundedButton(title: String, size: Double, textColor: UIColor = UIColor.white, font: UIFont = UIFont.boldSystemFont(ofSize: 30), backgroundColor: UIColor, tag: Int?) -> UIButton {
        return {
            let button = UIButton()
            
            button.setTitle(title, for: .normal)
            button.backgroundColor = backgroundColor
            if(tag != nil) {
                button.tag = tag!
            }
            
            button.titleLabel?.font = font
            button.titleLabel?.textAlignment = .left
            button.layer.cornerRadius = size / 2
            button.layer.masksToBounds = true
            
            return button
        }()
    }
    
    static func createButton(title: String, cornerRadius: CGFloat = .zero, textColor: UIColor = UIColor.white, font: UIFont = UIFont.boldSystemFont(ofSize: 30), backgroundColor: UIColor, tag: Int?) -> UIButton {
        return {
            let button = UIButton()
            
            button.setTitle(title, for: .normal)
            button.backgroundColor = backgroundColor
            if(tag != nil) {
                button.tag = tag!
            }
            button.layer.cornerRadius = cornerRadius
            button.titleLabel?.font = font
            button.titleLabel?.textAlignment = .center
            
            return button
        }()
    }
    
    static func createStackView(horizontal: Bool = false, spacing: Double = 16) -> UIStackView {
        return {
            let stackView = UIStackView()
            
            stackView.axis  = horizontal ?  NSLayoutConstraint.Axis.horizontal : NSLayoutConstraint.Axis.vertical
            stackView.distribution  = UIStackView.Distribution.equalSpacing
            stackView.alignment = UIStackView.Alignment.fill
            stackView.spacing   = spacing
            
            return stackView
        }()
    }
    
    static func createTextField() -> UITextField {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        return {
            let textField = UITextField()
            textField.backgroundColor = .white
            textField.placeholder = "Enter text..."
            textField.layer.cornerRadius = 8
            textField.leftView = paddingView
            textField.leftViewMode = .always
            return textField
        }()
    }
}

