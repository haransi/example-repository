//
//  ContentView.swift
//  New Thing 3
//
//  Created by Sierra Haran on 2/27/25.
//


//  ContentView.swift
//  Robotics sea app #3
//
//  Created by Sierra Haran on 1/9/25.
//

import SwiftUI

struct Homeview: View {
    ///basic stuff
    @State var studentname = ""
    @State private var teamnumber = ""
    @State private var matchnumber = ""
    
    ///auto
    @State private var leavestart = "Not Selected"
    let leaves = ["Yes", "No"]
    @State private var autoCoralL1 = 0
    @State private var autoCoralL2 = 0
    @State private var autoCoralL3 = 0
    @State private var autoCoralL4 = 0
    @State private var autoAlgaeproccessor = 0
    @State private var autoAlgaenet = 0
    
    ///teleop
    @State private var teleopCoralL1 = 0
    @State private var teleopCoralL2 = 0
    @State private var teleopCoralL3 = 0
    @State private var teleopCoralL4 = 0
    @State private var teleopAlgaeprocessor = 0
    @State private var teleopAlgaenet = 0
    
    ///humans
    @State private var shotsAttempted = 0
    @State private var shotsMade = 0
    
    ///barge stuff
    @State private var bargeoptions = "Not Selected"
    let barges = ["None", "Park", "Shallow", "Deep"]
    
    ///winning
    @State private var winoptioons = "Not Selected"
    let wins = ["Lose", "Tie", "Win"]
    
