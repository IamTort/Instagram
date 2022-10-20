//
//  ActionsTableViewController.swift
//  Instagram
//
//  Created by angelina on 19.10.2022.
//

import UIKit

/// Контроллер экрана Действия
final class ActionsTableViewController: UITableViewController {
    // MARK: - Private enum
    private enum Constants {
        static let followIdentifier = "followCell"
        static let commentIdentifier = "cell"
        static let weekText = "На этой неделе"
        static let todayText = "Сегодня"
        static let emptyText = ""
        static let followArray = [Follow(userImage: "cat",
                                               text: "zvenkova есть в Instagram. Вы можете знать этого человека.",
                                               buttonView: true),
                                Follow(userImage: "images",
                        text: "zvenkova есть в Instagram. Вы можете знать этого человека.", buttonView: true),
                                Follow(userImage: "images", text: "zvenkova подписался(-ась) на ваши обновления.",
                                            buttonView: false)]
        static let commentArray = [Comment(userImage: "images", name: "mark_antonov",
                                       postText: "нравится ваше видео.", friendImage: "cat", time: "2 days"),
                               Comment(userImage: "catTwo", name: "olga2r",
                    postText: "упомянул(-а) вас в комментарии: спасибо,  и вам того же",
                                       friendImage: "cat", time: "1 days"),
                               Comment(userImage: "images", name: "olga",
                    postText: "понравился ваш комментарий: \"беспощадность наше всё\"",
                                       friendImage: "cat", time: "54 days"),
                               Comment(userImage: "cat", name: "olga",
                                       postText: "нравится ваше видео.", friendImage: "cat", time: "4 day"),
                               Comment(userImage: "catTwo", name: "olga",
                    postText: "упомянул(-а) вас в комментарии: @nsjared и @alexKokh, спасибо",
                                       friendImage: "images", time: "7 day")]
    }
    
    private enum TableCellsTypes {
        case comment
        case follow
    }
    
    // MARK: - Private property
    private let cellsTypes: [TableCellsTypes] = [.follow, .comment]
    private let secondSection: [TableCellsTypes] = [.follow, .comment, .follow, .comment, .comment]
    private let refresh = UIRefreshControl()
    private let commentsRow = Constants.commentArray
    private let followRow = Constants.followArray
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefresh()
        setupNavBar()
    }

    // MARK: - Private methods
    private func setupNavBar() {
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupRefresh() {
        refresh.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refresh)
    }
    
    // MARK: - Private Action
    @objc private func handleRefreshAction() {
        refresh.endRefreshing()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        headerView.backgroundConfiguration?.backgroundColor = .black
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return Constants.todayText
        case 1:
            return Constants.weekText
        default:
            return Constants.emptyText
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cellsTypes.count
        case 1:
            return secondSection.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellstype = secondSection[indexPath.row]
        switch cellstype {
        case .comment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.commentIdentifier, for: indexPath)
                    as? CommentTableViewCell else { return UITableViewCell() }
            cell.setupData(comment: commentsRow[indexPath.row])
            return cell
        case .follow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.followIdentifier, for: indexPath)
                    as? FollowTableViewCell else { return UITableViewCell() }
            cell.setupData(follow: followRow[indexPath.row])
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
