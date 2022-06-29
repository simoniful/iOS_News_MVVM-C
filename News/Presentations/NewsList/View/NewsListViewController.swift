//
//  NewsListViewController.swift
//  News
//
//  Created by Sang hun Lee on 2022/06/24.
//

import UIKit
import SnapKit

class NewsListViewController: UIViewController {
    private lazy var presenter = NewsListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = presenter
        tableView.delegate = presenter
        tableView.register(NewsListViewCell.self, forCellReuseIdentifier: NewsListViewCell.identifier)
        tableView.register(NewsListViewHeader.self, forHeaderFooterViewReuseIdentifier: NewsListViewHeader.identifier)
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didCalledRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension NewsListViewController: NewsListProtocol {
    func setupNavigationBar() {
        navigationItem.title = "NEWS"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func pushToNewsWebViewController(with news: News) {
        let newsWebViewController = NewsWebViewController(news: news)
        navigationController?.pushViewController(newsWebViewController, animated: true)
    }
    
    // header도 리로드 되면서 계속해서 tag가 추가되는 문제 발생
    func reloadTableView() {
        tableView.reloadData()
    }
}

private extension NewsListViewController {
    @objc func didCalledRefresh() {
        presenter.didCalledRefresh()
    }
}
