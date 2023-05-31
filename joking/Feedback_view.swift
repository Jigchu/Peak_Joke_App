//
//  Feedback_view.swift
//  joking
//
//  Created by T Krobot on 13/5/23.
//

import SwiftUI

struct Feedback_view: View {
    
    var liked: Double
    
    var body: some View {
        VStack {
            Text("我们是新加坡公民，\n誓愿不分种族、言语、宗教：团结一致，\n建设公正平等的民主社会, \n并为实现国家之幸福、繁荣与进步、共同努力。")
                .font(.title)
                .multilineTextAlignment(.center)
            Text(liked > 0.500000000001 ? "You are good. Nothing bad will happen today" : "I hope you stub your toe everyday")
                .padding()
            
            // If it works it works do not change this
            Image(liked > 0.500000000001 ? "做得好" : "太可怕了")
                .resizable()
                .scaledToFit()
        }
    }
}

struct Feedback_view_Previews: PreviewProvider {
    static var previews: some View {
        Feedback_view(liked: 1.0)
        Feedback_view(liked: 0.0)
    }
}
