//
//  CellHeader.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 07.09.2022.
//

import UIKit

final class CellHeader: UICollectionReusableView {

    static let cellHeaderIdentifier = "cellHeader"

    // MARK: - UI Elements

    lazy var leftTitle: UILabel = {
        let leftTitle = UILabel()
        leftTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return leftTitle
    }()

    lazy var rightTitle: UILabel = {
        let rightTitle = UILabel()
        rightTitle.textColor = .systemBlue
        return rightTitle
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
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(leftTitle)
        addSubview(rightTitle)
        addSubview(separatorView)
    }

    private func setupLayout() {
        leftTitle.translatesAutoresizingMaskIntoConstraints = false
        rightTitle.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftTitle.leadingAnchor.constraint(equalTo: leadingAnchor),

            rightTitle.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leftTitle.leadingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }

    // MARK: - Configuration
    
    func configuration(headerLeftTitle: String, headerRightTitle: String?) {
        leftTitle.text = headerLeftTitle
        rightTitle.text = headerRightTitle
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        leftTitle.text = nil
        rightTitle.text = nil
    }
}
