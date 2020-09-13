//
//  MessageModel.swift
//  MyChat
//
//  Created by Ivan Klimenkov on 6.9.2020.
//  Copyright © 2020 Ivan Klimenkov. All rights reserved.
//

import Foundation

struct Message {
    let messageText: String
    let messageSender: String
    let messageDate = Date()
}
