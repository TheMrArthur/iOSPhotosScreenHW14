//
//  BigImageCell.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

final class BigImageCell: UICollectionViewCell {
    
    static let bigImageCellIdentifier = "bigImageCell"
    
    // MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    
    private lazy var numbersLabel: UILabel = {
        let numbersLabel = UILabel()
        numbersLabel.textColor = .systemGray
        return numbersLabel
    }()
    
    private lazy var bottomIcon: UIImageView = {
        let bottomIcon = UIImageView()
        bottomIcon.tintColor = .white
        return bottomIcon
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
        addSubview(bottomIcon)
    }
    
    private func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomIcon.translatesAutoresizingMaskIntoConstraints = false
        
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
            image.bottomAnchor.constraint(equalTo: textLabel.topAnchor),
            
            bottomIcon.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -5),
            bottomIcon.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 5),
            bottomIcon.widthAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.12),
            bottomIcon.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.12)
        ])
    }
    
    // MARK: - Configuration
    
    func configuration(model: Model) {
        image.image = UIImage(named: model.image)
        textLabel.text = model.textLabel
        numbersLabel.text = model.numbersLabel
        bottomIcon.image = UIImage(systemName: model.bottomIcon ?? "")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        textLabel.text = nil
        numbersLabel.text = nil
    }
}
