import Foundation

struct Bank {
    private let bankingGroup = DispatchGroup()
    
    let depositSemaphore = DispatchSemaphore(value: DepositBanker.number)
    let loanSemaphore = DispatchSemaphore(value: LoanBanker.number)
    
    func startBanking(customer: Queue<Customer>) -> Int {
        var customerNumber = 0
        
        
        while customer.isEmpty == false {
            guard let customer = customer.dequeue() else { return 0 }
            
            switch customer.banking {
            case .loan:
                processWork(banker: LoanBanker.self, customer: customer, semaphore: loanSemaphore)
            case .deposit:
                processWork(banker: DepositBanker.self, customer: customer, semaphore: depositSemaphore)
            }
        
            customerNumber += 1
            
        }
        
//        bankingGroup.wait()
        
        return customerNumber
    }
    
    private func processWork<T: BankerLogic>(banker: T.Type, customer: Customer, semaphore: DispatchSemaphore) {
        let serveWork = DispatchWorkItem {
            semaphore.wait()
            banker.serve(customer: customer)
            semaphore.signal()
        }

        DispatchQueue.global().async(group: bankingGroup, execute: serveWork)
    }
}
