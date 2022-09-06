//
//  BigImageCell.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

class BigImageCell: UICollectionViewCell {

    static let identifier = "bigImageCell"

    var setupCell: Model? {
        didSet {
            image.image = UIImage(named: setupCell?.image ?? "rectangle.on.rectangle")
            textLabel.text = setupCell?.textLabel
            numbersLabel.text = setupCell?.numbersLabel
        }
    }

    // MARK: - UI Elements

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()

    lazy var numbersLabel: UILabel = {
        let numbersLabel = UILabel()
        numbersLabel.textColor = .systemGray
        return numbersLabel
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(image)
        addSubview(textLabel)
        addSubview(numbersLabel)
    }

    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            numbersLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            numbersLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            numbersLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numbersLabel.heightAnchor.constraint(equalToConstant: 20),

            textLabel.bottomAnchor.constraint(equalTo: numbersLabel.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 25),

            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: textLabel.topAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
}
