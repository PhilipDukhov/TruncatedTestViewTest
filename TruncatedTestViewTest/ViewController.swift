//
//  ViewController.swift
//  TruncatedTestViewTest
//
//  Created by Philip Dukhov on 6/22/20.
//  Copyright © 2020 Philip Dukhov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    private let maxTextViewSize: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainerInset = .zero
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let boundingRect = (textView.text as NSString).boundingRect(
            with: .init(width: textView.frame.width, height: maxTextViewSize),
            options: .usesLineFragmentOrigin,
            attributes: [ .font: textView.font! ],
            context: nil
        )
        textViewHeightConstraint.constant = boundingRect.height.rounded(.up)
    }

}

