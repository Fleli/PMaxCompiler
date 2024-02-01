        
// Macro.swift
// Auto-generated by SwiftParse
// See https://github.com/Fleli/SwiftParse

public class Macro: CustomStringConvertible {
	
	let name: String
	let expression: Expression
	
	init(_ name: String, _ expression: Expression) {
		self.name = name
		self.expression = expression
	}

	public var description: String {
		"macro " + name.description + " " + "= " + expression.description + " "
	}
	
}
