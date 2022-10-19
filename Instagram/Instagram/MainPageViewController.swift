//
//  ViewController.swift
//  Instagram
//
//  Created by angelina on 17.10.2022.
//

import UIKit

/// Контроллер экрана главной страницы Инстаграмма
final class MainPageViewController: UIViewController {
    
    // MARK: - Private enum
    private enum Constants {
        static let postOne = Post(nickName: "angelina", image: "cat", likeCount: "45",
                                  
                                  postText: "Учить или не учить, вот в чем вопрос!")
        static let postTwo = Post(nickName: "sivak1554", image: "cat", likeCount: "3 425",
                                  postText: "А ты был на роадмапе?")
        static let postThree = Post(nickName: "angelina", image: "cat", likeCount: "45",
                                    postText: "А ты был на роадмапе?")
        static let postFour = Post(nickName: "nsjared", image: "images", likeCount: "39 004",
                                   postText: "На роадмапе не был - не мужик!")
        static let postFive = Post(nickName: "enter_34", image: "catTwo", likeCount: "178",
                                   postText: "Учить или не учить, вот в чем вопрос!")
        static let scrollIdentifire = "scrollCell"
        static let postIdentifire = "postCell"
        static let recommendationIdentifire = "recommendationCell"
    }
    
    // MARK: - Private Outlet
    @IBOutlet private weak var mainTableView: UITableView!
    
    // MARK: - Private property
    private let refresh = UIRefreshControl()
    private let posts = [ Constants.postOne,
                          Constants.postTwo,
                          Constants.postThree,
                          Constants.postFour,
                          Constants.postFive]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefresh()
    }
    
    // MARK: - Private methods
    private func setupRefresh() {
        refresh.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        mainTableView.addSubview(refresh)
    }
    
    // MARK: - Private Action
    @objc private func handleRefreshAction() {
        refresh.endRefreshing()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.scrollIdentifire, for: indexPath)
            return cell
        case 1, 3...:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifire, for: indexPath)
                    as? PostTableViewCell else { return UITableViewCell() }
            let post = posts[indexPath.row]
            cell.setupData(post: post)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recommendationIdentifire, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
