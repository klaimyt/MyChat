//
//  MessageCell.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 26.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var messageModel: Message! {
        didSet {
            messageLabel.text = messageModel.messageText
            
            if messageModel.messageSender == "me" {
                avatarImageView.isHidden = true
                trailingConstraint.isActive = true
                leadingConstraint.isActive = false
                
                messageLabel.textColor = .white
                messageBubbleImageView.image = outgoingMessageBubbleImage
            } else {
                avatarImageView.isHidden = false
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
                
                messageLabel.textColor = .black
                messageBubbleImageView.image = incomingMessageBubbleImage
            }
        }
    }
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        imageView.widthAnchor.constraint(equalToConstant: 30),
        imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        let image = UIImage(named: "FLogo") //This image only for testing
        imageView.image = image
        return imageView
    }()
    
    let messageBubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    let incomingMessageBubbleImage: UIImage? = {
        let image = UIImage(named: Constants.Images.incomingMessageBubbleImage)?
        .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        
        return image
    }()
    
    let outgoingMessageBubbleImage: UIImage? = {
        let image = UIImage(named: Constants.Images.outgoingMessageBubbleImage)?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        
        return image
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(avatarImageView)
        addSubview(messageBubbleImageView)
        addSubview(messageLabel)
        
        let constraints = [
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        messageLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, constant: -90),
        
        messageBubbleImageView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -15),
        messageBubbleImageView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 15),
        messageBubbleImageView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10),
        messageBubbleImageView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10)
        ]
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20)
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
