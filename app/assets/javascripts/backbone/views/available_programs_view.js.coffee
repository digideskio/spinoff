class Spinoff.Views.AvailableProgramsView extends Backbone.View
  template: JST["backbone/templates/available_programs"]

  initialize: (opts) ->
    @collection.bind 'reset', @render, @

  render: ->
    $(@el).html(@template())
    listElement = @$('table > tbody')
    listElement.empty()
    for program in @collection.models
      programView = new Spinoff.Views.AvailableProgramView(model: program)
      listElement.append programView.render().el
    @

class Spinoff.Views.AvailableProgramView extends Backbone.View
  template: JST["backbone/templates/available_program"]
  tagName: 'tr'

  events:
    "click .buy": "buy"

  initialize: ->
    @model.bind 'change', @render, @

  render: ->
    content = $(@template(program: @model))
    if company.get("money") < @model.get("price")
      content.find('.buy').remove()
    $(@el).html(content)
    @

  buy: (e) ->
    e.preventDefault()
    @model.set(company_id: company.get("id"))
    @model.save()
    company.programs.add(@model)
    $(@el).remove()
    @
