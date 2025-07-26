import Foundation
import Network

class NetworkService: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected = false
    @Published var connectionType: ConnectionType = .none
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case none
        
        var description: String {
            switch self {
            case .wifi:
                return "Wi-Fi"
            case .cellular:
                return "Cellular"
            case .ethernet:
                return "Ethernet"
            case .none:
                return "No Connection"
            }
        }
    }
    
    init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.updateConnectionType(path)
            }
        }
        monitor.start(queue: queue)
    }
    
    private func updateConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .ethernet
        } else {
            connectionType = .none
        }
    }
    
    func checkConnection() -> Bool {
        return isConnected
    }
    
    deinit {
        monitor.cancel()
    }
}

// MARK: - Network Extension
extension NetworkService {
    static let shared = NetworkService()
    
    func testInternetConnection() async -> Bool {
        guard let url = URL(string: "https://www.google.com") else {
            return false
        }
        
        do {
            let (_, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse {
                return httpResponse.statusCode == 200
            }
            return false
        } catch {
            return false
        }
    }
} 