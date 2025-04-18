import SwiftUI

struct ContentView: View
{
    @State var credits : String = "" //number of credits
    @State var degree : String = ""  //degree status
    @State var state : String = ""   //state status
    @State var dorm: Bool = false    //optional dorm
    @State var dining: Bool = false  //optional dining
    @State var parking: Bool = false //optional parking
    @State var output : String = "" //total amount string
    
    var body: some View
    {
       VStack
        {
            VStack // number of credits
            {
                Text("Credits")
                    .font(.system(size: 25))
                TextField("Number of credits",text: $credits)
                    .frame(width: 250,height: 50)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
            }
            
            VStack // degree status
            {
                Text("Degree Status")
                    .font(.system(size: 25))
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
            
            VStack //state stuate
            {
                Text("State Status")
                    .font(.system(size: 25))
                Picker("state status",selection: $state)
                {
                    Text("In state").tag("instate")
                    Text("Out state").tag("outstate")
                }
                .pickerStyle(.segmented)
                .frame(width: 300, height: 30)
                .padding()
                .font(.system(size: 30))
                .background(Color.white)
            }
            
            HStack //optional dorms
           {
               Text("Dorm")
                   .frame(width: 150, height: 50)
                   .padding()
                   .font(.system(size: 25))
               
               Toggle(isOn: $dorm)
               {
                   Text("")
               }
               .frame(width: 150, height: 50)
               .font(.system(size: 30))
           }
            
            HStack //optional dining
            {
                Text("Dining")
                    .frame(width: 150, height: 50)
                    .padding()
                    .font(.system(size: 25))
                
                Toggle(isOn: $dining)
                {
                    Text("")
                }
                .frame(width: 150, height: 50)
                .font(.system(size: 30))
            }
            
            HStack //optional dining
            {
                Text("Parking")
                    .frame(width: 150, height: 50)
                    .padding()
                    .font(.system(size: 25))
                
                Toggle(isOn: $parking)
                {
                    Text("")
                }
                .frame(width: 150, height: 50)
                .font(.system(size: 30))
            }
            
            HStack // total amount
            {
                Text("Total")
                    .font(.system(size: 25))
                    .padding(30)
                Text(output)
                    .frame(width: 150, height: 50)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
            }
            
            Button("Calcultae")
            {
                var totalAmount : Int // the total amount
                var numCredit : Int = Int(credits)! //number of credits
                var creditRate = 0
                
                
                //determine the credit rate based on the degree status
                if(degree == "graduate")
                {
                    creditRate = 800
                }
                else if(degree == "undergraduate")
                {
                    creditRate = 500
                }
                else if(degree == "nondegree")
                {
                    creditRate = 300
                }
                 
                //calculate the total amount
                totalAmount = numCredit * creditRate
                
                //if student outstate , tuition is twice amount
                if(state == "outstate")
                {
                    totalAmount *= 2 // twice tuition
                }
                else if(state == "instate")
                {
                    totalAmount *= 1
                }
                
                 
                //if dorm is selected
                if(dorm)
                {
                    totalAmount += 5000
                }
                
                //if dining is selected
                if(dining)
                {
                    totalAmount += 2000
                }
                
                //if parking is selected
                if(parking)
                {
                    totalAmount += 1000
                }
                
                output = "\(totalAmount)"
                
                
            }
            .padding()
           .font(.system(size: 30))
           .background(Color.cyan)
           .foregroundColor(Color.black)
                   
            
            
            
            
        }
        .frame(width: 400,height: 800)
        .background(Color.cyan.opacity(0.3))
    }
    
    
}

#Preview
{
    ContentView()
}
 
