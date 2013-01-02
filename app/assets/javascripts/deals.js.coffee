Place = (data) ->
  @name = ko.observable(data.name)
  @id = ko.observable(data.id)
  @slug = ko.observable(data.slug)
  return false

Category = (data) ->
  @name = ko.observable(data.name)
  @id = ko.observable(data.id)
  @slug = ko.observable(data.slug)
  return false

SelectViewModel = ->
  self = this
  self.places = ko.observableArray([])
  self.categories = ko.observableArray([])  
  self.deals = ko.observableArray([])
  self.current_place_id = ko.observable()
  self.current_category_id = ko.observable()

  self.deals_path = ko.computed(-> 
    if typeof(self.current_place_id()) is 'string' and typeof(self.current_category_id()) is 'string'
      "deals/#{self.current_place_id()}/#{self.current_category_id()}"
    else if typeof(self.current_place_id()) is 'string'
      "deals/#{self.current_place_id()}"
    else if typeof(self.current_category_id()) is 'string'
      "deals/for/#{self.current_category_id()}" 
    else 
      ""
  )

  $.getJSON "deals/places", (allData) ->
    mappedPlaces = $.map(allData, (item) ->
      new Place(item)
    )
    self.places(mappedPlaces)
  
  
  $.getJSON "deals/categories", (allData) ->
    mappedCategories = $.map(allData, (item) ->
      new Category(item)
    )
    self.categories(mappedCategories)
 

  self.ready = ->
    if typeof(self.current_place_id()) is 'string' or typeof(self.current_category_id() is 'string')
      true 
    else
      false

  self.getDeals = ->
    if self.ready()
      $.ajax 
        url: self.deals_path()
        data: ko.toJSON()
        contentType: "application/json"
        success: (result) ->
          self.deals(result)
  
  self.current_place_id.subscribe(
    () ->
      self.getDeals()
    this)

  self.current_category_id.subscribe( 
    () ->
      self.getDeals()
    this)
  return false   

ko.applyBindings new SelectViewModel()
