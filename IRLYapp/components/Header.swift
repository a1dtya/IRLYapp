import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            // Horizontal stack for the images
            HStack(spacing: 8) {
                // Left image (PFP)
                Button(action: {
                    // Action for PFP button
                }) {
                    Image("PFP")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64 * 1.3, height: 64*1.3)
                }
                Spacer()
                
                // Center image (IRLY)
                Button(action: {
                    // Action for IRLY button
                }) {
                    Image("IRLY")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47*1.3, height: 47*1.3) // Adjust size as needed
                }
                Spacer()
                
                // Right image (Chats)
                Button(action: {
                    // Action for Chats button
                }) {
                    Image("Chat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56*1.2, height: 56*1.2) // Adjust size as needed
                }
            }
            .padding(.horizontal, 16)
            
            Spacer() // Add spacer to push the Cancel button to the bottom
            
            HStack {
                // Cancel button
                Button(action: {
                    // Action for Cancel button
                }) {
                    Image("Cancel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                }
                .padding(.bottom, 16)
                .padding(.leading, 1)
                
                Spacer()
            }
        }
     //   .padding(5)
        .padding(.top,55)
        .padding(.bottom,40)
        .edgesIgnoringSafeArea(.top) 
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
