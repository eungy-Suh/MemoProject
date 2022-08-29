//
//  doitTableViewController.swift
//  memoming2
//
//  Created by 서은지 on 2022/08/27.
//

import UIKit

class doitTableViewController: UIViewController {
    let doitTitle = UILabel()
    let doitPlusBarButton = UIButton(type: .custom)
    let firstdoitlabel = UILabel()
    let seconddoitlabel = UILabel()
    let thriddoitlabel = UILabel()
    let redimage = UIButton(type: .custom)
    let blueimage = UIButton(type: .custom)
    let redimage2 = UIButton(type: .custom)
    let blueimage2 = UIButton(type: .custom)
    let redlineimage = UIImageView()
    let bluelineimage = UIImageView()
    let redlineimage2 = UIImageView()
    let bluelineimage2 = UIImageView()
    let checkButton = UIButton(type: .custom)
    let checkButton2 = UIButton(type: .custom)
    let deleteButton = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension doitTableViewController {
    private  func save(text: String) {
        UserDefaults.standard.set(text, forKey: "doitlabel")
    }
    func save2(text: String) {
        UserDefaults.standard.set(text, forKey: "doitlabel2")
    }
    func save3(text: String) {
        UserDefaults.standard.set(text, forKey: "doitlabel3")
    }
    private  func load() -> String {
        let text = UserDefaults.standard.string(forKey: "doitlabel") ?? ""
        return text
    }
    private func deleteText() {
        firstdoitlabel.text = ""
        UserDefaults.standard.set("", forKey: "doitlabel")
        seconddoitlabel.text = ""
        UserDefaults.standard.set("", forKey: "doitlabel2")
        thriddoitlabel.text = ""
        UserDefaults.standard.set("", forKey: "doitlabel3")
    }
}
extension doitTableViewController {
    @objc func didTapMemoPlus(_ sender: UIButton){
        let nextVC = adddoitViewController()
        nextVC.delegate = self
        self.present(nextVC, animated: true,completion: nil)
    }
}
extension doitTableViewController: InputTextDelegate2 {
    func textInput(text: String) {
        firstdoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel") ?? ""
        seconddoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel2") ?? ""
        thriddoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel3") ?? ""
        
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
extension doitTableViewController {
    @objc func checkTapButton(_ sender: UIButton){
        firstdoitlabel.attributedText = firstdoitlabel.text?.strikeThrough()
    }
}
extension doitTableViewController {
    @objc func checkTapButton2(_ sender: UIButton){
        seconddoitlabel.attributedText = seconddoitlabel.text?.strikeThrough()
    }
}
extension doitTableViewController {
    @objc func checkTapButton3(_ sender: UIButton){
        thriddoitlabel.attributedText = seconddoitlabel.text?.strikeThrough()
    }
}
extension doitTableViewController {
    @objc func deleteTapButton(_ sender: UIButton){
        let alertController = UIAlertController(title: "전체삭제", message: "전체삭제 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.deleteText()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
}

extension doitTableViewController {
    private  func setUI() {
        firstdoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel") ?? ""
        firstdoitlabel.lineBreakMode = .byWordWrapping
        firstdoitlabel.numberOfLines = 0
        
        
        seconddoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel2") ?? ""
        seconddoitlabel.lineBreakMode = .byWordWrapping
        seconddoitlabel.numberOfLines = 0
        
        thriddoitlabel.text = UserDefaults.standard.string(forKey: "doitlabel3") ?? ""
        thriddoitlabel.lineBreakMode = .byWordWrapping
        thriddoitlabel.numberOfLines = 0
        
        view.addSubview(doitTitle)
        view.addSubview(doitPlusBarButton)
        view.addSubview(firstdoitlabel)
        view.addSubview(seconddoitlabel)
        view.addSubview(thriddoitlabel)
        view.addSubview(redimage)
        view.addSubview(blueimage)
        view.addSubview(redimage2)
        view.addSubview(blueimage2)
        view.addSubview(redlineimage)
        view.addSubview(bluelineimage)
        view.addSubview(redlineimage2)
        view.addSubview(bluelineimage2)
        view.addSubview(checkButton)
        view.addSubview(checkButton2)
        view.addSubview(deleteButton)
        
        redlineimage.image = UIImage(named: "빨간밑줄")
        bluelineimage.image = UIImage(named: "파란밑줄")
        redlineimage2.image = UIImage(named: "빨간밑줄")
        bluelineimage2.image = UIImage(named: "파란밑줄")
        
        firstdoitlabel.lineBreakMode = .byWordWrapping
        firstdoitlabel.numberOfLines = 0
        
        doitTitle.text = "TO DO LIST"
        
        doitTitle.textColor = .darkGray
        doitTitle.font = UIFont.boldSystemFont(ofSize: 30)
     
        if let image = UIImage(named: "더하기") {
            self.doitPlusBarButton.setImage(image, for: .normal)
        }
        doitPlusBarButton.addTarget(self, action: #selector(didTapMemoPlus(_:)), for: .touchUpInside)
        
        if let image2 = UIImage(named: "빨간동그라미") {
            self.redimage.setImage(image2, for: .normal)
            self.redimage2.setImage(image2, for: .normal)
        }
        if let image3 = UIImage(named: "파랑동그라미"){
            self.blueimage.setImage(image3, for: .normal)
            self.blueimage2.setImage(image3, for: .normal)
        }
        
        redimage.addTarget(self, action: #selector(checkTapButton(_:)), for: .touchUpInside)
        
        redimage2.addTarget(self, action: #selector(checkTapButton3(_:)), for: .touchUpInside)
        blueimage.addTarget(self, action: #selector(checkTapButton2(_:)), for: .touchUpInside)
        
        deleteButton.setTitle("  전체삭제   ", for: .normal)
        deleteButton.setTitleColor(.darkGray, for: .normal)
        
        deleteButton.addTarget(self, action: #selector(deleteTapButton(_:)), for: .touchUpInside)
        firstdoitlabel.lineBreakMode = .byWordWrapping
        firstdoitlabel.numberOfLines = 0
        
        firstdoitlabel.font = UIFont.boldSystemFont(ofSize: 15)
        seconddoitlabel.font = UIFont.boldSystemFont(ofSize: 15)
        thriddoitlabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        doitTitle.translatesAutoresizingMaskIntoConstraints = false
        doitPlusBarButton.translatesAutoresizingMaskIntoConstraints = false
        firstdoitlabel.translatesAutoresizingMaskIntoConstraints = false
        seconddoitlabel.translatesAutoresizingMaskIntoConstraints = false
        thriddoitlabel.translatesAutoresizingMaskIntoConstraints = false
        redimage.translatesAutoresizingMaskIntoConstraints = false
        blueimage.translatesAutoresizingMaskIntoConstraints = false
        redimage2.translatesAutoresizingMaskIntoConstraints = false
        blueimage2.translatesAutoresizingMaskIntoConstraints = false
        redlineimage.translatesAutoresizingMaskIntoConstraints = false
        bluelineimage.translatesAutoresizingMaskIntoConstraints = false
        redlineimage2.translatesAutoresizingMaskIntoConstraints = false
        bluelineimage2.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton2.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            doitTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            doitTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            doitPlusBarButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            doitPlusBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            doitPlusBarButton.heightAnchor.constraint(equalToConstant: 30),
            doitPlusBarButton.widthAnchor.constraint(equalToConstant: 30),
            
            firstdoitlabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            firstdoitlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            firstdoitlabel.widthAnchor.constraint(equalToConstant: 200),
            firstdoitlabel.heightAnchor.constraint(equalToConstant: 70),
            
            seconddoitlabel.topAnchor.constraint(equalTo: firstdoitlabel.bottomAnchor,constant: 30),
            seconddoitlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            seconddoitlabel.widthAnchor.constraint(equalToConstant: 200),
            seconddoitlabel.heightAnchor.constraint(equalToConstant: 70),
            
            thriddoitlabel.topAnchor.constraint(equalTo: seconddoitlabel.bottomAnchor,constant: 30),
            thriddoitlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            thriddoitlabel.widthAnchor.constraint(equalToConstant: 200),
            thriddoitlabel.heightAnchor.constraint(equalToConstant: 70),
            
            redimage.topAnchor.constraint(equalTo: firstdoitlabel.topAnchor,constant: 20),
            redimage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            redimage.heightAnchor.constraint(equalToConstant: 40),
            redimage.widthAnchor.constraint(equalToConstant: 40),
            
            redlineimage.topAnchor.constraint(equalTo: firstdoitlabel.bottomAnchor,constant: 5),
            redlineimage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            redlineimage.heightAnchor.constraint(equalToConstant: 10),
            redlineimage.widthAnchor.constraint(equalToConstant: 250),
            
            bluelineimage.topAnchor.constraint(equalTo: seconddoitlabel.bottomAnchor,constant: 5),
            bluelineimage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            bluelineimage.heightAnchor.constraint(equalToConstant: 10),
            bluelineimage.widthAnchor.constraint(equalToConstant: 250),
            
            redlineimage2.topAnchor.constraint(equalTo: thriddoitlabel.bottomAnchor,constant: 5),
            redlineimage2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            redlineimage2.heightAnchor.constraint(equalToConstant: 10),
            redlineimage2.widthAnchor.constraint(equalToConstant: 250),
            
            bluelineimage2.topAnchor.constraint(equalTo: thriddoitlabel.bottomAnchor,constant: 100),
            bluelineimage2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            bluelineimage2.heightAnchor.constraint(equalToConstant: 10),
            bluelineimage2.widthAnchor.constraint(equalToConstant: 250),
            
            
            blueimage.topAnchor.constraint(equalTo: seconddoitlabel.topAnchor,constant: 20),
            blueimage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            blueimage.heightAnchor.constraint(equalToConstant: 40),
            blueimage.widthAnchor.constraint(equalToConstant: 40),
            
            
            redimage2.topAnchor.constraint(equalTo: thriddoitlabel.topAnchor,constant: 20),
            redimage2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            redimage2.heightAnchor.constraint(equalToConstant: 40),
            redimage2.widthAnchor.constraint(equalToConstant: 40),
            
            blueimage2.topAnchor.constraint(equalTo: redimage2.topAnchor,constant: 100),
            blueimage2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            blueimage2.heightAnchor.constraint(equalToConstant: 40),
            blueimage2.widthAnchor.constraint(equalToConstant: 40),
            
            checkButton.topAnchor.constraint(equalTo: firstdoitlabel.topAnchor,constant: 30),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkButton.heightAnchor.constraint(equalToConstant: 30),
            checkButton.widthAnchor.constraint(equalToConstant: 30),
            
            checkButton2.topAnchor.constraint(equalTo: seconddoitlabel.topAnchor,constant: 30),
            checkButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkButton2.heightAnchor.constraint(equalToConstant: 30),
            checkButton2.widthAnchor.constraint(equalToConstant: 30),
            
            deleteButton.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -130),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 150),
        ])
    }
    
}

