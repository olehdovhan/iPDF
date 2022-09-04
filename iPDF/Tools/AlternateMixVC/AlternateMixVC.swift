//
//  AlternateMixVC.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class AlternateMixVC: BaseViewController, DocumentDelegate {
    
    func didPickDocuments(pickDocuments: [Document]?) {
        
        guard let docs = CoreDataManager.shared.getMODocs() else { return }
        fileIndices.append(docs.count - 1)
        vw.tableView.reloadData()
    }
    

    let vw = AlternateMixView()
    var mixManager: AlternateMixManager!
    var documentPicker: DocumentPicker!
    
    override var fileIndices: [Int] {
        didSet {
            guard fileIndices.count >= 2 else {
                vw.mixBtn.backgroundColor = vw.clr(color: .clrLineGray)
                vw.mixBtn.isUserInteractionEnabled = false
                vw.tableView.reloadData()
                return }
            vw.mixBtn.backgroundColor = vw.clr(color: .clrGreenTabTint)
            vw.mixBtn.isUserInteractionEnabled = true
            vw.tableView.reloadData()
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mixManager = AlternateMixManager(indices: fileIndices)

        addTargets()
        view.addSubview(vw)
        vw.frame = view.bounds
        
        vw.tableView.delegate = self
        vw.tableView.dataSource = self
        vw.tableView.register(AlternateCell.self,
                              forCellReuseIdentifier: AlternateCell.id)
        
        documentPicker = DocumentPicker(presentationController: self, delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vw.tableView.reloadData()
    }
    
    func addTargets() {
        vw.backBtn.addTarget(self, action: #selector(leaveCurrentVC), for: .touchUpInside)
        vw.mixBtn.addTarget(self, action: #selector(showLoaderVC), for: .touchUpInside)
        vw.addFilesBtn.addTarget(self,
                                 action: #selector(openDirectory),
                                 for: .touchUpInside)
    }
    
    @objc private func showLoaderVC() {
        let pdfPagesArray = mixManager.mixPages(from: mixManager.models)
        let newFile =  mixManager.createAndSaveDoc(from: pdfPagesArray)
        FileSaver.shared.fileExistsAtPath(name: "Alternated.pdf", document: newFile)
        
        let vc = ExecutionLoaderVC(tool: .alternateMix)
        vc.modalPresentationStyle = .fullScreen
        present(vc,
                animated: true,
                completion: nil)
    }
    
    @objc func showSingleDocumentVC(sender: UIButton) {
        let vc = SingleDocumentVC(index: sender.tag)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) { }
    }
    
    @objc func deleteDoc(sender: UIButton) {
        mixManager.models.remove(at: sender.tag)
        fileIndices.remove(at: sender.tag)
    }
    
    @objc func openDirectory() {
        print("add pressed")
        documentPicker.present()
    }
}

extension AlternateMixVC: UITableViewDelegate, UITableViewDataSource {
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AlternateCell.id,
                                                 for: indexPath) as! AlternateCell
        let fileIndex = fileIndices[indexPath.row]
        guard let docs = CoreDataManager.shared.getMODocs() else { return cell }
        cell.fillCellBy(document: docs[fileIndex])
        cell.settingsBtn.tag = indexPath.row
        cell.settingsBtn.addTarget(self,
                                   action: #selector(showSingleDocumentVC(sender:)),
                                   for: .touchUpInside)
        cell.trashBtn.tag = indexPath.row
        cell.trashBtn.addTarget(self,
                                action: #selector(deleteDoc(sender:)),
                                for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
}
