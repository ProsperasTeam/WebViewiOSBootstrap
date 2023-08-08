//
//  ViewController.swift
//  Marketplace Webview
//
//  Created by Angelo Vescio on 7/5/23.
//

import UIKit
import WebKit
//import AVFoundation

class ViewController2: UIViewController {

    var apikey = ""
    var sessionId = ""
    var locale = ""
    var url = "https://google.com"
    
    @IBOutlet weak var regresarButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    
    
    override open func loadView() {
        super.loadView()

        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.ignoresViewportScaleLimits = true
        webConfiguration.suppressesIncrementalRendering = true
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = false
        webConfiguration.allowsPictureInPictureMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = .all
        webConfiguration.requiresUserActionForMediaPlayback = true
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.sizeToFit()
        webView.backgroundColor = .black
        webView.isOpaque = false
        //self.webViewContainer.addSubview(webView)
        view = webView

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        if (locale == "en-rUS"){
            self.regresarButton.setTitle( "Back", for: .normal)
        }
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true*/
        abrirSDK()
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true*/
        
    }
    
    func abrirSDK(){
        print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
        url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        //url = "https://dev-prosperas.mdhs.mx/creditos_web/eazul/?fid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
        // Do any additional setup after loading the view.
        
    //https://dev-prosperas.mdhs.mx/creditos_web/eazul/?fid=196743&apikey=53788FFB-B0C2-48C7-929F-7130C2A52128&locale=es-rMX
        
        print("url recibida ::: \(url)")
        url = url.replacingOccurrences(of: " ", with: "")
        print("url ajustada ::: \(url)")
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
        
        
        
        webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    

    @IBAction func regresar(_ sender: Any) {
        abrirSDK()
        
       /* print("mi info es apikey: \(apikey), locale: \(locale), sessionId: \(sessionId)")
          url = "https://creditos-web.prosperas.com?sessionid=\(sessionId)&apikey=\(apikey)&locale=\(locale)"
          // Do any additional setup after loading the view.
          
          print("url recibida ::: \(url)")
          url = url.replacingOccurrences(of: " ", with: "")
          print("url ajustada ::: \(url)")
          webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1"
          
          webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
          webView.allowsBackForwardNavigationGestures = true*/
    }
    
    /*func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                // Permiso concedido, puedes usar la cámara
            } else {
                // Permiso denegado, no puedes usar la cámara
            }
        }
    }*/
    
}

