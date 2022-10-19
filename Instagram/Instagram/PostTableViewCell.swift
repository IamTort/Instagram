//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by angelina on 17.10.2022.
//

import UIKit

///  Класс ячейки с постом
final class PostTableViewCell: UITableViewCell {

    // MARK: - Private Outlet
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nickNameLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var likeCountLabel: UILabel!
    @IBOutlet private weak var postLabel: UILabel!
    @IBOutlet private weak var commentImageView: UIImageView!
    
    func setupData(post: Post) {
        avatarImageView.image = UIImage(named: post.image)
        nickNameLabel.text = post.nickName
        postImageView.image = UIImage(named: post.image)
        likeCountLabel.text = post.likeCount
        postLabel.attributedText = setupDeliveryDateLabel(post: post)
        commentImageView.image = UIImage(named: post.image)
    }
    
    private func setupDeliveryDateLabel(post: Post) -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(post.nickName) \(post.postText)")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 12, weight: .bold),
            range: NSRange(location: 1, length: post.nickName.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 12, weight: .regular),
            range: NSRange(location: post.nickName.count + 1, length: post.postText.count)
        )
        return myMutableString
    }
}
