Spinoff.Views.Homes ||= {}

class Spinoff.Views.GameView extends Backbone.View
  template: JST["backbone/templates/game"]
  el: '#game'
  subviewEl: '#game-subview'

  events:
    "click .available-programs": "available_programs"

  initialize: (options) ->

  render: ->
    $(@el).empty()
    $(@el).html(@template(window.company.toJSON()))
    @

  resetSubview: ->
    @$(@subviewEl).html("Loading...")

  setSubview: (content) ->
    @$(@subviewEl).html(content)

  available_programs: ->
    @resetSubview()
    availablePrograms = new Spinoff.Collections.ProgramsCollection()
    availablePrograms.fetch
      success: =>
        view = new Spinoff.Views.AvailableProgramsView
          collection: availablePrograms
        @setSubview(view.render().el)
    false
