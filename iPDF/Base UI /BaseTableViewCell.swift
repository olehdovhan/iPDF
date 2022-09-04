//
//  BaseTableViewCell.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit
import PDFKit

class BaseTableViewCell: UITableViewCell {

    var sizeLbl = UILabel()
    var fileNameLbl = UILabel()
    var dateLbl = UILabel()
    var thumbnailImgVW = UIImageView()
    
    func fillCellBy(document: MODocument) {
        fileNameLbl.text = document.fileName
        sizeLbl.text = "\(document.size) KB"
        dateLbl.text = document.editDate

        
       
        guard let url = URL(string: document.fileURL!),
              let doc = PDFDocument(url: url)
                                 else { return }

//       let image = makeThumbnail(pdfDocument: doc, page: 0)
       let image = thumbnailFromPdf(withUrl: url,
                                                pageNumber: 1,
                                                width: 65)
        
      self.thumbnailImgVW.image = image
    }
}

