//
//  ViewController.swift
//  PDFKitSample
//
//  Created by JW_Macbook on 2018. 8. 30..
//  Copyright © 2018년 JW_Macbook. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {

    // Sample PDFView(UIView)
    @IBOutlet weak var pdfView: PDFView!
    
    // Sample ThumtableView
    @IBOutlet weak var thumTableView: UITableView!
    
    var pdfThumArray:NSMutableArray = NSMutableArray()
    var localPdfDocument:PDFDocument?
    
    /// PDFView Setting..
    func loadPdfView() {
        // 1. Main PdfViewer
        
        // Sample Pdf File..
        // web Sample Pdf
        // http://gahp.net/wp-content/uploads/2017/09/sample.pdf
//        let url = URL(string: "http://gahp.net/wp-content/uploads/2017/09/sample.pdf")
        
        // local Sample Pdf
        let url = Bundle.main.url(forResource: "genesis-catalogue", withExtension: "pdf")
        
        if let pdfDocument = PDFDocument(url: url!) {
            pdfView.autoScales = true
            pdfView.displayMode = .singlePageContinuous
            pdfView.displayDirection = .vertical
            pdfView.document = pdfDocument
            
            // Thum Image..
            localPdfDocument = pdfDocument
            self.view.bringSubview(toFront: self.thumTableView)
            self.thumTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadPdfView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - UITablView Delegate, DataSource Extention
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localPdfDocument?.pageCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let page = localPdfDocument?.page(at: indexPath.row)
        return UITableViewCell()
    }
    
    
}

