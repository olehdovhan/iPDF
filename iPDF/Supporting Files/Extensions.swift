//
//  Extensions.swift
//  iPDF
//
//  Created by O l e h on 26.08.2022.
//

import UIKit
import PDFKit
   

extension PDFDocument {
       func addPages(from document: PDFDocument) {
           let pageCountAddition = document.pageCount
           for pageIndex in 0..<pageCountAddition {
               guard let addPage = document.page(at: pageIndex) else {
                   break
               }
               self.insert(addPage, at: self.pageCount)
           }
       }
   }

extension String {
    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    func stringBefore(_ delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            return String(prefix(upTo: index))
        } else {
            return ""
        }
    }
    
    func stringAfter(_ delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            return String(suffix(from: index).dropFirst())
        } else {
            return ""
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIView {
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
    
    public var top: CGFloat {
        return frame.origin.y
    }
    
    public var bottom: CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    public var left: CGFloat {
        return frame.origin.x
    }
    
    public var right: CGFloat {
        return frame.origin.x + frame.size.width
    }
    
    var ui: SetUIManager {
         SetUIManager()
    }
    
    var w: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    var h: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    func image(img: Images) -> UIImage? {
        let image = UIImage(named: img.rawValue)
        return image ?? nil
    }
    
    func clr(color: Colors) -> UIColor? {
        let color = UIColor(named: color.rawValue)
        return color ?? nil
    }
    
    func hRatio(cH: CGFloat) -> CGFloat {
        // device screen height in figma
        let hScreen = 844.0
        let value = hScreen / cH
        let ratio = h / value
        return ratio
    }
    
    func wRatio(cW: CGFloat) -> CGFloat {
        // device screen width in figma
        let wScreen = 390.0
        let value = wScreen / cW
        let ratio = w / value
        return ratio
    }
    func makeThumbnail(pdfDocument: PDFDocument?, page: Int) -> UIImage? {
            return pdfDocument?.page(at: page)?.thumbnail(of: CGSize(width: 40, height: 40), for: .artBox)
    }
    
    func thumbnailFromPdf(withUrl url: URL, pageNumber: Int = 1, width: CGFloat = 240) -> UIImage? {
        
        guard
            let pdf = CGPDFDocument(url as CFURL),
            let page = pdf.page(at: pageNumber)
        else { return nil }
        

        var pageRect = page.getBoxRect(.mediaBox)
        let pdfScale = width / pageRect.size.width
        pageRect.size = CGSize(width: pageRect.size.width * pdfScale, height: pageRect.size.height * pdfScale)
        pageRect.origin = .zero

        UIGraphicsBeginImageContext(pageRect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.white.cgColor)
            context.fill(pageRect)
            context.saveGState()

            context.translateBy(x: 0.0, y: pageRect.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            context.concatenate(page.getDrawingTransform(.mediaBox, rect: pageRect, rotate: 0, preserveAspectRatio: true))
            
            context.drawPDFPage(page)
            context.restoreGState()
        }

        let image = UIGraphicsGetImageFromCurrentImageContext()
        defer { UIGraphicsEndImageContext() }
        return image
    }
}

extension UIViewController {
    @objc func leaveCurrentVC() {
        dismiss(animated: true)
        
    }
}
