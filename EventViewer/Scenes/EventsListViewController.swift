//
//  EventsListViewController.swift
//  EventViewer
//
//  Created by Ilya Kharlamov on 1/26/23.
//

import UIKit

class EventsListViewController: UITableViewController {
    
    // MARK: - Outlets
    
    private lazy var logoutBarButtonItem = UIBarButtonItem(
        title: "Logout",
        style: .plain,
        target: self,
        action: #selector(EventsListViewController.logout)
    )
    
    // MARK: - Variables
    
    private let eventManager: EventManager
    
    // MARK: - Lifecycle
    
    init(eventManager: EventManager) {
        self.eventManager = eventManager
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.eventManager.capture(.presentScene("events-list"))
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        self.navigationItem.title = "Events List"
        self.navigationItem.rightBarButtonItem = self.logoutBarButtonItem
    }
    
    // MARK: - Actions
    
    @objc
    private func logout() {
        self.eventManager.capture(.logout)
        let vc = LoginViewController(eventManager: self.eventManager)
        let navVc = UINavigationController(rootViewController: vc)
        self.present(navVc, animated: true)
    }
    
}
