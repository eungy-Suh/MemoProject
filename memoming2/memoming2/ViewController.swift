//
//  ViewController.swift
//  memoming2
//
//  Created by 서은지 on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {
    let memoTitle = UILabel()
    let memoPlusBarButton = UIButton(type: .custom)
    let firstmemolabel = UITextView()
    let secondMemolabel = UITextView()
    let thirdmemoLabel = UITextView()
    let allDeleteButton = UIButton(type: .custom)
    let leadingline = UIImageView()
    let topline = UIImageView()
    let trailLine = UIImageView()
    let bottonLine = UIImageView()
    let editButton = UIButton(type: .custom)
    let editButton2 = UIButton(type: .custom)
    let editButton3 = UIButton(type: .custom)
    let deleteButton = UIButton(type: .custom)
    let deleteButton2 = UIButton(type: .custom)
    let deleteButton3 = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}
extension ViewController {
    private  func save(text: String) {
        UserDefaults.standard.set(text, forKey: "label")
    }
    func save2(text: String) {
        UserDefaults.standard.set(text, forKey: "label2")
    }
    func save3(text: String) {
        UserDefaults.standard.set(text, forKey: "label3")
    }
    private  func load() -> String {
        let text = UserDefaults.standard.string(forKey: "label") ?? ""
        return text
    }
    private func deleteText() {
        firstmemolabel.text = ""
        UserDefaults.standard.set("", forKey: "label")
        secondMemolabel.text = ""
        UserDefaults.standard.set("", forKey: "label2")
        thirdmemoLabel.text = ""
        UserDefaults.standard.set("", forKey: "label3")
    }
}

