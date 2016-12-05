class Assert
	@true: (b)->
		throw "Assertation violated" if not b

	@false: (b)->
		throw "Assertation violated" if b

Assert.true true
Assert.false true
