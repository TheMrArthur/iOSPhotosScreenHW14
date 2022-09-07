//
//  AlbumsModel.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import Foundation

struct Model {
    var image: String
    var textLabel: String
    var numbersLabel: String
    var bottomIcon: String?
}

extension Model {
    static var albumsModel = [
        [Model(image: "photo1", textLabel: "Недавние", numbersLabel: "740"),
         Model(image: "photo2", textLabel: "Избранное", numbersLabel: "18", bottomIcon: "heart.fill"),
         Model(image: "photo3", textLabel: "TikTok", numbersLabel: "3"),
         Model(image: "photo4", textLabel: "WhatsApp", numbersLabel: "149"),
         Model(image: "photo5", textLabel: "Pinterest", numbersLabel: "5"),
         Model(image: "photo6", textLabel: "InShot", numbersLabel: "1")],

        [Model(image: "photo7", textLabel: "Люди", numbersLabel: "37"),
         Model(image: "photo8", textLabel: "Места", numbersLabel: "240")],

        [Model(image: "video", textLabel: "Видео", numbersLabel: "67"),
         Model(image: "slowmo", textLabel: "Замедленно", numbersLabel: "1"),
         Model(image: "camera.viewfinder", textLabel: "Снимки экрана", numbersLabel: "321"),
         Model(image: "record.circle", textLabel: "Записи экрана", numbersLabel: "14"),
         Model(image: "square.stack.3d.forward.dottedline", textLabel: "Анимированные", numbersLabel: "1")],

        [Model(image: "square.and.arrow.down", textLabel: "Импортированные", numbersLabel: "10"),
         Model(image: "trash", textLabel: "Недавно удаленные", numbersLabel: "2")]
    ]
}
