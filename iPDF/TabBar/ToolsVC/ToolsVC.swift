//
//  ToolsVC.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit

class ToolsVC: UIViewController {
    
    var vw: ToolsView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        vw = ToolsView(tabBarHeight: tabBarController!.tabBar.height)
        view.addSubview(vw)
        vw.frame = view.bounds
        vw.tableView.delegate = self
        vw.tableView.dataSource = self
        vw.tableView.register(ToolsTVCell.self,
                              forCellReuseIdentifier: ToolsTVCell.id)
    }

    
}

extension ToolsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return ToolsModel.tools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToolsTVCell.id, for: indexPath) as! ToolsTVCell
        cell.fillCellBy(model: ToolsModel.tools[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 ,
              indexPath.row == 0 || indexPath.row == 1  { return 74 }
        return 54
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      
        guard let toolCase = Tools(rawValue: ToolsModel.tools[indexPath.row].name) else { return }
           
            let vc = SelectFilesVC(tool: toolCase)
        
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true) { }
    }
}

