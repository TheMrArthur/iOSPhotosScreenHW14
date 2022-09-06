//
//  SceneDelegate.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }

    func createPhotosNavigationController() -> UINavigationController {
        let photosNavigationController = PhotosLayoutViewController()
        photosNavigationController.title = "Photos"
        photosNavigationController.tabBarItem = UITabBarItem(title: "Photos",
                                                             image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                             tag: 0)
        return UINavigationController(rootViewController: photosNavigationController)
    }

    func createForYouNavigationController() -> UINavigationController {
        let forYouNavigationController = ForYouLayoutViewController()
        forYouNavigationController.title = "For You"
        forYouNavigationController.tabBarItem = UITabBarItem(title: "For You",
                                                             image: UIImage(systemName: "heart.text.square.fill"),
                                                             tag: 1)
        return UINavigationController(rootViewController: forYouNavigationController)
    }

    func createAlbumsNavigationController() -> UINavigationController {
        let albumsNavigationController = AlbumsLayoutViewController()
        albumsNavigationController.title = "Albums"
        albumsNavigationController.tabBarItem = UITabBarItem(title: "Albums",
                                                             image: UIImage(systemName: "rectangle.stack.fill"),
                                                             tag: 2)
        return UINavigationController(rootViewController: albumsNavigationController)
    }

    func createSearchNavigationController() -> UINavigationController {
        let searchNavigationController = SearchLayoutViewController()
        searchNavigationController.title = "Search"
        searchNavigationController.tabBarItem = UITabBarItem(title: "Search",
                                                             image: UIImage(systemName: "magnifyingglass"),
                                                             tag: 3)
        return UINavigationController(rootViewController: searchNavigationController)
    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .tertiarySystemFill
        tabBarController.viewControllers = [createPhotosNavigationController(),
                                            createForYouNavigationController(),
                                            createAlbumsNavigationController(),
                                            createSearchNavigationController()]
        return tabBarController
    }
}
