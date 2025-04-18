import SwiftUI

struct ContentView: View
{
    @State var credits : String = "" //number of credits
    @State var degree : String = ""  //degree status
    
    var body: some View
    {
       VStack
        {
            VStack // number of credits
            {
                Text("Credits")
                    .font(.system(size: 30))
                TextField("Number of credits",text: $credits)
                    .frame(width: 250,height: 50)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
            }
            
            VStack // degree status
            {
                Text("Degree Status")
                    .font(.system(size: 30))
                    .padding()
                Picker("",selection: $degree)
                {
                    Text("Graduate").tag("graduate")
                    Text("Undergraduate").tag("undergraduate")
                    Text("Non-degree").tag("nondegree")
                }
                .pickerStyle(.segmented)
                .frame(width: 300, height: 30)
                .padding()
                .font(.system(size: 30))
                .background(Color.white)
            }
            
            
            
        }
        .frame(width: 400,height: 800)
        .background(Color.cyan.opacity(0.3))
    }
    
    
}

#Preview
{
    ContentView()
}
