//
//  addMemoViewController.swift
//  memoming2
//
//  Created by 서은지 on 2022/08/27.
//

import UIKit

protocol InputTextDelegate: AnyObject {
    func textInput(text: String)
}

class addMemoViewController: UIViewController {
    
    let textField = UITextView()
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    let label = UILabel()
    
    weak var delegate: InputTextDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
}
extension addMemoViewController {
    private  func save(text: String) {
        let text1 = UserDefaults.standard.string(forKey: "label") ?? ""
        let text2 = UserDefaults.standard.string(forKey: "label2") ?? ""
        let text3 = UserDefaults.standard.string(forKey: "label3") ?? ""
        if text1 == "" {
            UserDefaults.standard.set(text, forKey: "label")
        } else if text2 == "" {
            UserDefaults.standard.set(text, forKey: "label2")
        } else if text3 == "" {
            UserDefaults.standard.set(text, forKey: "label3")
        }
    }
}

extension addMemoViewController {
    @objc func confirmButton(_ sender: UIButton){
        let text = textField.text ?? ""
        save(text: text)
        self.delegate?.textInput(text: text)
        self.dismiss(animated: true,completion: nil)
    }
}


extension addMemoViewController {
    private func setUI() {
        view.backgroundColor = .systemMint
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(label)
        
        
        
        label.text = "이곳에 입력하세요😉"
        label.font = UIFont(name: "ACC어린이마음고운체", size: 30)
        
        textField.layer.borderColor = UIColor.white.cgColor//테두리 만들기. bordercolor은 cgColor
        textField.layer.borderWidth = 2 //테두리 두께
        textField.layer.cornerRadius = 6  //테두리 곡선
        textField.backgroundColor = .systemMint
        textField.font = UIFont.systemFont(ofSize: 17)
        
        button.setTitle("   확인   ", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.systemMint, for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(confirmButton(_:)), for: .touchUpInside)
        
        
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.heightAnchor.constraint(equalToConstant: 400),
            textField.widthAnchor.constraint(equalToConstant: 330),
            
            button.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    
}

