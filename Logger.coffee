[ERROR, WARN, ASSERT, LOG, TRACE, DEBUG] = [1..6]

class Logger
	constructor: (@prefix, @level)->
		@prefix ?= ''
		@prefix = '.' + @prefix
		@level ?= if window?.NDEBUG? or global?.NDEBUG
			ASSERT
		else
			DEBUG

	error: (v...)->
		if @level >= ERROR
			(console.error.bind this) @prefix, v...
		this

	warn: (v...)->
		if @level >= WARN
			(console.warn.bind this) @prefix, v...
		this

	assert: (assertation, v...)->
		if @level >= ASSERT
			(console.assert.bind this) assertation, @prefix, v...
		this

	log: (v...)->
		if @level >= LOG
			(console.log.bind this) @prefix, v...
		this

	trace: (v...)->
		if @level >= TRACE
			(console.trace.bind this) @prefix, v...
		this

	debug: (v...)->
		if @level >= DEBUG
			(console.debug.bind this) @prefix, v...
		this

module.exports =
	Logger: Logger
	ERROR: ERROR
	WARN: WARN
	ASSERT: ASSERT
	LOG: LOG
	TRACE: TRACE
	DEBUG: DEBUG

