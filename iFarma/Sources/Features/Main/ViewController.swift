//
//  ViewController.swift
//  iFarma
//
//  Created by Mauricio Hernandez on 2/12/19.
//  Copyright © 2019 MHO. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    var idSession: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        print(idSession)
    }

    
}

