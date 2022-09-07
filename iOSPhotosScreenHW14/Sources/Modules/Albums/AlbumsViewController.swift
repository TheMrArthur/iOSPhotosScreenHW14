//
//  AlbumsViewController.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

final class AlbumsViewController: UIViewController {
    
  private var setupAlbumsController: Model?
    
    // MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BigImageCell.self, forCellWithReuseIdentifier: BigImageCell.bigImageCellIdentifier)
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: TableCell.tableCellIdentifier)
        collectionView.register(CellHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CellHeader.cellHeaderIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {
                case 0:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                          heightDimension: .fractionalHeight(0.8))
                    
                    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                    layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                       leading: 15,
                                                                       bottom: 10,
                                                                       trailing: 0)
                    
                    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                           heightDimension: .absolute(480))
                    
                    let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                       subitem: layoutItem,
                                                                       count: 2)
                    
                    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                    layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                          leading: 5,
                                                                          bottom: 10,
                                                                          trailing: 15)
                    layoutSection.orthogonalScrollingBehavior = .continuous

                    let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                         heightDimension: .estimated(40))

                    let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: layoutSectionHeaderSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)

                    layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                    return layoutSection
                    
                case 1:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                          heightDimension: .fractionalHeight(0.8))
                    
                    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                    layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                       leading: 15,
                                                                       bottom: 10,
                                                                       trailing: 0)
                    
                    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200),
                                                           heightDimension: .absolute(235))
                    
                    let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                       subitem: layoutItem,
                                                                       count: 1)
                    
                    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                    layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                          leading: 5,
                                                                          bottom: 10,
                                                                          trailing: 15)
                    layoutSection.orthogonalScrollingBehavior = .continuous

                    let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                         heightDimension: .estimated(40))

                    let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: layoutSectionHeaderSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
                    layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                    return layoutSection
                    
                default:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                          heightDimension: .fractionalHeight(1))
                    
                    let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                    layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                       leading: 15,
                                                                       bottom: 0,
                                                                       trailing: 0)
                    
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                           heightDimension: .absolute(44))
                    
                    let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                         subitem: layoutItem,
                                                                         count: 1)
                    
                    let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                    layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                                          leading: 5,
                                                                          bottom: 30,
                                                                          trailing: 10)

                    let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.06),
                                                                         heightDimension: .estimated(40))

                    let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: layoutSectionHeaderSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0)
                    layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                    return layoutSection
            }
        }
    }
}
