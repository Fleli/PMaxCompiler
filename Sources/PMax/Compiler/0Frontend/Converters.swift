
// Converters.swift
// Auto-generated by SwiftParse
// See https://github.com/Fleli/SwiftParse

public extension SLRNode {
    
    func convertToTopLevelStatements() -> TopLevelStatements {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToTopLevelStatement()]
        }
        
        if children.count == 2 {
            return children[0].convertToTopLevelStatements() + [children[1].convertToTopLevelStatement()]
        }
        
        if children.count == 3 {
            return children[0].convertToTopLevelStatements() + [children[2].convertToTopLevelStatement()]
        }
        
        fatalError()
        
    }
    
}
public extension SLRNode {
    
    func convertToParameters() -> Parameters {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToParameter()]
        }
        
        if children.count == 2 {
            return children[0].convertToParameters() + [children[1].convertToParameter()]
        }
        
        if children.count == 3 {
            return children[0].convertToParameters() + [children[2].convertToParameter()]
        }
        
        fatalError()
        
    }
    
}
public extension SLRNode {
    
    func convertToArguments() -> Arguments {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToArgument()]
        }
        
        if children.count == 2 {
            return children[0].convertToArguments() + [children[1].convertToArgument()]
        }
        
        if children.count == 3 {
            return children[0].convertToArguments() + [children[2].convertToArgument()]
        }
        
        fatalError()
        
    }
    
}
public extension SLRNode {
    
    func convertToStructBodyStatements() -> StructBodyStatements {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToDeclaration()]
        }
        
        if children.count == 2 {
            return children[0].convertToStructBodyStatements() + [children[1].convertToDeclaration()]
        }
        
        if children.count == 3 {
            return children[0].convertToStructBodyStatements() + [children[2].convertToDeclaration()]
        }
        
        fatalError()
        
    }
    
}
public extension SLRNode {
    
    func convertToFunctionBodyStatements() -> FunctionBodyStatements {
        
        if children.count == 0 {
            return []
        }
        
        if children.count == 1 {
            return [children[0].convertToFunctionBodyStatement()]
        }
        
        if children.count == 2 {
            return children[0].convertToFunctionBodyStatements() + [children[1].convertToFunctionBodyStatement()]
        }
        
        if children.count == 3 {
            return children[0].convertToFunctionBodyStatements() + [children[2].convertToFunctionBodyStatement()]
        }
        
        fatalError()
        
    }
    
}
public extension SLRNode {

