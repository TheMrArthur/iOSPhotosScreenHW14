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
                cell.setupCell = Model.albumsModel[indexPath.section][indexPath.item]
                return cell
                
            default:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCell.tableCellIdentifier, for: indexPath) as? TableCell else {
                    return UICollectionViewCell()
                }
                cell.setupCell = Model.albumsModel[indexPath.section][indexPath.item]
                let isLastCell = indexPath.row == (Model.albumsModel[indexPath.section].count - 1) ? true : false
                cell.hidingSeparator(isHide: isLastCell)
                return cell
        }
    }
}
