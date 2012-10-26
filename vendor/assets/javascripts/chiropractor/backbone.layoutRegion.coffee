class Backbone.Marionette.Outlet extends Backbone.Events

  constructor: (options = {}) ->
    _.extend(this, options)

    @currentView = null
    throw "must specify el" unless @el.length
    @$el = @el
    this

  show: (view) ->
    view.render()
    @attach(view, false)

  make: (tagName) ->
    jQuery(document.createElement(tagName))


  attach: (view, reTriggerRender = true) ->
    # need to replace this with an empty element so that we keep our place
    placeholder = @make("div")

    # ok, so do the replacing here
    @$el.replaceWith(placeholder)

    # be nice and neat, the view if there was one
    @currentView?.close()

    # yay, a new view
    @currentView = view
    return unless view

    # questionable, this needs more thought but I'm leaving it in
    # basically, there's no clear lifecycle defined so until there is
    # this needs to be here
    view.trigger("render") if reTriggerRender

    # now that we've made sure it's had all the time it needs to
    # render and all that, replace the placeholder
    placeholder.replaceWith(view.el)
    @$el = view.$el

    # now do the callbacks
    view.onShow() if _.isFunction(view.onShow)
    view.trigger("show")

  close: ->
    placeHolder = @make("div")
    @$el.replaceWith(placeHolder)
    @$el = placeHolder

    if @currentView && _.isFunction(@currentView.close)
      @currentView.close()


class Backbone.Marionette.LayoutRegion extends Backbone.Marionette.Layout
  constructor: (options = {}) ->
    super(options)
    @bindTo(this, "render", @initializeOutlets, this)

  initializeOutlets: ->
    return unless @outlets

    @outletBindings = @outlets
    @outlets = {}

    _(@outletBindings).each (selector, name) =>
      @outlets[name] = new Backbone.Marionette.Outlet(el: @$(selector))

  close: () ->
    _(@outlets).each (outlet, name) ->
      outlet.close()

    super()

