//
//  FollowTableViewCell.swift
//  Instagram
//
//  Created by angelina on 20.10.2022.
//

import UIKit

/// Ячейка с подпиской
final class FollowTableViewCell: UITableViewCell {
    // MARK: - Private enum
    private enum Constants {
        static let followText = "Вы подпиcaны"
    }
    
    // MARK: - Private Outlet
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var followLabel: UILabel!
    @IBOutlet private weak var followButton: UIButton!
    
    // MARK: - Public method
    func setupData(follow: Follow) {
        switch follow.buttonView {
        case true:
            userImageView.image = UIImage(named: follow.userImage)
            followLabel.text = follow.text
        case false:
            userImageView.image = UIImage(named: follow.userImage)
            followLabel.text = follow.text
            createButton()
        }
    }
    
    // MARK: - Private method
    private func createButton() {
        followButton.tintColor = .clear
        followButton.layer.masksToBounds = true
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.gray.cgColor
        followButton.layer.cornerRadius = 4
        followButton.setTitleColor(.gray, for: .normal)
        followButton.setTitle(Constants.followText, for: .normal)
    }
}
