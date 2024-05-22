import SwiftUI

struct ChatRoom: View {
    @State private var questions = ["I went skinny dipping", "Win an argument", "Attempted DIY home"]
    @State private var markedAnswers: [Bool] = [false, true, true]
    @State private var matchScore = 66
    var body: some View {
        
        VStack(spacing: 0) {
            // Header view
            ZStack {
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width, height: 56)
                   // .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 1)
                   // .opacity(0.51)
                   // .shadow(color: Color.clear, radius: 0, x: 0, y: 0)
                
                HStack {
                    // Navigation link with image button
                    NavigationLink(destination: Text("Back")) {
                        Image("back")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                    }
                   
                    
                    
                    // 
                    HStack(spacing: 8) {
                        Image("profilepic")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1.25))
                            .shadow(color: Color.black.opacity(0.08), radius: 5)
                          
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Madisyn")
                                .font(.custom("Outfit", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 50/255, green: 50/255, blue: 52/255))
                            
                            Text("Online")
                                .font(.custom("Outfit", size: 14))
                                .foregroundColor(Color(red: 52/255, green: 199/255, blue: 89/255))
                        }
                    }
                    .frame(width: 109, height: 45)
                    .padding(.top, 6)
                    
                    Spacer()
                    
                    
                    Image("options")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 15)
                }
                
                
                
            }
            .padding(10)
            .ignoresSafeArea(edges: .bottom)
            
            
            Divider()
               // .offset(0)
          
            
            //Body!
            
            Spacer()
                .frame(height:150)
            // this part! add it into hstack!
            HStack{
                
            
            Spacer()
            
            
            
                VStack{
                    
                    
                    Rectangle()
                        //.padding(.trailing, 0.17)
                        .fill(Color.white)
                        .frame(width: 257, height: 348.19)
                        //.padding()
                        .overlay(
                            VStack {
                                Image("List-NHIE")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 257, height: 87)
                                
                                
                                
                                
                                ScrollView {
                                    VStack(spacing: 10) {
                                        ForEach(0..<questions.count, id: \.self) { index in
                                            HStack {
                                                Spacer()
                                                Text(markedAnswers[index] ? "🤝🏼" : "💀")
                                                    .font(.custom("Outfit", size: 16))
                                                    .foregroundColor(Color(red: 126/255, green: 126/255, blue: 126/255))
                                                    .frame(width: 20, height: 20)
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
                                                .frame(width: 206, height: 10)
                                                .padding(.vertical, 8)
                                        }
                                    }
                                }
                                
                                // Match score box from ListView
                                Rectangle()
                                    .fill(Color(red: 0xD5/255, green: 0xC5/255, blue: 0xF4/255))
                                    .frame(width: 233, height: 65.44)
                                    .cornerRadius(6.4, corners: [.topLeft])
                                    .border(Color(red: 0xDB/255, green: 0xDB/255, blue: 0xDB/255), width: 1)
                                    .cornerRadius(10)
                                    .padding()
                                    .overlay(
                                        VStack {
                                            Text("Your match score:")
                                                .font(.subheadline)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color.white)
                                                .padding(.top, 55.57)
                                                .frame(width: 190.8, height: 22)
                                                .font(.custom("Termina", size: 6))
                                            
                                            HStack {
                                                Text("✨")
                                                    .font(.custom("Termina", size: 15.94))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color.black)
                                                    .padding(.bottom,15)
                                                
                                                Text("\(matchScore)")
                                                    .font(.largeTitle)
                                                    .fontWeight(.heavy)
                                                    .foregroundColor(Color(red: 119/255, green: 67/255, blue: 219/255))
                                                    .padding(.vertical,0)
                                                    .padding(.bottom,10)
                                                
                                                Text("✨")
                                                    .font(.custom("Termina", size: 15.94))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color.black)
                                                    .padding(.bottom,15)
                                            }
                                            .padding()
                                        }
                                    )
                                
                                
                                
                            }
                        )
                        .cornerRadius(15.47, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                        .opacity(1)
                        .padding(.horizontal,5)
                    
                    
                    
                }
                .padding(.horizontal,10)
              //  Spacer()
                
                //end of vstack
                
                
                
            }
            //end of Hstack
            
            
            HStack{
                Spacer()
                
                
                    Rectangle()
                        .frame(width: 168, height: 56)
                    
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                    
                        .shadow(radius: 2)
                        
                        .overlay(
                            Text("What do you think?")
                                .frame(width: 136, height: 24)
                                .foregroundColor(Color(red: 87/255, green: 87/255, blue: 88/255))
                                .font(Font.custom("Outfit", size: 15))
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                        ).cornerRadius(15.47, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        .shadow(color: Color.black.opacity(0.09), radius: 8, x: 0, y: 4)
                        .opacity(1)
                        .padding(.horizontal,5)
                
            }.padding()
            
         
            
            
               // Upto this part!!!!!!
            
            Spacer()
            
            Spacer()
            
            Rectangle()
                .fill(Color(red: 231/255, green: 231/255, blue: 232/255))
                .frame(width: 390, height: 44)
                //.position( y: 773 + 22)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .opacity(1)
                .disabled(true)
                .overlay(
                    Text("You can only reply if we match first!")
                        .font(.footnote)
                        .frame(width: 248, height: 24)
                            .foregroundColor(Color(red: 39/255, green: 39/255, blue: 40/255))
                            .font(Font.custom("Termina", size: 15))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .padding(.top,10)
                    )
            
             
            
        }
        
    }
}

#Preview {
    ChatRoom()
}
