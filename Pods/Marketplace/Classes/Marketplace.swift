//
//  MarketplaceViewController.swift
//  MarketplaceViewController
//
//  Created by Angelo Vescio on 07/08/23.
//
//

import UIKit
import WebKit

public class MarketplaceViewController: UIViewController, WKUIDelegate {
    public var apikey = "f0627e97-48fb-456b-ba05-c20ce8c56105"
    public var locale = "es-rMX"
    public var sessionId = "d/fvIRnSFf2gQslGnCVm/pz7u8K5JTkEFY5w7KJ1rSawvF0tFj68wuL+Zuy2DrEkr8I/dqUj27iW0fg4RyMaU+jsqimIAsTVZnJjjYWpymAwyFRXa7rZyk8nz0jL1DWG"
    public var urlBase = "https://creditos-web.prosperas.com"
    
    private final var sizeMetric : Int = 10
    private final var sizeMetricButtons : Int = 25
    
    var regresarButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var leaveButton: UIButton      = UIButton(type: UIButton.ButtonType.roundedRect)
    var webView: WKWebView!
    var nativeButtonColor: UIColor = UIColor(rgb: 0xBE5300)
    
    public func setNativeButtonColor(rgb: UInt)
    {
        nativeButtonColor = UIColor(rgb: rgb)
    }
    //var topBar : CGRect!
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
        }
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .fullScreen
        
        overrideUserInterfaceStyle = .light
        if (locale == "en-rUS"){
            self.regresarButton.setTitle( "Back", for: .normal)
            self.leaveButton.setTitle( "Return to App", for: .normal)
        } else {
            self.regresarButton.setTitle( "Regresar", for: .normal)
            self.leaveButton.setTitle( "Salida", for: .normal)
        }
        self.createUIElements()
    }
    
    //Functions
    func createUIElements()
    {
        self.createWebview()
        self.createTopBar()
    }
    func createTopBar()
    {
        self.createLeftTopBar()
        self.createRightTopBar()
    }
    func createLeftTopBar()
    {
        //1. Specify the dimensions
        let topBarLeft = CGRect(x: 0.0,
                            y: self.view.frame.maxY - (self.view.frame.height),
                            width: self.view.frame.size.width/2,
                            height: self.view.frame.height/CGFloat(sizeMetric))
        
        //2. Provide the frame to the button
        regresarButton.frame = topBarLeft
        regresarButton.contentHorizontalAlignment = .left
        regresarButton.contentVerticalAlignment = .center
        regresarButton.titleEdgeInsets.left = self.view.frame.size.width/CGFloat(sizeMetricButtons); // add left padding.
        regresarButton.titleEdgeInsets.top = self.view.frame.size.height/CGFloat(sizeMetricButtons); // add right padding.
        regresarButton.setTitleColor(nativeButtonColor, for: .normal	)
        //3. Customise the view attributes
        regresarButton.addTarget(self, action: #selector(MarketplaceViewController.clickMeTapped), for: UIControl.Event.touchDown)
        
        
        //4. Add the view to the subview
        self.view.addSubview(regresarButton)
    }
    func createRightTopBar()
    {
        let topBarRight = CGRect(x: self.view.frame.size.width/2,
                            y: self.view.frame.maxY - (self.view.frame.height),
                            width: self.view.frame.size.width/2,
                            height: self.view.frame.height/CGFloat(sizeMetric))
        
        //2. Provide the frame to the button
        leaveButton.frame = topBarRight
        leaveButton.contentHorizontalAlignment = .right
        leaveButton.titleEdgeInsets.right = self.view.frame.size.width/CGFloat(sizeMetricButtons); // add right padding.
        leaveButton.titleEdgeInsets.top = self.view.frame.size.height/CGFloat(sizeMetricButtons); // add right padding.
        leaveButton.contentVerticalAlignment = .center
        leaveButton.setTitleColor(nativeButtonColor, for: .normal    )
        //3. Customise the view attributes
        leaveButton.addTarget(self, action: #selector(MarketplaceViewController.clickPrevTapped), for: UIControl.Event.touchDown)
        
        //4. Add the view to the subview
        self.view.addSubview(leaveButton)
    }
    func createWebview()
    {
        webView = WKWebView(frame: CGRect(x: 0.0, y: self.view.frame.height/CGFloat(sizeMetric), width: self.view.frame.size.width, height: self.view.frame.height - 
(self.view.frame.height/CGFloat(sizeMetric))))
        webView.uiDelegate = self
        self.view.addSubview(webView)
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.load(myURLRequest)
        
        self.view.addSubview(webView)
    }
    func abrirSDK(){
        let myURL = URL(string: urlBase + "?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)")
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        webView.load(myURLRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    @objc func clickMeTapped()
    {
        abrirSDK()
    }
    @objc func clickPrevTapped()
    {
        dismiss(animated: true, completion: nil)
    }
}
extension UIColor {

    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}

