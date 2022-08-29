//
//  SceneDelegate.swift
//  memoming2
//
//  Created by 서은지 on 2022/08/27.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let homeVC = ViewController()
        
        //        let memoVC = UINavigationController(rootViewController: homeVC)
        //        homeVC.navigationItem.title = ""
        
        let doitVC = doitTableViewController()
        
        let secretVC = SecretViewController()
        
        
        homeVC.tabBarItem = UITabBarItem(title: "MEMO",
                                         image: UIImage(systemName: "pencil"),
                                         tag: 0)
        
        doitVC.tabBarItem = UITabBarItem(title: "TO DO LIST",
                                         image: UIImage(systemName: "list.bullet"),
                                         tag: 1)
        
        secretVC.tabBarItem = UITabBarItem(title: "Secret", image: UIImage(systemName:"x.circle"), tag: 3)
        
     
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, doitVC, secretVC]
        
        window?.rootViewController = tabBarController
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        
    }
}



