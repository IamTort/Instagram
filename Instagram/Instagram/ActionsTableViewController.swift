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
        static let follows = [Follow(userImageName: "cat",
                                               text: "zvenkova есть в Instagram. Вы можете знать этого человека.",
                                               isFollow: true),
                                Follow(userImageName: "images",
                        text: "zvenkova есть в Instagram. Вы можете знать этого человека.", isFollow: true),
                                Follow(userImageName: "images", text: "zvenkova подписался(-ась) на ваши обновления.",
                                            isFollow: false)]
        static let commentArray = [Comment(userImageName: "images", name: "mark_antonov",
                                       postText: "нравится ваше видео.", friendImageName: "cat", time: "2 days"),
                               Comment(userImageName: "catTwo", name: "olga2r",
                    postText: "упомянул(-а) вас в комментарии: спасибо,  и вам того же",
                                       friendImageName: "cat", time: "1 days"),
                               Comment(userImageName: "images", name: "olga",
                    postText: "понравился ваш комментарий: \"беспощадность наше всё\"",
                                       friendImageName: "cat", time: "54 days"),
                               Comment(userImageName: "cat", name: "olga",
                                       postText: "нравится ваше видео.", friendImageName: "cat", time: "4 day"),
                               Comment(userImageName: "catTwo", name: "olga",
                    postText: "упомянул(-а) вас в комментарии: @nsjared и @alexKokh, спасибо",
                                       friendImageName: "images", time: "7 day")]
    }
    
    private enum TableCellsTypes {
        case comment
        case follow
    }
    
    private enum TableSectionTypes: Int {
        case today = 0
        case lastWeek = 1
    }
    
    // MARK: - Private Visual Componants
    private let refreshContrl = UIRefreshControl()

    // MARK: - Private property
    private let cellsTypes: [TableCellsTypes] = [.follow, .comment]
    private let secondSections: [TableCellsTypes] = [.follow, .comment, .follow, .comment, .comment]
    private let comments = Constants.commentArray
    private let follows = Constants.follows
    
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
        refreshContrl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refreshContrl)
    }
    
    // MARK: - Private Action
    @objc private func handleRefreshAction() {
        refreshContrl.endRefreshing()
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
        case TableSectionTypes.today.rawValue:
            return Constants.todayText
        case TableSectionTypes.lastWeek.rawValue:
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
        case TableSectionTypes.today.rawValue:
            return cellsTypes.count
        case TableSectionTypes.lastWeek.rawValue:
            return secondSections.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellstype = secondSections[indexPath.row]
        switch cellstype {
        case .comment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.commentIdentifier, for: indexPath)
                    as? CommentTableViewCell else { return UITableViewCell() }
            cell.setupData(comment: comments[indexPath.row])
            return cell
        case .follow:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.followIdentifier, for: indexPath)
                    as? FollowTableViewCell else { return UITableViewCell() }
            cell.setupData(follow: follows[indexPath.row])
            return cell
        }
    }
}
