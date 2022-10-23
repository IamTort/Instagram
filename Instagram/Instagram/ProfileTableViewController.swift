//
//  ProfileTableViewController.swift
//  Instagram
//
//  Created by angelina on 23.10.2022.
//

import UIKit

/// Контроллер профиля
final class ProfileTableViewController: UITableViewController {
    
    // MARK: - Private enum
    private enum Constants {
        static let avatarIdentifier = "avaCell"
        static let infoIdentifier = "infoCell"
        static let storiesIdentifier = "storiesCell"
        static let imagesIdentifier = "imagesCell"
    }
    
    private enum TableCellsTypes {
        case avatar
        case info
        case stories
        case images
    }
    
    // MARK: - Private property
    private let cellsTypes: [TableCellsTypes] = [.avatar, .info, .stories, .images]
    private let refreshContrl = UIRefreshControl()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupRefresh()
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellstype = cellsTypes[indexPath.row]
        switch cellstype {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.avatarIdentifier, for: indexPath)
            return cell
        case .info:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.infoIdentifier, for: indexPath)
            return cell
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifier, for: indexPath)
            return cell
        case .images:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.imagesIdentifier, for: indexPath)
                as? ImagesTableViewCell {
                return cell
            }
            return UITableViewCell()
        }
    }
}
