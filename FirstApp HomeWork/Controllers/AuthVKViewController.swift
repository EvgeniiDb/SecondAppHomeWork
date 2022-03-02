//
//  AuthVKViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 01.03.2022.
//

import UIKit
import WebKit

class AuthVKViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlComponetns = URLComponents()
         urlComponetns.scheme = "https"
         urlComponetns.host = "oauth.vk.com"
         urlComponetns.path = "/authorize"
         
         urlComponetns.queryItems = [
         URLQueryItem(name: "client_id", value: "8090757"),
         URLQueryItem(name: "display", value: "mobile"),
         URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
         URLQueryItem(name: "scope", value: "262150"),
         URLQueryItem(name: "response_type", value: "token"),
         URLQueryItem(name: "v", value: "5.68"),
         ]
         
         let request = URLRequest(url: urlComponetns.url!)
         
        print("Yes") //выводим в консоль
         webView.load(request)
       
    }
}


extension AuthVKViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
                  return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map({ $0.components(separatedBy: "=")})
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        _ = params["access_token"]
        decisionHandler(.cancel)
    }

    
    
    
}
