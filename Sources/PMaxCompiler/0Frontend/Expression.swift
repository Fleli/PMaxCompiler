        
// Expression.swift
// Auto-generated by SwiftParse
// See https://github.com/Fleli/SwiftParse

public indirect enum Expression: CustomStringConvertible {
	
	public enum InfixOperator: String {
		case operator_0 = "||"
		case operator_1 = "&&"
		case operator_2 = "|"
		case operator_3 = "^"
		case operator_4 = "&"
		case operator_5 = "=="
		case operator_6 = "!="
		case operator_7 = "<"
		case operator_8 = ">"
		case operator_9 = "<="
		case operator_10 = ">="
		case operator_11 = "<<"
		case operator_12 = ">>"
		case operator_13 = "+"
		case operator_14 = "-"
		case operator_15 = "*"
		case operator_16 = "/"
		case operator_17 = "%"
	}
	
	case infixOperator(InfixOperator, Expression, Expression)
	
	public enum SingleArgumentOperator: String {
		case operator_0 = "TypeCast"
		case operator_1 = "sizeof"
		case operator_2 = "*"
		case operator_3 = "!"
		case operator_4 = "~"
		case operator_5 = "-"
	}
	
	case singleArgumentOperator(SingleArgumentOperator, Expression)
	
	case TerminalExpressionTerminal(String, Expression, String)
	case Reference(Reference)
	case identifierTerminalArgumentsTerminal(String, String, Arguments, String)

	public var description: String {
		switch self {
		case .infixOperator(let op, let a, let b): return "(\(a.description) \(op.rawValue) \(b.description))"
		case .singleArgumentOperator(let op, let a): return "(\(op.rawValue) \(a.description))"
		case .TerminalExpressionTerminal(_, let expression, _): return "(" + expression.description + ")"
		case .Reference(let reference): return reference.description
		case .identifierTerminalArgumentsTerminal(_, _, let arguments, _): return "identifier" + "(" + arguments.description + ")"
		}
	}
	
}