extension ViewController {
    @objc func didTapMemoPlus(_ sender: UIButton){
        let nextVC = addMemoViewController()
        nextVC.delegate = self
        self.present(nextVC, animated: true,completion: nil)
    }
}
extension ViewController: InputTextDelegate {
    func textInput(text: String) {
        firstmemolabel.text = UserDefaults.standard.string(forKey: "label") ?? ""
        secondMemolabel.text = UserDefaults.standard.string(forKey: "label2") ?? ""
        thirdmemoLabel.text = UserDefaults.standard.string(forKey: "label3") ?? ""
    }
}
extension ViewController {
    @objc func didTapdeleteButton(_ sender: UIButton){
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
extension ViewController {
    @objc func editTapButton(_ sender: UIButton) {
        if firstmemolabel.isEditable == true {
            firstmemolabel.isEditable = false
        } else {
            firstmemolabel.isEditable = true
            firstmemolabel.becomeFirstResponder()
            //firstmemolabel.tintColor = UIColor.clear
        }
    }
}
extension ViewController {
    @objc func deleteTapButton(_ sender: UIButton){
        firstmemolabel.text = ""
        UserDefaults.standard.set("", forKey: "label")
    }
}
extension ViewController {
    @objc func deleteTapButton2(_ sender: UIButton){
        secondMemolabel.text = ""
        UserDefaults.standard.set("", forKey: "label2")
    }
}
extension ViewController {
    private  func setUI() {
        
        view.addSubview(memoTitle)
        view.addSubview(memoPlusBarButton)
        view.addSubview(secondMemolabel)
        view.addSubview(thirdmemoLabel)
        view.addSubview(firstmemolabel)
        view.addSubview(allDeleteButton)
        view.addSubview(leadingline)
        view.addSubview(topline)
        view.addSubview(trailLine)
        view.addSubview(bottonLine)
        view.addSubview(editButton)
        view.addSubview(editButton2)
        view.addSubview(editButton3)
        view.addSubview(deleteButton)
        view.addSubview(deleteButton2)
        view.addSubview(deleteButton3)
        
        firstmemolabel.text = UserDefaults.standard.string(forKey: "label") ?? ""
        firstmemolabel.font = UIFont.systemFont(ofSize: 18)
        firstmemolabel.isEditable = false
        
        secondMemolabel.text = UserDefaults.standard.string(forKey: "label2") ?? ""
        secondMemolabel.font = UIFont.systemFont(ofSize: 18)
        secondMemolabel.isEditable = false
        
        thirdmemoLabel.text = UserDefaults.standard.string(forKey: "label3") ?? ""
        thirdmemoLabel.font = UIFont.systemFont(ofSize: 18)
        thirdmemoLabel.isEditable = false
        
        memoTitle.text = "SIMPLE MEMO"
        memoTitle.textColor = .darkGray
        memoTitle.font = UIFont.boldSystemFont(ofSize: 30)
        
        if let image = UIImage(named: "더하기") {
            self.memoPlusBarButton.setImage(image, for: .normal)
        }
        memoPlusBarButton.addTarget(self, action: #selector(didTapMemoPlus(_:)), for: .touchUpInside)
        
        allDeleteButton.setTitle("  전체삭제   ", for: .normal)
        allDeleteButton.setTitleColor(.darkGray, for: .normal)
        allDeleteButton.addTarget(self, action: #selector(didTapdeleteButton(_:)), for: .touchUpInside)
        
        firstmemolabel.backgroundColor = .systemGray4
        secondMemolabel.backgroundColor = .systemGray5
        thirdmemoLabel.backgroundColor = .systemGray6
        
        leadingline.image = UIImage(named: "파란밑줄세로")
        topline.image = UIImage(named: "파란밑줄")
        bottonLine.image = UIImage(named: "파란밑줄")
        trailLine.image = UIImage(named: "파란밑줄세로")
        
        editButton.setTitle("수정", for: .normal)
        editButton.setTitleColor(.darkGray, for: .normal)
        editButton.addTarget(self, action: #selector(editTapButton(_:)), for: .touchUpInside)

        editButton2.setTitle("수정", for: .normal)
        editButton2.setTitleColor(.darkGray, for: .normal)
        
        editButton3.setTitle("수정", for: .normal)
        editButton3.setTitleColor(.darkGray, for: .normal)

        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.setTitleColor(.darkGray, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteTapButton(_:)), for: .touchUpInside)
        
        deleteButton2.setTitle("삭제", for: .normal)
        deleteButton2.setTitleColor(.darkGray, for: .normal)
        deleteButton2.addTarget(self, action: #selector(deleteTapButton2(_:)), for: .touchUpInside)
        
        deleteButton3.setTitle("삭제", for: .normal)
        deleteButton3.setTitleColor(.darkGray, for: .normal)
        
        
        
        memoTitle.translatesAutoresizingMaskIntoConstraints = false
        memoPlusBarButton.translatesAutoresizingMaskIntoConstraints = false
        firstmemolabel.translatesAutoresizingMaskIntoConstraints = false
        secondMemolabel.translatesAutoresizingMaskIntoConstraints = false
        thirdmemoLabel.translatesAutoresizingMaskIntoConstraints = false
        allDeleteButton.translatesAutoresizingMaskIntoConstraints = false
        leadingline.translatesAutoresizingMaskIntoConstraints = false
        topline.translatesAutoresizingMaskIntoConstraints = false
        trailLine.translatesAutoresizingMaskIntoConstraints = false
        bottonLine.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton2.translatesAutoresizingMaskIntoConstraints = false
        editButton3.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton2.translatesAutoresizingMaskIntoConstraints = false
        deleteButton3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memoTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            memoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            memoPlusBarButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
            memoPlusBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            memoPlusBarButton.heightAnchor.constraint(equalToConstant: 30),
            memoPlusBarButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            firstmemolabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 220),
            firstmemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            firstmemolabel.widthAnchor.constraint(equalToConstant: 250),
            firstmemolabel.heightAnchor.constraint(equalToConstant: 130),
            
            
            secondMemolabel.topAnchor.constraint(equalTo: firstmemolabel.bottomAnchor,constant: 30),
            secondMemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            secondMemolabel.widthAnchor.constraint(equalToConstant: 250),
            secondMemolabel.heightAnchor.constraint(equalToConstant: 130),
            
            thirdmemoLabel.topAnchor.constraint(equalTo: secondMemolabel.bottomAnchor,constant: 30),
            thirdmemoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            thirdmemoLabel.widthAnchor.constraint(equalToConstant: 250),
            thirdmemoLabel.heightAnchor.constraint(equalToConstant: 130),
            
            allDeleteButton.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -130),
            allDeleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 150),
            
            leadingline.topAnchor.constraint(equalTo: firstmemolabel.topAnchor,constant: -15),
            leadingline.widthAnchor.constraint(equalToConstant: 10),
            leadingline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leadingline.bottomAnchor.constraint(equalTo: thirdmemoLabel.bottomAnchor,constant: 30),
            
            topline.topAnchor.constraint(equalTo: memoTitle.bottomAnchor,constant: 10),
            topline.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topline.heightAnchor.constraint(equalToConstant: 10),
            topline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottonLine.topAnchor.constraint(equalTo: thirdmemoLabel.bottomAnchor, constant: 20),
            bottonLine.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            bottonLine.heightAnchor.constraint(equalToConstant: 10),
            bottonLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            trailLine.topAnchor.constraint(equalTo: firstmemolabel.topAnchor,constant: -13),
            trailLine.widthAnchor.constraint(equalToConstant: 10),
            trailLine.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            trailLine.bottomAnchor.constraint(equalTo: thirdmemoLabel.bottomAnchor,constant: 30),
            
            editButton.topAnchor.constraint(equalTo: firstmemolabel.topAnchor, constant: 30),
            editButton.leadingAnchor.constraint(equalTo: firstmemolabel.trailingAnchor, constant: 15),
            
            editButton2.topAnchor.constraint(equalTo: secondMemolabel.topAnchor, constant: 30),
            editButton2.leadingAnchor.constraint(equalTo: secondMemolabel.trailingAnchor, constant: 15),
            
            editButton3.topAnchor.constraint(equalTo: thirdmemoLabel.topAnchor, constant: 30),
            editButton3.leadingAnchor.constraint(equalTo: thirdmemoLabel.trailingAnchor, constant: 15),
            
            deleteButton.topAnchor.constraint(equalTo: firstmemolabel.topAnchor, constant: 60),
            deleteButton.leadingAnchor.constraint(equalTo: firstmemolabel.trailingAnchor, constant: 15),
            
            deleteButton2.topAnchor.constraint(equalTo: secondMemolabel.topAnchor, constant: 60),
            deleteButton2.leadingAnchor.constraint(equalTo: secondMemolabel.trailingAnchor, constant: 15),
            
            deleteButton3.topAnchor.constraint(equalTo: thirdmemoLabel.topAnchor, constant: 60),
            deleteButton3.leadingAnchor.constraint(equalTo: thirdmemoLabel.trailingAnchor, constant: 15),
            
        ])
    }
    
}
