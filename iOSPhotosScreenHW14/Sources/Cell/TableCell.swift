//
//  TableCell.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 07.09.2022.
//

import UIKit

class TableCell: UICollectionViewCell {

    var setupCell: Model? {
        didSet {
            leftIcon.image = UIImage(systemName: setupCell?.image ?? "")
            textLabel.text = setupCell?.textLabel
            numbersLabel.text = setupCell?.numbersLabel
        }
    }

    static let tableCellIdentifier = "tableCell"

    // MARK: - UI Elements

    private lazy var leftIcon: UIImageView = {
        let leftIcon = UIImageView()
        leftIcon.contentMode = .scaleAspectFit
        leftIcon.tintColor = .systemBlue
        return leftIcon
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private lazy var numbersLabel: UILabel = {
        let labelInt = UILabel()
        labelInt.textColor = .systemGray
        return labelInt
    }()

    private lazy var rightIcon: UIImageView = {
        let rightIcon = UIImage(systemName: "chevron.right")
        let imageRight = UIImageView(image: rightIcon)
        imageRight.contentMode = .scaleToFill
        imageRight.tintColor = .systemGray2
        return imageRight
    }()

    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .separator
        return separatorView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(leftIcon)
        addSubview(textLabel)
        addSubview(numbersLabel)
        addSubview(rightIcon)
        addSubview(separatorView)
    }

    private func setupView() {
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        numbersLabel.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftIcon.topAnchor.constraint(equalTo: topAnchor),
            leftIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftIcon.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftIcon.widthAnchor.constraint(equalToConstant: 30),

            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leftIcon.trailingAnchor, constant: 15),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            rightIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightIcon.centerYAnchor.constraint(equalTo: centerYAnchor),

            numbersLabel.topAnchor.constraint(equalTo: topAnchor),
            numbersLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            numbersLabel.trailingAnchor.constraint(equalTo: rightIcon.leadingAnchor, constant: -10),

            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }

    func hidingSeparator(isHide: Bool) {
        separatorView.isHidden = isHide
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.leftIcon.image = nil
    }
}
