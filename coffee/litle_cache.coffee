class LitleCache
  constructor: ->
    @cached = {}
    @_disabled = false

  hasItem: (key) ->
    if @disabled() then false else @cached[key]?

  setItem: (key, value)->
    @cached[key] = value
    return @

  getItem: (key, defaultValue = false)->
    if @hasItem(key) then @cached[key] else defaultValue

  get: (key, defaultValue) ->
    unless key? then @cached else @getItem key, defaultValue

  removeItem: (key) ->
    if @hasItem(key) then delete @cached[key]
    return @

  clear: ->
    @cached = {}
    return @

  enable: -> @_disabled = false
  disable: -> @_disabled = true

  enabled: -> not @_disabled
  disabled: -> @_disabled