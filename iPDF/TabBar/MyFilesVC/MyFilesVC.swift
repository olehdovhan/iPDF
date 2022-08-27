//
//  MyFilesVC.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

class MyFilesVC: UIViewController{

    var vw: MyFilesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        vw.addDocumentBtn.addTarget(self,
                                    action: #selector(openDirectory),
                                    for: .touchUpInside)
    }

    @objc func openDirectory() {

    }
    
    func setUI() {
        view.layer.backgroundColor = UIColor.white.cgColor
        vw = MyFilesView(tabBarHeight: tabBarController!.tabBar.height)
        view.addSubview(vw)
        vw.frame = view.bounds
        vw.tableView.delegate = self
        vw.tableView.dataSource = self
        vw.tableView.register(DocumentTVCell.self,
                             forCellReuseIdentifier: DocumentTVCell.id)
    }
}

extension MyFilesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DocumentTVCell.id,
                                                 for: indexPath) as! DocumentTVCell

        return cell
    }
    

}