    ///QR code stuff
    @State private var data1: String = ""
    @State private var data2: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Team Tracking")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
                HStack {
                    Spacer()
                    Spacer()
                    TextField("Student Name", text: $studentname)
                }
                HStack{
                    Spacer()
                    Spacer()
                    TextField("Team Number", text: $teamnumber)
                }
                HStack{
                    Spacer()
                    Spacer()
                    TextField("Match Number", text: $matchnumber)
                }
                HStack{
                    Text("Auto")
                        .font(.largeTitle)
                        .foregroundColor(Color.orange)
                }
                HStack{
                    Text("Did they leave start?")
                    Picker("", selection: $leavestart){
                        ForEach(leaves, id: \.self){leave in Text(leave)}
                    }
                    .pickerStyle(.segmented)
                }
                HStack{
                    VStack{
                        ///auto coral
                        Text("Coral")
                            .foregroundColor(Color.orange)
                           Stepper("Coral L1: \(autoCoralL1)", value:$autoCoralL1 , in: 0...100)
                            Stepper("Coral L2: \(autoCoralL2)", value:$autoCoralL2, in: 0...100)
                    Stepper("Coral L3: \(autoCoralL3)", value:$autoCoralL3, in: 0...100)
                            Stepper("Coral L4: \(autoCoralL4)", value:$autoCoralL4, in: 0...100)
                        ///auto algae
                            Text("Algae")
                                .foregroundColor(Color.orange)
                            Stepper("Algae Processor: \(autoAlgaeproccessor)", value:$autoAlgaeproccessor, in: 0...100)
                            Stepper("Algae Net: \(autoAlgaenet)", value:$autoAlgaenet, in:0...100)
                        
                        ///Teleop
                            Text("Teleop")
                            .font(.largeTitle)
                            .foregroundColor(Color.orange)
                        ///Teleop Coral
                            Text("Coral")
                            .foregroundColor(Color.orange)
                        Stepper("Coral L1: \(teleopCoralL1)", value:$teleopCoralL1 , in: 0...100)
                        Stepper("Coral L2: \(teleopCoralL2)", value:$teleopCoralL2, in: 0...100)
                        Stepper("Coral L3: \(teleopCoralL3)", value:$teleopCoralL3, in:0...100)
                        Stepper("Coral L4: \(teleopCoralL4)", value:$teleopCoralL4, in:0...100)
                        ///Teleop Algae
                        Text("Algae")
                            .foregroundColor(Color.orange)
                        Stepper("Algae Processor: \(teleopAlgaeprocessor)", value:$teleopAlgaeprocessor, in:0...100)
                        Stepper("Algae Net: \(teleopAlgaenet)", value:$teleopAlgaenet, in: 0...100)
                        
                        ///human players
                            Text("Human Player")
                            .foregroundColor(Color.orange)
                            .font(.largeTitle)
                        Stepper("Shots Attempted: \(shotsAttempted)", value:$shotsAttempted, in: 0...100)
                        Stepper("Shots Made: \(shotsMade)", value:$shotsMade, in: 0...100)
                        
                        ///barge
                        Text("End Game")
                            .foregroundColor(Color.orange)
                            .font(.largeTitle)
                        Text("Barge")
                            .foregroundColor(Color.orange)
                        Picker ("", selection: $bargeoptions){
                            ForEach(barges, id: \.self){
                                barge in Text(barge)}
                        }
                        .pickerStyle(.segmented)
                        Text("Win?")
                            .foregroundColor(Color.orange)
                            .font(.largeTitle)
                        Picker ("", selection: $winoptioons){
                            ForEach(wins, id: \.self){
                                win in Text(win)}
                        }
                        .pickerStyle(.segmented)
                    }
                }
                .padding()
                .padding()
                VStack{
                    HStack{
                        Button(action: submitData){
                            Text("Submit")
                            .bold()
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button(action: nextMatch){
                            Text("Next Match")
                            .bold()
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            }
                        }
                    }
                    Text("Data: \(data1 + data2)")
                }
                Image(uiImage: generateQRCode(from: data1 + data2))
                
            }
        }
    }
    
    private func nextMatch(){
        studentname = ""
        teamnumber = ""
        matchnumber = ""
        leavestart = ""
        autoCoralL1 = 0
        autoCoralL2 = 0
        autoCoralL3 = 0
        autoCoralL4 = 0
        autoAlgaeproccessor = 0
        autoAlgaenet = 0
        teleopCoralL1 = 0
        teleopCoralL2 = 0
        teleopCoralL3 = 0
        teleopCoralL4 = 0
        teleopAlgaenet = 0
        teleopAlgaeprocessor = 0
        shotsAttempted = 0
        shotsMade = 0
        bargeoptions = ""
        winoptioons = ""
    }
    
    private func submitData(){
        let preMatchData = [
            studentname,
            teamnumber,
            matchnumber
        ]
        let autoCoraldata = [
            leavestart,
            String(autoCoralL1),
            String(autoCoralL2),
            String(autoCoralL3),
            String(autoCoralL4)
        ]
        let autoAlgaedata = [
            String(autoAlgaeproccessor),
            String(autoAlgaenet)
        ]
        let teleopData = [
            String(teleopCoralL1),
            String(teleopCoralL2),
            String(teleopCoralL3),
            String(teleopCoralL4),
            String(teleopAlgaenet),
            String(teleopAlgaeprocessor)
        ]
        let humanData = [
            String(shotsAttempted),
            String(shotsMade)
        ]
        let endgame = [
            bargeoptions,
            winoptioons
        ]
        
        data1 = (preMatchData + autoCoraldata + autoAlgaedata).joined(separator: ",")
        data2 = (teleopData + humanData + endgame).joined(separator: ",")
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = string.data(using: .ascii)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return UIImage() }
        filter.setValue(data, forKey: "inputMessage")
        guard let qrCodeImage = filter.outputImage else { return UIImage() }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQRCodeImage = qrCodeImage.transformed(by: transform)
        guard let cgImage = CIContext().createCGImage(scaledQRCodeImage, from: scaledQRCodeImage.extent) else { return UIImage() }
        return UIImage(cgImage: cgImage)
      }
}

#Preview {
    Homeview()
}

import SwiftUI