	func convertToAssignment() -> Assignment {
		
		if type == "Assignment" && children.count == 5 && children[0].type == "assign" && children[1].type == "Expression" && children[2].type == "=" && children[3].type == "Expression" && children[4].type == ";" {
			let arg1 = children[1].convertToExpression()
			let arg3 = children[3].convertToExpression()
			return .init(arg1, arg3)
		}
		
		if type == "Assignment" && children.count == 7 && children[0].type == "assign" && children[1].type == "Expression" && children[2].type == "@" && children[3].type == "SugarOperator" && children[4].type == "=" && children[5].type == "Expression" && children[6].type == ";" {
			let arg1 = children[1].convertToExpression()
			let arg3 = children[3].convertToSugarOperator()
			let arg5 = children[5].convertToExpression()
			return .init(arg1, arg3, arg5)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToSugarOperator() -> SugarOperator {
		
        if type == "SugarOperator" && children[0].type == "|" {
            return SugarOperator._verticalBar_
        }
        
        if type == "SugarOperator" && children[0].type == "^" {
            return SugarOperator._94
        }
        
        if type == "SugarOperator" && children[0].type == "&" {
            return SugarOperator._ampersand_
        }
        
        if type == "SugarOperator" && children[0].type == "+" {
            return SugarOperator._plusSign_
        }
        
        if type == "SugarOperator" && children[0].type == "-" {
            return SugarOperator._hyphen_
        }
        
        if type == "SugarOperator" && children[0].type == "*" {
            return SugarOperator._asterisk_
        }
        
        if type == "SugarOperator" && children[0].type == "/" {
            return SugarOperator._slash_
        }
        
        if type == "SugarOperator" && children[0].type == "%" {
            return SugarOperator._percentSign_
        }
        
        fatalError()
        
    }

}

public extension SLRNode {

	func convertToReturn() -> Return {
		
		if type == "Return" && children.count == 2 && children[0].type == "return" && children[1].type == ";" {
			return .init()
		}
		
		if type == "Return" && children.count == 3 && children[0].type == "return" && children[1].type == "Expression" && children[2].type == ";" {
			let arg1 = children[1].convertToExpression()
			return .init(arg1)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToFunction() -> Function {
		
		if type == "Function" && children.count == 8 && children[0].type == "Type" && children[1].type == "identifier" && children[2].type == "(" && children[3].type == "Parameters" && children[4].type == ")" && children[5].type == "{" && children[6].type == "FunctionBodyStatements" && children[7].type == "}" {
			let arg0 = children[0].convertToType()
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToParameters()
			let arg6 = children[6].convertToFunctionBodyStatements()
			return .init(arg0, arg1, arg3, arg6)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToParameter() -> Parameter {
		
		if type == "Parameter" && children.count == 2 && children[0].type == "Type" && children[1].type == "identifier" {
			let arg0 = children[0].convertToType()
			let arg1 = children[1].convertToTerminal()
			return .init(arg0, arg1)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToIf() -> If {
		
		if type == "If" && children.count == 5 && children[0].type == "if" && children[1].type == "Expression" && children[2].type == "{" && children[3].type == "FunctionBodyStatements" && children[4].type == "}" {
			let arg1 = children[1].convertToExpression()
			let arg3 = children[3].convertToFunctionBodyStatements()
			return .init(arg1, arg3)
		}
		
		if type == "If" && children.count == 7 && children[0].type == "if" && children[1].type == "Expression" && children[2].type == "{" && children[3].type == "FunctionBodyStatements" && children[4].type == "}" && children[5].type == "else" && children[6].type == "Else" {
			let arg1 = children[1].convertToExpression()
			let arg3 = children[3].convertToFunctionBodyStatements()
			let arg6 = children[6].convertToElse()
			return .init(arg1, arg3, arg6)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToElse() -> Else {
		
		if type == "Else" && children.count == 1 && children[0].type == "UnconditionalElse" {
			let arg0 = children[0].convertToUnconditionalElse()
			return Else.uncdoncitional(arg0)
		}
	
		if type == "Else" && children.count == 1 && children[0].type == "If" {
			let arg0 = children[0].convertToIf()
			return Else.conditional(arg0)
		}
	
		fatalError()
	
	}
	
}

public extension SLRNode {

	func convertToUnconditionalElse() -> UnconditionalElse {
		
		if type == "UnconditionalElse" && children.count == 3 && children[0].type == "{" && children[1].type == "FunctionBodyStatements" && children[2].type == "}" {
			let arg1 = children[1].convertToFunctionBodyStatements()
			return .init(arg1)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToStruct() -> Struct {
		
		if type == "Struct" && children.count == 5 && children[0].type == "struct" && children[1].type == "identifier" && children[2].type == "{" && children[3].type == "StructBodyStatements" && children[4].type == "}" {
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToStructBodyStatements()
			return .init(arg1, arg3)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToType() -> `Type` {
		
		if type == "Type" && children.count == 1 && children[0].type == "identifier" {
			let arg0 = children[0].convertToTerminal()
			return `Type`.basic(arg0)
		}
	
		if type == "Type" && children.count == 2 && children[0].type == "Type" && children[1].type == "*" {
			let arg0 = children[0].convertToType()
			let arg1 = children[1].convertToTerminal()
			return `Type`.pointer(arg0, arg1)
		}
	
		fatalError()
	
	}
	
}

public extension SLRNode {

	func convertToCall() -> Call {
		
		if type == "Call" && children.count == 6 && children[0].type == "call" && children[1].type == "identifier" && children[2].type == "(" && children[3].type == "Arguments" && children[4].type == ")" && children[5].type == ";" {
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToArguments()
			return .init(arg1, arg3)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToMacro() -> Macro {
		
		if type == "Macro" && children.count == 4 && children[0].type == "macro" && children[1].type == "identifier" && children[2].type == "=" && children[3].type == "Expression" {
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToExpression()
			return .init(arg1, arg3)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToTopLevelStatement() -> TopLevelStatement {
		
        if type == "TopLevelStatement" && children[0].type == "Struct" {
            let nonTerminalNode = children[0].convertToStruct()
            return TopLevelStatement.`struct`(nonTerminalNode)
        }
	
        if type == "TopLevelStatement" && children[0].type == "Function" {
            let nonTerminalNode = children[0].convertToFunction()
            return TopLevelStatement.function(nonTerminalNode)
        }
	
        if type == "TopLevelStatement" && children[0].type == "Import" {
            let nonTerminalNode = children[0].convertToImport()
            return TopLevelStatement.`import`(nonTerminalNode)
        }
	
        if type == "TopLevelStatement" && children[0].type == "Macro" {
            let nonTerminalNode = children[0].convertToMacro()
            return TopLevelStatement.macro(nonTerminalNode)
        }
	
        fatalError()
        
    }

}

public extension SLRNode {

	func convertToFunctionBodyStatement() -> FunctionBodyStatement {
		
        if type == "FunctionBodyStatement" && children[0].type == "Declaration" {
            let nonTerminalNode = children[0].convertToDeclaration()
            return FunctionBodyStatement.declaration(nonTerminalNode)
        }
	
        if type == "FunctionBodyStatement" && children[0].type == "Assignment" {
            let nonTerminalNode = children[0].convertToAssignment()
            return FunctionBodyStatement.`assignment`(nonTerminalNode)
        }
	
        if type == "FunctionBodyStatement" && children[0].type == "Return" {
            let nonTerminalNode = children[0].convertToReturn()
            return FunctionBodyStatement.`return`(nonTerminalNode)
        }
	
        if type == "FunctionBodyStatement" && children[0].type == "If" {
            let nonTerminalNode = children[0].convertToIf()
            return FunctionBodyStatement.`if`(nonTerminalNode)
        }
	
        if type == "FunctionBodyStatement" && children[0].type == "While" {
            let nonTerminalNode = children[0].convertToWhile()
            return FunctionBodyStatement.`while`(nonTerminalNode)
        }
	
        if type == "FunctionBodyStatement" && children[0].type == "Call" {
            let nonTerminalNode = children[0].convertToCall()
            return FunctionBodyStatement.call(nonTerminalNode)
        }
	
        fatalError()
        
    }

}

public extension SLRNode {

	func convertToExpression() -> Expression {
		
		if type == "Expression" && children.count == 3 && children[0].type == "Expression" && children[1].type == "|" && children[2].type == "CASEBExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_0, arg1, arg2)
			
		}
		
		if type == "Expression" && children.count == 1 && children[0].type == "CASEBExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEBExpression" && children.count == 3 && children[0].type == "CASEBExpression" && children[1].type == "^" && children[2].type == "CASECExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_1, arg1, arg2)
			
		}
		
		if type == "CASEBExpression" && children.count == 1 && children[0].type == "CASECExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASECExpression" && children.count == 3 && children[0].type == "CASECExpression" && children[1].type == "&" && children[2].type == "CASEDExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_2, arg1, arg2)
			
		}
		
		if type == "CASECExpression" && children.count == 1 && children[0].type == "CASEDExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEDExpression" && children.count == 3 && children[0].type == "CASEDExpression" && children[1].type == "==" && children[2].type == "CASEEExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_3, arg1, arg2)
			
		}
		
		if type == "CASEDExpression" && children.count == 1 && children[0].type == "CASEEExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEDExpression" && children.count == 3 && children[0].type == "CASEDExpression" && children[1].type == "!=" && children[2].type == "CASEEExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_4, arg1, arg2)
			
		}
		
		if type == "CASEDExpression" && children.count == 1 && children[0].type == "CASEEExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEEExpression" && children.count == 3 && children[0].type == "CASEEExpression" && children[1].type == "<" && children[2].type == "CASEFExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_5, arg1, arg2)
			
		}
		
		if type == "CASEEExpression" && children.count == 1 && children[0].type == "CASEFExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEEExpression" && children.count == 3 && children[0].type == "CASEEExpression" && children[1].type == ">" && children[2].type == "CASEFExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_6, arg1, arg2)
			
		}
		
		if type == "CASEEExpression" && children.count == 1 && children[0].type == "CASEFExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEEExpression" && children.count == 3 && children[0].type == "CASEEExpression" && children[1].type == "<=" && children[2].type == "CASEFExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_7, arg1, arg2)
			
		}
		
		if type == "CASEEExpression" && children.count == 1 && children[0].type == "CASEFExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEEExpression" && children.count == 3 && children[0].type == "CASEEExpression" && children[1].type == ">=" && children[2].type == "CASEFExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_8, arg1, arg2)
			
		}
		
		if type == "CASEEExpression" && children.count == 1 && children[0].type == "CASEFExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEFExpression" && children.count == 3 && children[0].type == "CASEFExpression" && children[1].type == "+" && children[2].type == "CASEGExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_9, arg1, arg2)
			
		}
		
		if type == "CASEFExpression" && children.count == 1 && children[0].type == "CASEGExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEFExpression" && children.count == 3 && children[0].type == "CASEFExpression" && children[1].type == "-" && children[2].type == "CASEGExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_10, arg1, arg2)
			
		}
		
		if type == "CASEFExpression" && children.count == 1 && children[0].type == "CASEGExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEGExpression" && children.count == 3 && children[0].type == "CASEGExpression" && children[1].type == "*" && children[2].type == "CASEHExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_11, arg1, arg2)
			
		}
		
		if type == "CASEGExpression" && children.count == 1 && children[0].type == "CASEHExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEGExpression" && children.count == 3 && children[0].type == "CASEGExpression" && children[1].type == "/" && children[2].type == "CASEHExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_12, arg1, arg2)
			
		}
		
		if type == "CASEGExpression" && children.count == 1 && children[0].type == "CASEHExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEGExpression" && children.count == 3 && children[0].type == "CASEGExpression" && children[1].type == "%" && children[2].type == "CASEHExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_13, arg1, arg2)
			
		}
		
		if type == "CASEGExpression" && children.count == 1 && children[0].type == "CASEHExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEHExpression" && children.count == 2 && children[0].type == "<<" && children[1].type == "CASEIExpression" {
			
			let arg = children[1].convertToExpression()
			return .singleArgumentOperator(.operator_0, arg)
			
		}
		
		if type == "CASEHExpression" && children.count == 1 && children[0].type == "CASEIExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEHExpression" && children.count == 2 && children[0].type == ">>" && children[1].type == "CASEIExpression" {
			
			let arg = children[1].convertToExpression()
			return .singleArgumentOperator(.operator_1, arg)
			
		}
		
		if type == "CASEHExpression" && children.count == 1 && children[0].type == "CASEIExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEIExpression" && children.count == 2 && children[0].type == "!" && children[1].type == "CASEJExpression" {
			
			let arg = children[1].convertToExpression()
			return .singleArgumentOperator(.operator_2, arg)
			
		}
		
		if type == "CASEIExpression" && children.count == 1 && children[0].type == "CASEJExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEIExpression" && children.count == 2 && children[0].type == "~" && children[1].type == "CASEJExpression" {
			
			let arg = children[1].convertToExpression()
			return .singleArgumentOperator(.operator_3, arg)
			
		}
		
		if type == "CASEIExpression" && children.count == 1 && children[0].type == "CASEJExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEIExpression" && children.count == 2 && children[0].type == "-" && children[1].type == "CASEJExpression" {
			
			let arg = children[1].convertToExpression()
			return .singleArgumentOperator(.operator_4, arg)
			
		}
		
		if type == "CASEIExpression" && children.count == 1 && children[0].type == "CASEJExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEJExpression" && children.count == 3 && children[0].type == "CASEJExpression" && children[1].type == "->" && children[2].type == "CASEKExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_14, arg1, arg2)
			
		}
		
		if type == "CASEJExpression" && children.count == 1 && children[0].type == "CASEKExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEJExpression" && children.count == 3 && children[0].type == "CASEJExpression" && children[1].type == "." && children[2].type == "CASEKExpression" {
			
			let arg1 = children[0].convertToExpression()
			let arg2 = children[2].convertToExpression()
			return .infixOperator(.operator_15, arg1, arg2)
			
		}
		
		if type == "CASEJExpression" && children.count == 1 && children[0].type == "CASEKExpression" {
			
			return children[0].convertToExpression()
			
		}
		
		if type == "CASEKExpression" && children.count == 3 && children[0].type == "(" && children[1].type == "Expression" && children[2].type == ")" {
			
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToExpression()
			let arg2 = children[2].convertToTerminal()
			return .leftParenthesis_ExpressionrightParenthesis_(arg0, arg1, arg2)
			
		}
		
		if type == "CASEKExpression" && children.count == 4 && children[0].type == "TypeCast" && children[1].type == "(" && children[2].type == "Expression" && children[3].type == ")" {
			
			let arg0 = children[0].convertToTypeCast()
			let arg1 = children[1].convertToTerminal()
			let arg2 = children[2].convertToExpression()
			let arg3 = children[3].convertToTerminal()
			return .TypeCastleftParenthesis_ExpressionrightParenthesis_(arg0, arg1, arg2, arg3)
			
		}
		
		if type == "CASEKExpression" && children.count == 1 && children[0].type == "integer" {
			
			let arg0 = children[0].convertToTerminal()
			return .integer(arg0)
			
		}
		
		if type == "CASEKExpression" && children.count == 1 && children[0].type == "string" {
			
			let arg0 = children[0].convertToTerminal()
			return .string(arg0)
			
		}
		
		if type == "CASEKExpression" && children.count == 1 && children[0].type == "identifier" {
			
			let arg0 = children[0].convertToTerminal()
			return .identifier(arg0)
			
		}
		
		if type == "CASEKExpression" && children.count == 4 && children[0].type == "identifier" && children[1].type == "(" && children[2].type == "Arguments" && children[3].type == ")" {
			
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToTerminal()
			let arg2 = children[2].convertToArguments()
			let arg3 = children[3].convertToTerminal()
			return .identifierleftParenthesis_ArgumentsrightParenthesis_(arg0, arg1, arg2, arg3)
			
		}
		
		if type == "CASEKExpression" && children.count == 2 && children[0].type == "&" && children[1].type == "Expression" {
			
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToExpression()
			return .ampersand_Expression(arg0, arg1)
			
		}
		
		if type == "CASEKExpression" && children.count == 2 && children[0].type == "*" && children[1].type == "Expression" {
			
			let arg0 = children[0].convertToTerminal()
			let arg1 = children[1].convertToExpression()
			return .asterisk_Expression(arg0, arg1)
			
		}
		
		if type == "CASEKExpression" && children.count == 1 && children[0].type == "Sizeof" {
			
			let arg0 = children[0].convertToSizeof()
			return .Sizeof(arg0)
			
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToTypeCast() -> TypeCast {
		
		if type == "TypeCast" && children.count == 4 && children[0].type == "(" && children[1].type == "as" && children[2].type == "Type" && children[3].type == ")" {
			let arg2 = children[2].convertToType()
			return .init(arg2)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToSizeof() -> Sizeof {
		
		if type == "Sizeof" && children.count == 4 && children[0].type == "sizeof" && children[1].type == "(" && children[2].type == "Type" && children[3].type == ")" {
			let arg2 = children[2].convertToType()
			return .init(arg2)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToImport() -> Import {
		
		if type == "Import" && children.count == 3 && children[0].type == "import" && children[1].type == "identifier" && children[2].type == ";" {
			let arg1 = children[1].convertToTerminal()
			return .init(arg1)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToWhile() -> While {
		
		if type == "While" && children.count == 5 && children[0].type == "while" && children[1].type == "Expression" && children[2].type == "{" && children[3].type == "FunctionBodyStatements" && children[4].type == "}" {
			let arg1 = children[1].convertToExpression()
			let arg3 = children[3].convertToFunctionBodyStatements()
			return .init(arg1, arg3)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToArgument() -> Argument {
		
		if type == "Argument" && children.count == 1 && children[0].type == "Expression" {
			let arg0 = children[0].convertToExpression()
			return .init(arg0)
		}
		
		if type == "Argument" && children.count == 3 && children[0].type == "identifier" && children[1].type == ":" && children[2].type == "Expression" {
			let arg0 = children[0].convertToTerminal()
			let arg2 = children[2].convertToExpression()
			return .init(arg0, arg2)
		}
		
		fatalError()
		
	}

}

public extension SLRNode {

	func convertToDeclaration() -> Declaration {
		
		if type == "Declaration" && children.count == 3 && children[0].type == "Type" && children[1].type == "identifier" && children[2].type == ";" {
			let arg0 = children[0].convertToType()
			let arg1 = children[1].convertToTerminal()
			return .init(arg0, arg1)
		}
		
		if type == "Declaration" && children.count == 5 && children[0].type == "Type" && children[1].type == "identifier" && children[2].type == "=" && children[3].type == "Expression" && children[4].type == ";" {
			let arg0 = children[0].convertToType()
			let arg1 = children[1].convertToTerminal()
			let arg3 = children[3].convertToExpression()
			return .init(arg0, arg1, arg3)
		}
		
		fatalError()
		
	}

}


public extension SLRNode {

    func convertToTerminal() -> String {
    
        if let token = self.token {
            return token.content
        }
        
        fatalError()
    
    }
    
}
