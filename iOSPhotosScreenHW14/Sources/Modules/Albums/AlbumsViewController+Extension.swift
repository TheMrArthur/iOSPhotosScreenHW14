//
//  AlbumsViewController+Extension.swift
//  iOSPhotosScreenHW14
//
//  Created by Артур Горлов on 06.09.2022.
//

import UIKit

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Model.albumsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.albumsModel[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
            case 0, 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigImageCell.bigImageCellIdentifier, for: indexPath) as? BigImageCell else {
                    return UICollectionViewCell()
                }
                cell.configuration(model: Model.albumsModel[indexPath.section][indexPath.item])
                return cell
                
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.tableCellIdentifier, for: indexPath) as? TableCell else {
                    return UICollectionViewCell()
                }
                cell.configuration(model: Model.albumsModel[indexPath.section][indexPath.item])
                let isLastCell = indexPath.row == (Model.albumsModel[indexPath.section].count - 1) ? true : false
                cell.hidingSeparator(isHide: isLastCell)
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellHeader.cellHeaderIdentifier, for: indexPath) as? CellHeader else {
            return UICollectionReusableView()
        }
        switch indexPath.section {
            case 0:
                header.configuration(headerLeftTitle: "Мои альбомы", headerRightTitle: "Все")
            case 1:
                header.configuration(headerLeftTitle: "Люди и места", headerRightTitle: nil)
            case 2:
                header.configuration(headerLeftTitle: "Типы медиафайлов", headerRightTitle: nil)
            case 3:
                header.configuration(headerLeftTitle: "Другое", headerRightTitle: nil)
            default:
                header.configuration(headerLeftTitle: "Title", headerRightTitle: "title")
        }
        return header
    }
}
