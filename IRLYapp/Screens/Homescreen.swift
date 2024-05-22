 

import SwiftUI

struct Homescreen: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            //Header()

            VStack(spacing: 0) {
                // Image HS01
                Image("HS01")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 358, height: 245.00) // Adjusted to fit in the frame as per the Figma!
                    .padding(.horizontal, 24)
                    .padding(.vertical,20)
                    //.padding(.top, 16)
                   // .padding(.bottom, 14)
                   // .offset(x: 0, y: -20)
                    //.cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .opacity(1)
                    .shadow(color: Color(red: 0.13, green: 0.13, blue: 0.13, opacity: 0.13), radius: 4, x: 0, y: 4)
                    .background(Color.white)
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                    
                // Default Rectangle
                Default()
                    
                    .padding(.horizontal, 24)
                   
                Image("HS02")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 358, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(1)
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    //.offset(x:0, y:0)
                    .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
            }
            Header()
            //I want this not to ignore safe zone! while others are ignoreing safe zone
           
        }
        .edgesIgnoringSafeArea(.all)
        //.navigationBarHidden(true)
        
        
        

    }
        
}
    

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}



