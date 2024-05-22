import SwiftUI

struct ListView: View {
    @State private var questions = ["I went skinny dipping", "Win an argument", "Attempted DIY home"]
    @State var markedAnswers: [Bool] = [false, true, true] // Provide initial values for markedAnswers
    @State private var showChatRoom = false
    var matchScore = 66
    
    var body: some View {
        ZStack{
            Image("blurbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
            
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 358, height: 650.27)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                
                    .overlay(
                        VStack(spacing: 0) {
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.showChatRoom = true
                                }) {
                                    Image("Crossbutton")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(15)
                                }
                            }
                            .fullScreenCover(isPresented: $showChatRoom) {
                                ChatRoom() // Navigate to the chat room
                            }
                            
                            Image("Listimg01")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 186.99, height: 125.07)
                                .padding(24)
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 310, height: 213)
                                .padding(10)
                                .overlay(
                                    ScrollView {
                                        VStack(spacing: 10) {
                                            ForEach(0..<questions.count, id: \.self) { index in
                                                HStack {
                                                    Spacer()
                                                    Text(markedAnswers[index] ? "🤝🏼" : "💀")
                                                        .font(.custom("Outfit", size: 16))
                                                        .foregroundColor(Color(red: 126/255, green: 126/255, blue: 126/255))
                                                        .frame(width: 30, height: 30)
                                                        .padding(.trailing, 8)
                                                    Text(questions[index])
                                                        .font(.subheadline)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(Color(red: 126/255, green: 126/255, blue: 126/255))
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.leading, 8)
                                                    Spacer()
                                                }
                                                Divider()
                                                    .frame(width:256,height:10)
                                                    .padding(.vertical, 8)
                                                
                                            }
                                        }
                                    }
                                )
                            Rectangle()
                                .fill(Color(red: 0xD5/255, green: 0xC5/255, blue: 0xF4/255))
                                .frame(width: 310, height: 104.2)
                                .cornerRadius(6.4, corners: [.topLeft])
                                .border(Color(red: 0xDB/255, green: 0xDB/255, blue: 0xDB/255), width: 1)
                                .cornerRadius(10)
                                .overlay(
                                    VStack {
                                        Text("Your match score:")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .padding(.top, 20.57)
                                            .frame(width: 290.8, height: 22)
                                        
                                        HStack {
                                            Text("✨")
                                                .font(.custom("Termina", size: 20.94))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black)
                                            
                                            Text("\(matchScore)")
                                            
                                                .font(.largeTitle)
                                                .fontWeight(.heavy)
                                                .foregroundColor(Color(red: 119/255, green: 67/255, blue: 219/255)) // #7743DB
                                                .padding(.vertical, 0)
                                            
                                            Text("✨")
                                                .font(.custom("Termina", size: 20.94))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black)
                                        }
                                        .padding()
                                    }
                                )
                            Spacer()
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 310, height: 46)
                                .cornerRadius(30)
                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 16)) // padding: 4px 8px 4px 16px;
                                .cornerRadius(15.47, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                                .opacity(1)
                            
                                .overlay(
                                    HStack {
                                        Image("Dice")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width:24,height: 24)
                                        Spacer()
                                        Text("Chat time! Say hi!")
                                            .multilineTextAlignment(.leading)
                                            .frame(width:206,height: 24)
                                            .foregroundColor(Color.gray)
                                        Image("Send")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width:40,height: 40)
                                            .padding(8)
                                            .onTapGesture {
                                                self.showChatRoom = true
                                            }
                                    }
                                        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 8))
                                )
                        }
                            .padding(.bottom,25)
                    )
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                    .edgesIgnoringSafeArea(.all)// Hide the navigation bar
            }
        }
    }
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
