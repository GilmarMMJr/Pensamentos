//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Gilmar Junior on 15/09/21.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoBgImageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    let config = Configuration.shared
    
    let quotesManager = QuotesManager()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { notification in
            
            self.formatView()
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatView(){
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        quoteLabel.textColor = config.colorScheme == 0 ? .black : .white
        authorLabel.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    func prepareQuote()  {
        timer?.invalidate()
        if config.autoRefresh{
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { timer in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        
        quoteLabel.text = quote.quote
        authorLabel.text = quote.author
        photoImageView.image = UIImage(named: quote.image)
        photoBgImageView.image = photoImageView.image
        
        quoteLabel.alpha = 0.0
        authorLabel.alpha = 0.0
        photoImageView.alpha = 0.0
        photoBgImageView.alpha = 0.0
        
        topConstraint.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            
            self.quoteLabel.alpha = 1.0
            self.authorLabel.alpha = 1.0
            self.photoImageView.alpha = 1.0
            self.photoBgImageView.alpha = 0.25
            
            self.topConstraint.constant = 10
            self.view.layoutIfNeeded()
        }
    }

}