struct Gameview: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("game view thing")
                NavigationLink(destination: Gameviewtab1()) {
                    Text("go to tab 1")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
import SwiftUI

struct Gameviewtab1: View {
    @State private var teamnumberg1 = ""
    @State private var matchnumberg1 = ""
    
    ///auto
    @State private var leavestartg1 = "Not Selected"
    let leavesg1 = ["Yes", "No"]
    @State private var autoCoralL1g1 = 0
    @State private var autoCoralL2g1 = 0
    @State private var autoCoralL3g1 = 0
    @State private var autoCoralL4g1 = 0
    @State private var autoAlgaeproccessorg1 = 0
    @State private var autoAlgaenetg1 = 0
    
    ///teleop
    @State private var teleopCoralL1g1 = 0
    @State private var teleopCoralL2g1 = 0
    @State private var teleopCoralL3g1 = 0
    @State private var teleopCoralL4g1 = 0
    @State private var teleopAlgaeprocessorg1 = 0
    @State private var teleopAlgaenetg1 = 0
    
    ///barge stuff
    @State private var bargeoptionsg1 = "Not Selected"
    let bargesg1 = ["None", "Park", "Shallow", "Deep"]
    
    ///winning
    @State private var winoptioonsg1 = "Not Selected"
    let winsg1 = ["Lose", "Tie", "Win"]
    
    @State private var totalg1 = 0
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Team Tracking")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
            HStack{
                Spacer()
                Spacer()
                TextField("Team Number", text: $teamnumberg1)
            }
            HStack{
                Spacer()
                Spacer()
                TextField("Match Number", text: $matchnumberg1)
            }
            HStack{
                Text("Auto")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
            HStack{
                Text("Did they leave start?")
                Picker("", selection: $leavestartg1){
                    ForEach(leavesg1, id: \.self){leave in Text(leave)}
                }
                .pickerStyle(.segmented)
            }
            HStack{
                VStack{
                    ///auto coral
                    Text("Coral")
                        .foregroundColor(Color.orange)
                    Stepper("Coral L1: \(autoCoralL1g1)", value:$autoCoralL1g1 , in: 0...100)
                    Stepper("Coral L2: \(autoCoralL2g1)", value:$autoCoralL2g1, in: 0...100)
                    Stepper("Coral L3: \(autoCoralL3g1)", value:$autoCoralL3g1, in: 0...100)
                    Stepper("Coral L4: \(autoCoralL4g1)", value:$autoCoralL4g1, in: 0...100)
                    ///auto algae
                    Text("Algae")
                        .foregroundColor(Color.orange)
                    Stepper("Algae Processor: \(autoAlgaeproccessorg1)", value:$autoAlgaeproccessorg1, in: 0...100)
                    Stepper("Algae Net: \(autoAlgaenetg1)", value:$autoAlgaenetg1, in:0...100)
                    
                    ///Teleop
                    Text("Teleop")
                        .font(.largeTitle)
                        .foregroundColor(Color.orange)
                    ///Teleop Coral
                    Text("Coral")
                        .foregroundColor(Color.orange)
                    Stepper("Coral L1: \(teleopCoralL1g1)", value:$teleopCoralL1g1 , in: 0...100)
                    Stepper("Coral L2: \(teleopCoralL2g1)", value:$teleopCoralL2g1, in: 0...100)
                    Stepper("Coral L3: \(teleopCoralL3g1)", value:$teleopCoralL3g1, in:0...100)
                    Stepper("Coral L4: \(teleopCoralL4g1)", value:$teleopCoralL4g1, in:0...100)
                    ///Teleop Algae
                    Text("Algae")
                        .foregroundColor(Color.orange)
                    Stepper("Algae Processor: \(teleopAlgaeprocessorg1)", value:$teleopAlgaeprocessorg1, in:0...100)
                    Stepper("Algae Net: \(teleopAlgaenetg1)", value:$teleopAlgaenetg1, in: 0...100)
                    
                    ///barge
                    Text("End Game")
                        .foregroundColor(Color.orange)
                        .font(.largeTitle)
                    Text("Barge")
                        .foregroundColor(Color.orange)
                    Picker ("", selection: $bargeoptionsg1){
                        ForEach(bargesg1, id: \.self){
                            barge in Text(barge)}
                    }
                    .pickerStyle(.segmented)
                    Text("Win?")
                        .foregroundColor(Color.orange)
                        .font(.largeTitle)
                    Picker ("", selection: $winoptioonsg1){
                        ForEach(winsg1, id: \.self){
                            win in Text(win)}
                    }
                    .pickerStyle(.segmented)
                }
            }
            .padding()
            .padding()
            VStack{
                HStack{
                    Button(action: submitDatag1){
                        Text("Submit")
                            .bold()
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                Text("\totalg1")
            }
        }
    }
    private func submitDatag1(){
        if autoCoralL1g1 == 1 {
            totalg1 = (totalg1 + 1)
        }
    }
}
struct ContentView: View {
    var body: some View{
        TabView {
            Homeview()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Gameview()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Game")
                }
        }
    }
}
