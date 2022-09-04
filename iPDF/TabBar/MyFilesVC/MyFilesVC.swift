//
//  MyFilesVC.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//
import UIKit

class MyFilesVC: UIViewController, DocumentDelegate {

    func didPickDocuments(pickDocuments: [Document]?) {
    vw.tableView.reloadData()
    }

    var vw: MyFilesView!
    var documentPicker: DocumentPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentPicker = DocumentPicker(presentationController: self, delegate: self)
        setUI()
        vw.addDocumentBtn.addTarget(self,
                                    action: #selector(openDirectory),
                                    for: .touchUpInside)
    }

    @objc func openDirectory() {
        documentPicker.present()
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
         let docs = CoreDataManager.shared.getMODocs()
         return docs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DocumentTVCell.id,
                                                 for: indexPath) as! DocumentTVCell
        guard let docs = CoreDataManager.shared.getMODocs() else { return cell }
                cell.fillCellBy(document: docs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("test")
        guard let docs = CoreDataManager.shared.getMODocs(),
               let string = docs[indexPath.row].fileURL,
               let url = URL(string: string )  else { return }
        
        let vc = PDFViewerVC(url: url)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyFilesVC: UIDocumentPickerDelegate,UINavigationControllerDelegate {
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
     
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
}
