//
//  TabBar.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .tertiarySystemFill
        setupTabBarViewControllers()
    }

    func setupTabBarViewControllers() {

        let photosController = UINavigationController(rootViewController: PhotosViewController())
        photosController.tabBarItem = UITabBarItem(title: "Photos",
                                                   image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                   tag: 0)

        let forYouController = UINavigationController(rootViewController: ForYouViewController())
        forYouController.tabBarItem = UITabBarItem(title: "For You",
                                                   image: UIImage(systemName: "heart.text.square.fill"),
                                                   tag: 1)

        let albumsController = UINavigationController(rootViewController: AlbumsViewController())
        albumsController.tabBarItem = UITabBarItem(title: "Albums",
                                                   image: UIImage(systemName: "rectangle.stack.fill"),
                                                   tag: 2)


        let searchController = UINavigationController(rootViewController: SearchViewController())
        searchController.tabBarItem = UITabBarItem(title: "Search",
                                                   image: UIImage(systemName: "magnifyingglass"),
                                                   tag: 3)

        let controllers = [photosController, forYouController, albumsController, searchController]
        self.setViewControllers(controllers, animated: true)
    }
}
