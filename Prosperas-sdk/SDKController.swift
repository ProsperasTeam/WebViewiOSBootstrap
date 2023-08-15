//
//  ViewController.swift
//  Prosperas-sdk
//
//  Created by Endrit on 9.8.23.
//

import UIKit

class SDKController: UIViewController {
    
    var sdkView: SDKView

    init() {
        // Initialize sdkView
        self.sdkView = SDKView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    // Setting up the view for SDKView
    func setupView() {
        sdkView.frame = view.bounds
        self.view.addSubview(sdkView)
    }
}
