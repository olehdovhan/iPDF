//
//  PDFViewerVC.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit
import PDFKit

class PDFViewerVC: UIViewController {
    
    let pdfView = PDFView()
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = view.clr(color: .alphaWhite)?.cgColor
        let currentDocument = PDFDocument(url: url)
        pdfView.document = currentDocument
         
    }
    
    override func viewDidLayoutSubviews() {
        
            view.ui.universalLayout(object: pdfView,
                                    parentView:view,
                                    topC: 0,
                                    bottomC: 0,
                                    leadingC: 0,
                                    trailingC: 0)
    }
}
