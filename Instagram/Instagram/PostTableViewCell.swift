//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by angelina on 17.10.2022.
//

import UIKit

///  Класс ячейки с постом
final class PostTableViewCell: UITableViewCell {

    // MARK: - Outlet
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var commentImageView: UIImageView!
}
