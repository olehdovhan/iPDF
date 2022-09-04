//
//  MergeVCViewController.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit
import PDFKit

class MergeVC: BaseViewController {
    
    let vw = MergeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        view.addSubview(vw)
        vw.frame = view.bounds
        
        vw.tableView.delegate = self
        vw.tableView.dataSource = self
        vw.tableView.register(MergeCell.self,
                              forCellReuseIdentifier: MergeCell.id)
    }
    
    private func addTargets() {
        vw.backBtn.addTarget(self, action: #selector(leaveCurrentVC), for: .touchUpInside)
        vw.mergeBtn.addTarget(self, action: #selector(showLoaderVC), for: .touchUpInside)
    }
    
    @objc private func showLoaderVC() {

        let vc = ExecutionLoaderVC(tool: .merge)
        vc.modalPresentationStyle = .fullScreen
        let alert = UIAlertController(title: "Название файла",
                                      message: "Введите имя файла для сохранения",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = "MergedFile"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let textField = alert.textFields![0]
            let newFile = self.mergeFiles()
            
            FileSaver.shared.fileExistsAtPath(name: "\(textField.text!).pdf",
                                              document: newFile!)
            
            self.present(vc,
                    animated: true,
                    completion: nil)
        }))
        present(alert,
                animated: true,
                completion: nil)
    }

    private func mergeFiles() -> PDFDocument?{
        
        guard let docs = CoreDataManager.shared.getMODocs(),
              let string = docs[fileIndices[0]].fileURL,
              let url = URL(string: string )  else { return nil }
        
     let firstDoc = PDFDocument(url: url)
        for i in 0...fileIndices.count - 1 {
            
            var fileIndex = fileIndices[i]
            guard let docs = CoreDataManager.shared.getMODocs(),
                   let string = docs[fileIndex].fileURL,
                   let url2 = URL(string: string )  else { return firstDoc }
            let doc = PDFDocument(url: url2)
            firstDoc?.addPages(from: doc!)
        }
        return firstDoc
    }
}

extension MergeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = fileIndices[sourceIndexPath.row]
        fileIndices.remove(at: sourceIndexPath.row)
        fileIndices.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return fileIndices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MergeCell.id,
                                                 for: indexPath) as! MergeCell
        
        let fileIndex = fileIndices[indexPath.row]
        guard let docs = CoreDataManager.shared.getMODocs()  else { return cell }
        cell.fillCellBy(document: docs[fileIndex])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
}
