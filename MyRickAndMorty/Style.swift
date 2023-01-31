//
//  Style.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import SwiftUI
import SwiftUI_CSS

struct Style {
    static let charactersScreenTitle = CSSStyle([
        .font(.title),
        .foregroundColor(.black)
    ])

    static let charactersScreenRow = CSSStyle([
        .backgroundColor(Color(white: 0.5)),
        .cornerRadius(10)
    ])

    static let charactersScreenRowImage = CSSStyle([
        .frame(width: 50, height: 50, alignment: .center),
        .paddingTLBT(0, 5, 0, 0)
    ])

    static let charactersScreenRowTitle = CSSStyle([
        .font(.headline),
        .foregroundColor(.black),
        .paddingTLBT(10, 0, 0, 10)
    ])

    static let charactersScreenRowDescription = CSSStyle([
        .font(.body),
        .foregroundColor(.black),
        .paddingTLBT(0, 0, 10, 10)
    ])

    static let characterScreenImage = CSSStyle([
        .frame(width: 200, height: 200, alignment: .center)
    ])

    static let characterScreenLabel = CSSStyle([
        .font(.body),
        .foregroundColor(.white),
        .backgroundColor(.black)
    ])
}
