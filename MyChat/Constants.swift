//
//  Constants.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 22.8.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import Foundation

struct Constants {
    static let brandName = "MyChat"
    static let cellIdentifire = "ReusableCell"
    static let nibCellName = "MessageCell"
    
    struct Segues {
        static let loginSegue = "LogInToChat"
        static let signupSegue = "SignUpToChat"
    }
    
    struct Colors {
        static let lightGray = "LightGray"
    }
    
    struct Fonts {
        static let signPainter = "SignPainter-HouseScript"
    }
    
    struct Images {
        static let outgoingMessageBubbleImage = "OutgoingMessageBubble"
        static let incomingMessageBubbleImage = "IncomingMessageBubble"
    }
}
