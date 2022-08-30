//
//  SelectFilesVC.swift
//  iPDF
//
//  Created by O l e h on 30.08.2022.
//

import UIKit

class SelectFilesVC: UIViewController {
    
    private let vw = SelectFilesView()
    var toolIdentifier: Tools
    var docs: [MODocument]
    var selectedIndices = [Int]() {
        didSet {
            var number: Int!
            switch toolIdentifier {
            case .combineReorder: number = 1
            default: number = 2
            }
            guard selectedIndices.count >= number else {
                vw.nextBtn.backgroundColor = vw.clr(color: .clrLineGray)
                vw.nextBtn.isUserInteractionEnabled = false
                return }
            vw.nextBtn.backgroundColor = vw.clr(color: .clrPurpleTabTint)
            vw.nextBtn.isUserInteractionEnabled = true
        }
    }
    
    init(tool: Tools ) {
        self.toolIdentifier = tool
        if let docs = CoreDataManager.shared.getMODocs() {
            self.docs = docs
        } else {
            self.docs = [MODocument]()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        view.addSubview(vw)
        vw.frame = view.bounds
        vw.tableView.delegate = self
        vw.tableView.dataSource = self
        vw.tableView.register(FileTableViewCell.self,
                              forCellReuseIdentifier: FileTableViewCell.id)
        fillUI(by: toolIdentifier)
    }
    
    func fillUI(by tool: Tools) {
        vw.titleLbl.text = tool.rawValue
        vw.purpleDescriptionLbl.text = "Select files that you want to \(tool.rawValue)"
    }
    
    private func addTargets() {
        vw.backBtn.addTarget(self, action: #selector(leaveCurrentVC), for: .touchUpInside)
        vw.nextBtn.addTarget(self, action: #selector(showTool), for: .touchUpInside)
    }
    
    @objc private func showTool(){
//        let vc: BaseViewController!
//
//        switch toolIdentifier {
//        case .alternateMix:
//            vc = AlternateMixVC()
//        case .merge:
//            vc = MergeVC()
//        case .combineReorder:
//            vc = CombineReorderVC()
//        case .compress:
//            vc = CompressVC()
//        }
//        vc.fileIndices = selectedIndices
//        vc.modalPresentationStyle = .fullScreen
//        present(vc,
//                animated: true,
//                completion: nil)
    }
    
    @objc func selectDocs(sender: UIButton) {
        sender.isSelected.toggle()
        switch sender.isSelected {
        case true:
            if !selectedIndices.contains(sender.tag) {
                selectedIndices.append(sender.tag)
            }
        case false:
            if selectedIndices.contains(sender.tag) {
                 selectedIndices = selectedIndices.filter{ $0 != sender.tag }
            }
        }
    }
}

extension SelectFilesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FileTableViewCell.id ,
                                                 for: indexPath) as! FileTableViewCell
        cell.selectFileBtn.tag = indexPath.row
        cell.selectFileBtn.addTarget(self,
                                     action: #selector(selectDocs(sender:)),
                                     for: .touchUpInside)
        cell.fillCellBy(document: docs[indexPath.row])
        return cell
    }
}

