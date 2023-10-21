class TACLowerer {
    
    var global: TACScope!
    var local: TACScope!
    
    var activeLabel: Label!
    
    let pilLowerer: PILLowerer
    
    private(set) var labels: [Label] = []
    
    private var internalCounter = 0
    
    private var structs: [String : PILStruct] = [:]
    
    private(set) var functionLabels: [String : Label] = [:]
    
    private(set) var functions: [String : PILFunction] = [:]
    
    private(set) var errors: [PMaxError] = []
    
    init(_ pilLowerer: PILLowerer) {
        
        print("\n\n")
        
        self.pilLowerer = pilLowerer
        self.structs = pilLowerer.structs
        self.functions = pilLowerer.functions
        
        self.global = TACScope(self)
        self.local = global
        
        registerGlobalVariables()
        
    }
    
    
    private func registerGlobalVariables() {
        
        for globalVariable in pilLowerer.global.variables {
            
            let name = globalVariable.key
            let type = globalVariable.value
            
            guard case .int = type else {
                fatalError("Global variables can only be 'int', not '\(type)'.")
            }
            
            global.declareInDataSection(type, name)
            
        }
        
    }
    
    
    func lower() {
        
        for function in functions {
            
            let function = function.value
            
            let newLabel = newLabel("fn=\(function.name)")
            functionLabels[function.name] = newLabel
            
        }
        
        for function in functions.values {
            
            push()
            
            for parameter in function.parameters {
                local.declare(parameter.type, parameter.label)
            }
            
            activeLabel = functionLabels[function.name]!
            
            for statement in function.body {
                statement.lowerToTAC(self)
            }
            
            pop()
            
        }
        
        for label in labels {
            print(label)
        }
        
        for error in errors {
            print("-", error)
        }
        
    }
    
    
    func submitError(_ newError: PMaxError) {
        errors.append(newError)
    }
    
    
    /// Create a new label named within the given `context`. Will return the label, but **won't use it as the new active label.** Doing so is up to the caller.
    func newLabel(_ context: String) -> Label {
        
        internalCounter += 1
        
        let newLabel = Label("$label\(internalCounter):\(context)")
        labels.append(newLabel)
        
        return newLabel
        
    }
    
    
    /// Generate (and declare) a new internal variable. It does not collide with any other variable names. It uses a `context` parameter to give a _somewhat_ informative name.
    func newInternalVariable(_ context: String, _ type: PILType) -> Location {
        internalCounter += 1
        let name = "$\(internalCounter)"
        return local.declare(type, name)
    }
    
    
    func sizeOf(_ type: PILType) -> Int {
        
        switch type {
        case .int, .pointer(_):
            return 1
        case .void, .error:
            return 0
        case .struct(let name):
            return pilLowerer.structLayouts[name]!.size
        }
        
    }
    
    
    func push() {
        local = TACScope(local)
    }
    
    func pop() {
        local = local.parent!
    }
    
    
}
