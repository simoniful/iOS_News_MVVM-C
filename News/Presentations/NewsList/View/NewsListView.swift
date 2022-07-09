//
//  NewsListView.swift
//  News
//
//  Created by Sang hun Lee on 2022/07/09.
//

import UIKit
import SnapKit

final class NewsListView: UIView, ViewRepresentable {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsListViewCell.self, forCellReuseIdentifier: NewsListViewCell.identifier)
        tableView.register(NewsListViewHeader.self, forHeaderFooterViewReuseIdentifier: NewsListViewHeader.identifier)
        tableView.refreshControl = refreshControl
//        tableView.dataSource = presenter
//        tableView.delegate = presenter
//        tableView.prefetchDataSource = presenter
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(didCalledRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    lazy var rightBarButton: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(
            pointSize: 22.0,
            weight: .bold,
            scale: .large
        )
        let largeBoldPlus = UIImage(
            systemName: "plus.circle",
            withConfiguration: largeConfig
        )
        button.setImage(largeBoldPlus, for: .normal)
//        button.addTarget(self, action: #selector(didTapRightBarButton), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
