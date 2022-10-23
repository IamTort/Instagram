//
//  ProfileCollectionViewCell.swift
//  Instagram
//
//  Created by angelina on 23.10.2022.
//

import UIKit

/// Ячейка профиля с фотографией
final class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Outlet
    @IBOutlet private weak var profileImageView: UIImageView!
    
    // MARK: - Public method
    func setupImage(image: String) {
        profileImageView.image = UIImage(named: image)
    }
}
