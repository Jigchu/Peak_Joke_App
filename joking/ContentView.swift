//
//  ContentView.swift
//  joking
//
//  Created by T Krobot on 29/4/23.
//

import SwiftUI

struct ContentView: View {
    
    private let jokes: [Joke] = [
        Joke(
            setup:"Why did the scarecrow win an award?",
            punchline: "Because he was outstanding in his field."
        ),
        Joke(
            setup: "I told my wife she was drawing her eyebrows too high.",
            punchline: "She looked surprised."
        ),
        Joke(
            setup: "Did you hear about the kidnapping at the park?",
            punchline: "They woke up."
        ),
        Joke(
            setup: "I'm reading a book on the history of glue.",
            punchline: "I just can't seem to put it down."
        ),
        Joke(
            setup: "What did the grape say when it got stepped on?",
            punchline: "Nothing, it just let out a little wine."
        ),
        Joke(
            setup: "Why don't scientists trust atoms?",
            punchline: "Because they make up everything."
        ),
        Joke(
            setup: "Why did the tomato turn red?",
            punchline: "Because it saw the salad dressing."
        ),
        Joke(
            setup: "I used to play the piano by ear.",
            punchline: "Now I use my hands."
        ),
        Joke(
            setup: "Why did the chicken cross the playground?",
            punchline: "To get to the other slide."
        ),
        Joke(
            setup: "What do you call a fake noodle?",
            punchline: "An impasta."
        )
    ]
    
    @State private var joke_num: Int = 0
    @State private var show_punchline: Bool = false
    @State private var show_alert: Bool = false
    @State private var liked: Double = 1
    @State private var show_sheet: Bool = false
    @State private var punchline_size: Double = 0.1
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text(jokes[joke_num].setup)
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            
                Spacer()
                if show_punchline {
                    Text(jokes[joke_num].punchline)
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                        .opacity(show_punchline ? 1.0 : 0.0)
                        .scaleEffect(punchline_size)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1)) {
                                punchline_size = 1
                            }
                        }
                        .onDisappear {
                            punchline_size = 0.1
                        }
                    
                    Text("Tap anywhere to continue")
                        .bold()
                        .padding()
                }
                    
                Spacer()
                
                Button {
                    show_punchline = true
                } label: {
                    Text("Tell me!")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20.0)
                }
                
            }
            .padding()
        }
        .alert("Did you like the last joke?", isPresented: $show_alert) {
            Button("YES", role: .destructive) {
                show_sheet = true
                liked = 1
            }
            Button("Kind of", role: .destructive) {
                show_sheet = true
                liked = 0.8383291094
            }
            Button("Slightly above 'Slightly above 'Meh' rating'", role: .destructive) {
                show_sheet = true
                liked = 0.60000000001
            }
            Button("Slightly above 'Meh' rating", role: .destructive) {
                show_sheet = true
                liked = 0.6
            }
            Button("Meh", role: .destructive) {
                show_sheet = true
                liked = 0.5
            }
            Button("Slightly below 'Meh' rating", role: .destructive) {
                show_sheet = true
                liked = 0.4
            }
            Button("NO", role: .destructive) {
                show_sheet = true
                liked = 0
            }
            Button("Very below 'Meh' rating", role: .destructive) {
                show_sheet = true
                liked = -21478142
            }
            Button("π", role: .cancel) {
                show_sheet = true
                liked = 3.14159265358979323
            }
        }
        .sheet(isPresented: $show_sheet) {
            Feedback_view(liked: liked)
        }
        .onTapGesture {
            if show_punchline {
                
                for _ in 1...10000 {
                    // This is a sleep without sleeping. Very scuffed
                }
                
                show_alert = true
                
                show_punchline = false
                
                if joke_num == jokes.count - 1 {
                    joke_num = 0
                }
                else if liked < 0.500000000001{
                    // Crashes the app if you do not like the joke
                    joke_num = 130948
                }
                else {
                    joke_num += 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
