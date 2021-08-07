import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [0,10,15,20,30]
    
    var totalPerPerson: Int {
        let peopleCount = Int(numberOfPeople + 2)
        let tipSelection = Int(tipPercentages[tipPercentage])
        let orderAmount = Int(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Сумма", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Количество людей", selection: $numberOfPeople) {
                        ForEach(2 ..< 15) {
                            Text("\($0) человек")
                        }
                    }
                }
                
                Section (header: Text("Какой процент чаевых вы хотите оставить?")){
                    
                    Picker("Процент чаевых", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Общая сумма выходит: ")){
                    Text("₸\(totalPerPerson)")
                }
            }
            .navigationBarTitle("Чек-разделитель")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
