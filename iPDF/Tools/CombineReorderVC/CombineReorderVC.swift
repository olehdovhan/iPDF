//
//  CombineReorderVC.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class CombineReorderVC: BaseViewController, DocumentDelegate {
    func didPickDocuments(pickDocuments: [Document]?) {
        manager.addNewDoc {
            collectionView.reloadData()
        }
    }
    
    
    var documentPicker: DocumentPicker!
    var collectionView: UICollectionView!
    var vw = CombineReorderView()
    var manager: CombineReorderManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CombineReorderManager(indices: fileIndices)
        view.addSubview(vw)
        vw.frame = view.bounds
        addTargets()
      
        documentPicker = DocumentPicker(presentationController: self,
                                        delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionViewCreator()
    }
    
    private func addTargets() {
        vw.backBtn.addTarget(self, action: #selector(leaveCurrentVC), for: .touchUpInside)
        vw.saveBtn.addTarget(self, action: #selector(showLoaderVC), for: .touchUpInside)
        vw.deleteBarBtn.addTarget(self, action: #selector(deleteModels), for: .touchUpInside)
        vw.turnBarBtn.addTarget(self, action: #selector(rotatePages), for: .touchUpInside)
        vw.reorderBarBtn.addTarget(self, action: #selector(reorder), for: .touchUpInside)
        vw.blancPageBarBtn.addTarget(self, action: #selector(blankPage), for: .touchUpInside)
        vw.addFileBarBtn.addTarget(self, action: #selector(addFiles), for: .touchUpInside)
//        vw.redoBtn.addTarget(self, action: #selector(undoRedo(sender:)), for: .touchUpInside)
//        vw.undoBtn.addTarget(self, action: #selector(undoRedo(sender:)), for: .touchUpInside)
      }

    private func collectionViewCreator() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.wRatio(cW: 184),
                                 height: view.wRatio(cW: 245))
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: 0,
                                           right: 0)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CombineReorderCell.self,
                                forCellWithReuseIdentifier: CombineReorderCell.id)
        
        view.ui.universalLayout(object: collectionView,
                                parentView: vw,
                                width: vw.wRatio(cW: 262),
                                leadingC: 8,
                                centerH: 0,
                                topToO: vw.purpleDescriptionLbl.bottomAnchor,
                                topCG: 53,
                                bottomToO: vw.barButtonStackView.topAnchor,
                                bottomCG: 5)
    }
}

extension CombineReorderVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.tempDocuments[manager.selectedModelIndex].pageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CombineReorderCell.id,
                                                      for: indexPath) as! CombineReorderCell
        
        let doc = manager.tempDocuments[manager.selectedModelIndex]
        cell.document = doc.page(at: indexPath.row )
        cell.number = indexPath.row + 1
        cell.url11 = manager.lastFileUrl!
        cell.fillCellBy(document: doc.page(at: indexPath.row)!,
                        url: manager.lastFileUrl!,
                        number: indexPath.row + 1)
        cell.selectFileBtn.tag = indexPath.row
        cell.selectFileBtn.addTarget(self, action: #selector(selectPage), for: .touchUpInside)
        return cell
    }
}

// Objc Methods
extension CombineReorderVC {
    
    @objc private func showLoaderVC() {
        manager.finalSave()
        let vc = ExecutionLoaderVC(tool: .combineReorder)
        vc.modalPresentationStyle = .fullScreen
        present(vc,
                animated: true,
                completion: nil)
    }
    
    @objc func selectPage(_ sender: UIButton) {
        sender.isSelected.toggle()
        manager.selectPage(sender)
        
    }
    
    @objc func deleteModels() {
        
        manager.deletePages()
        collectionView.reloadData()
    }
    
    @objc func rotatePages() {
        manager.rotatePages()
        collectionView.reloadData()
    }
    
    @objc func reorder() {
        manager.reorderPages()
        collectionView.reloadData()
    }
    
    @objc func blankPage() {
        manager.addBlankPage()
        collectionView.reloadData()
    }
    
    @objc func addFiles() {
        documentPicker.present()
    }
    
    // функцию initializePage -> сделай по url чтобы можно было ходить по index-ам массива
    @objc func undoRedo(sender: UIButton) {
        switch sender.tag {
        case 0:
            guard manager.selectedModelIndex != 0 else {
                sender.isSelected = false
                return }
        // отпринть selectedModelIndex по построению
          manager.selectedModelIndex -= 1
          manager.fillPageModels()
          collectionView.reloadData()
            
        case 1:
            guard manager.selectedModelIndex != manager.urls.count - 1 else {
                sender.isSelected = false
                return }
            manager.selectedModelIndex += 1
            
        default: break
        }
    }
}
