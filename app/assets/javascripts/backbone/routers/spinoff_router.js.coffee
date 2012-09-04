class Spinoff.Routers.SpinoffRouter extends Backbone.Router
  initialize: (options) ->
    @view = options.gameView

  routes:
    "available-programs": "availablePrograms"
    "my-programs": "myPrograms"
    "schedule": "schedule"

  availablePrograms: ->
    @view.availablePrograms()

  myPrograms: ->
    @view.myPrograms()

  schedule: ->
    @view.schedule()
