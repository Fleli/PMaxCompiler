        
// Assignment.swift
// Auto-generated by SwiftParse
// See https://github.com/Fleli/SwiftParse

public class Assignment: CustomStringConvertible {
	
	let lhs: String
	let rhs: Expression
	
	init(_ lhs: String, _ rhs: Expression) {
		self.lhs = lhs
		self.rhs = rhs
	}

	public var description: String {
		lhs.description + " " + "= " + rhs.description + " " + "; "
	}
	
}
