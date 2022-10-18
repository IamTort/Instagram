//
//  ViewController.swift
//  Instagram
//
//  Created by angelina on 17.10.2022.
//

import UIKit

/// Контроллер экрана главной страницы Инстаграмма
final class ViewController: UIViewController {
    
    // MARK: - Private enum
    private enum Constants {
        static let nickNames = ["angelina", "sivak1554", "nsjared", "enter_34", "samson_zvo", "angelina"]
        static let texts = ["Учить или не учить, вот в чем вопрос!",
                            "А ты был на роадмапе?",
                            "В инстаграмме только и разговоров о роадмапе и его авторе",
                            "На роадмапе не был - не мужик!",
                            "Учить или не учить, вот в чем вопрос!",
                            "В инстаграмме только и разговоров о роадмапе и его авторе"]
        static let looks = ["3 425", "45", "66 533", "39 004", "178", "384", "28"]
        static let images = ["cat", "cat", "images", "images", "catTwo", "images"]
        static let scrollIdentifire = "scrollCell"
        static let postIdentifire = "postCell"
        static let recommendationIdentifire = "recommendationCell"
    }
    
    // MARK: - Private Outlet
    @IBOutlet private weak var mainTableView: UITableView!
    
    // MARK: - Private property
    private let nickNames = Constants.nickNames
    private let texts = Constants.texts
    private let looks = Constants.looks
    private let images = Constants.images
    private let refresh = UIRefreshControl()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefresh()
    }
    
    // MARK: - Private methods
    private func setupRefresh() {
        self.refresh.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        mainTableView.addSubview(refresh)
    }
    
    private func setupDeliveryDateLabel(index: Int) -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(nickNames[index]) \(texts[index])")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 12, weight: .bold),
            range: NSRange(location: 1, length: nickNames[index].count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 12, weight: .regular),
            range: NSRange(location: nickNames[index].count + 1, length: texts[index].count)
        )
        return myMutableString
    }
    
    // MARK: - Private Action
    @objc func handleRefreshAction() {
        refresh.endRefreshing()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.scrollIdentifire, for: indexPath)
            return cell
        case 1, 3...:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifire, for: indexPath)
                    as? PostTableViewCell else { return UITableViewCell() }
            cell.nickNameLabel.text = nickNames[indexPath.row]
            cell.avatarImageView.image = UIImage(named: images[indexPath.row])
            cell.postImageView.image = UIImage(named: images[indexPath.row])
            cell.postLabel.attributedText = setupDeliveryDateLabel(index: indexPath.row)
            cell.likeCountLabel.text = looks[indexPath.row]
            cell.commentImageView.image = UIImage(named: images[indexPath.row])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recommendationIdentifire, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
