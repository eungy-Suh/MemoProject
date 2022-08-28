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
    let thirdmemoLabel = UILabel()
    let scrollView = UIScrollView()
    let deleteButton = UIButton(type: .system)
 
    
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
        deleteText()
    }
}

extension ViewController {
    private  func setUI() {
        
        view.addSubview(memoTitle)
        view.addSubview(memoPlusBarButton)
        view.addSubview(secondMemolabel)
        view.addSubview(scrollView)
        view.addSubview(thirdmemoLabel)
        view.addSubview(firstmemolabel)
        view.addSubview(deleteButton)
     //   scrollView.addSubview(firstmemolabel)
        scrollView.isScrollEnabled = true
        scrollView.indicatorStyle = .black
        scrollView.showsVerticalScrollIndicator = true
        
        scrollView.backgroundColor = .darkGray
        
        firstmemolabel.text = UserDefaults.standard.string(forKey: "label") ?? ""

        firstmemolabel.font = UIFont.systemFont(ofSize: 15)
        
        secondMemolabel.text = UserDefaults.standard.string(forKey: "label2") ?? ""
    
        thirdmemoLabel.text = UserDefaults.standard.string(forKey: "label3") ?? ""
        thirdmemoLabel.lineBreakMode = .byWordWrapping
        thirdmemoLabel.numberOfLines = 0
        
        memoTitle.text = "MEMO"
        memoTitle.textColor = .darkGray
         memoTitle.font = UIFont.boldSystemFont(ofSize: 30)
      //  memoTitle.font = UIFont.PoorStory(type: .Bold, size: 30)
        // memoTitle.font = UIFont.systemFont(ofSize: 24)
        
        thirdmemoLabel.numberOfLines = 0
        thirdmemoLabel.textAlignment = .center
        
        if let image = UIImage(named: "더하기") {
            self.memoPlusBarButton.setImage(image, for: .normal)
        }
        memoPlusBarButton.addTarget(self, action: #selector(didTapMemoPlus(_:)), for: .touchUpInside)
        
        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapdeleteButton(_:)), for: .touchUpInside)
        
        
        firstmemolabel.backgroundColor = .systemGray4
        secondMemolabel.backgroundColor = .systemGray5
        thirdmemoLabel.backgroundColor = .systemGray6
        
        
        //   scrollView.translatesAutoresizingMaskIntoConstraints = false
        memoTitle.translatesAutoresizingMaskIntoConstraints = false
        memoPlusBarButton.translatesAutoresizingMaskIntoConstraints = false
        firstmemolabel.translatesAutoresizingMaskIntoConstraints = false
        secondMemolabel.translatesAutoresizingMaskIntoConstraints = false
        thirdmemoLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            memoTitle.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            memoTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            memoPlusBarButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 150),
            memoPlusBarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            memoPlusBarButton.heightAnchor.constraint(equalToConstant: 30),
            memoPlusBarButton.widthAnchor.constraint(equalToConstant: 30),
            
            
            firstmemolabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            firstmemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            firstmemolabel.widthAnchor.constraint(equalToConstant: 330),
            firstmemolabel.heightAnchor.constraint(equalToConstant: 100),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            scrollView.widthAnchor.constraint(equalToConstant: 330),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            
            secondMemolabel.topAnchor.constraint(equalTo: firstmemolabel.bottomAnchor,constant: 30),
            secondMemolabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            secondMemolabel.widthAnchor.constraint(equalToConstant: 330),
            secondMemolabel.heightAnchor.constraint(equalToConstant: 100),
            
            thirdmemoLabel.topAnchor.constraint(equalTo: secondMemolabel.bottomAnchor,constant: 30),
            thirdmemoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            thirdmemoLabel.widthAnchor.constraint(equalToConstant: 330),
            thirdmemoLabel.heightAnchor.constraint(equalToConstant: 100),
            
            deleteButton.topAnchor.constraint(equalTo: thirdmemoLabel.bottomAnchor,constant: 30),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            

            ])
    }

    }
