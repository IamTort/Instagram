//
//  ImagesTableViewCell.swift
//  Instagram
//
//  Created by angelina on 23.10.2022.
//

import UIKit

/// Ячейка с коллекцией фото
final class ImagesTableViewCell: UITableViewCell {

    // MARK: - Private enum
    private enum Constants {
        static let cellIdentifier = "imageCollection"
        static let images = ["cat", "catTwo", "images", "images", "cat", "catTwo", "images", "images",
                             "cat", "catTwo", "images", "images", "cat", "catTwo", "images", "images",
                             "cat", "catTwo", "images", "images",
                             "cat", "catTwo"]
    }
    // MARK: - Private Outlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private property
    private let images = Constants.images
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ImagesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath)
            as? ProfileCollectionViewCell {
            cell.setupImage(image: images[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
