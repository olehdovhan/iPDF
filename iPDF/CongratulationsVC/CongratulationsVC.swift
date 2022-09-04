//
//  CongratulationsVC.swift
//  iPDF
//
//  Created by O l e h on 03.09.2022.
//

import UIKit

class CongratulationsVC: UIViewController {
    
    var vw: CongratulationVW!
    var toolIdentier: Tools
    
    init(tool: Tools ) {
        self.toolIdentier = tool
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vw = CongratulationVW(tool: toolIdentier)
        view.addSubview(vw)
        vw.frame = view.bounds
        vw.goToFilesBtn.addTarget(self, action: #selector(showFilesVC), for: .touchUpInside)
    }
    
    @objc private func showFilesVC() {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) { }
    }
}
