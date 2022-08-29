//
//  SecretViewController.swift
//  memoming2
//
//  Created by 서은지 on 2022/08/29.
//

import UIKit

class SecretViewController: UIViewController {

        let memoTitle = UILabel()
        let memoPlusBarButton = UIButton(type: .custom)
        let firstmemolabel = UITextView()
        let secondMemolabel = UITextView()
        let thirdmemoLabel = UITextView()
        let deleteButton = UIButton(type: .custom)
        let leadingline = UIImageView()
        let topline = UIImageView()
        let trailLine = UIImageView()
        let bottonLine = UIImageView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.isHidden = true
        let alertController = UIAlertController(title: "Secret Memo", message: "패스워드를 입력하세요", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in self.view.isHidden = false
        }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        alertController.addTextField()
        present(alertController, animated: true)
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(memoTitle)
            view.addSubview(memoPlusBarButton)
            view.addSubview(secondMemolabel)
            view.addSubview(thirdmemoLabel)
            view.addSubview(firstmemolabel)
            view.addSubview(deleteButton)
            view.addSubview(leadingline)
            view.addSubview(topline)
            view.addSubview(trailLine)
            view.addSubview(bottonLine)
            
            firstmemolabel.text = UserDefaults.standard.string(forKey: "label") ?? ""
            firstmemolabel.font = UIFont.systemFont(ofSize: 18)
            firstmemolabel.isEditable = false
            
            secondMemolabel.text = UserDefaults.standard.string(forKey: "label2") ?? ""
            secondMemolabel.font = UIFont.systemFont(ofSize: 18)
            secondMemolabel.isEditable = false
            
            thirdmemoLabel.text = UserDefaults.standard.string(forKey: "label3") ?? ""
            thirdmemoLabel.font = UIFont.systemFont(ofSize: 18)
            thirdmemoLabel.isEditable = false
            
            memoTitle.text = "비밀이야"
            memoTitle.textColor = .darkGray
            memoTitle.font = UIFont.boldSystemFont(ofSize: 30)
            
            if let image = UIImage(named: "더하기") {
                self.memoPlusBarButton.setImage(image, for: .normal)
            }
            
            deleteButton.setTitle("  전체삭제   ", for: .normal)
            deleteButton.setTitleColor(.darkGray, for: .normal)
            
            firstmemolabel.backgroundColor = .systemGray4
            secondMemolabel.backgroundColor = .systemGray5
            thirdmemoLabel.backgroundColor = .systemGray6
            
            leadingline.image = UIImage(named: "파란밑줄세로")
            topline.image = UIImage(named: "파란밑줄")
            bottonLine.image = UIImage(named: "파란밑줄")
            trailLine.image = UIImage(named: "파란밑줄세로")
                      
            memoTitle.translatesAutoresizingMaskIntoConstraints = false
            memoPlusBarButton.translatesAutoresizingMaskIntoConstraints = false
            firstmemolabel.translatesAutoresizingMaskIntoConstraints = false
            secondMemolabel.translatesAutoresizingMaskIntoConstraints = false
            thirdmemoLabel.translatesAutoresizingMaskIntoConstraints = false
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            leadingline.translatesAutoresizingMaskIntoConstraints = false
            topline.translatesAutoresizingMaskIntoConstraints = false
            trailLine.translatesAutoresizingMaskIntoConstraints = false
            bottonLine.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                memoTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
                memoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                memoPlusBarButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 100),
                memoPlusBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
                memoPlusBarButton.heightAnchor.constraint(equalToConstant: 30),
                memoPlusBarButton.widthAnchor.constraint(equalToConstant: 30),
                
                
                firstmemolabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 220),
                firstmemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
                firstmemolabel.widthAnchor.constraint(equalToConstant: 300),
                firstmemolabel.heightAnchor.constraint(equalToConstant: 130),
                                
                secondMemolabel.topAnchor.constraint(equalTo: firstmemolabel.bottomAnchor,constant: 30),
                secondMemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
                secondMemolabel.widthAnchor.constraint(equalToConstant: 300),
                secondMemolabel.heightAnchor.constraint(equalToConstant: 130),
                
                thirdmemoLabel.topAnchor.constraint(equalTo: secondMemolabel.bottomAnchor,constant: 30),
                thirdmemoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
                thirdmemoLabel.widthAnchor.constraint(equalToConstant: 300),
                thirdmemoLabel.heightAnchor.constraint(equalToConstant: 130),
                
                deleteButton.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -130),
                deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 150),
                
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
            ])
        }
    }
    

