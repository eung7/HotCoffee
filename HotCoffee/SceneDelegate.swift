//
//  SceneDelegate.swift
//  HotCoffee
//
//  Created by 김응철 on 2022/05/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: OrdersViewController())
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}
