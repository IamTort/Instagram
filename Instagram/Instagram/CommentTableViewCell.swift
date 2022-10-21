//
//  CommentCell.swift
//  Instagram
//
//  Created by angelina on 20.10.2022.
//

import UIKit

/// Ячейка с комментарием
final class CommentTableViewCell: UITableViewCell {

    // MARK: - Private Outlet
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var friendImageView: UIImageView!
    
    // MARK: - Puplic method
    func setupData(comment: Comment) {
        userImageView.image = UIImage(named: comment.userImageName)
        commentLabel.attributedText = setupDeliveryDateLabel(comment: comment)
        friendImageView.image = UIImage(named: comment.friendImageName)
    }

    // MARK: - Private method
    private func setupDeliveryDateLabel(comment: Comment) -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(comment.name) \(comment.postText) \(comment.time)")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 16, weight: .bold),
            range: NSRange(location: 0, length: comment.name.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 16, weight: .regular),
            range: NSRange(location: comment.name.count + 1, length: comment.postText.count)
        )
        
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.gray,
            range: NSRange(location: comment.name.count + comment.postText.count + 2, length: comment.time.count)
        )
        return myMutableString
    }
}
