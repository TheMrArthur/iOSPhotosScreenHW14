//
//  AlbumsViewController.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

class AlbumsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
