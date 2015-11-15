
class BubbleChart
  constructor: (data) ->
    @data = data
    @width = $(window).width()
    
    # 70 is meant to represent the height of the header; will likely change
    @height = $(window).height() - 70

    # Define center of vizualization 
    @center = {x: @width / 2, y: @height / 2}
    
        
    # Define custom center points of layouts
    
    @race_centers = {
      "Black": {x: @width / 5, y: @height / 3},
      "Black Hispanic": {x: @width / 2, y: @height / 3},
      "White Hispanic": {x: 4 * @width / 5, y: @height / 3}
      "White": {x: @width / 5, y: 2 * @height / 3},
      "Asian/Pacific Islander": {x: @width / 2, y: 2 * @height / 3},
      "Other": {x: 4 * @width / 5, y: 2 * @height / 3}
    }
    
    @frisked_centers = {
      "Frisked": {x: 1 * @width / 4, y: @height / 2},
      "Not frisked": {x: 3 * @width / 4, y: @height / 2}
    }
    
    # testing purposes
    @balls_centers = {
      "Frisked": {x: 1 * @width / 4, y: @height / 2},
      "Not frisked": {x: 3.5 * @width / 4, y: @height / 2}
    }
        

    # used when setting up force and
    # moving around nodes
    @layout_gravity = 0.01
    @damper = 0.1

    # these will be set in create_nodes and create_vis
    @vis = null
    @nodes = []
    @force = null
    @circles = null

    # nice looking colors - no reason to buck the trend
    @fill_color = d3.scale.ordinal()
      .domain(["low", "medium", "high"])
      .range(["rgba(0,0,0,0.25"])

    
    this.create_nodes()
    this.create_vis()

  # create node objects from original data
  # that will serve as the data behind each
  # bubble in the vis, then add each node
  # to @nodes to be used later
  create_nodes: () =>
    @data.forEach (d) =>
      node = {
        id: d.id
        radius: 7
        race: d.race
        frisked: d.was_frisked
        x: Math.random() * @width
        y: Math.random() * @height
      }
      @nodes.push node

    @nodes.sort (a,b) -> b.value - a.value


  # create svg at #vis and then 
  # create circle representation for each node
  create_vis: () =>
    @vis = d3.select("#vis").append("svg")
      .attr("width", @width)
      .attr("height", @height)
      .attr("id", "svg_vis")

    @circles = @vis.selectAll("circle")
      .data(@nodes, (d) -> d.id)

    # used because we need 'this' in the 
    # mouse callbacks
    that = this

    # radius will be set to 0 initially.
    # see transition below
    @circles.enter().append("circle")
      .attr("r", 0)
      .attr("fill", (d) => @fill_color(d.group))
      .attr("id", (d) -> "bubble_#{d.id}")

    # Fancy transition to make bubbles appear, ending with the
    # correct radius
    @circles.transition().duration(2000).attr("r", (d) -> d.radius)


  # Charge function that is called for each node.
  # Charge is negative because we want nodes to 
  # repel.
  # Dividing by 8 scales down the charge to be
  # appropriate for the visualization dimensions.
  charge: (d) ->
    -Math.pow(d.radius, 2.0) / 4

  # Starts up the force layout with
  # the default values
  start: () =>
    @force = d3.layout.force()
      .nodes(@nodes)
      .size([@width, @height])

  # Sets up force layout to display
  # all nodes in one circle.
  display_group_all: () =>
    @force.gravity(@layout_gravity)
      .charge(this.charge)
      .friction(0.9)
      .on "tick", (e) =>
        @circles.each(this.move_towards_center(e.alpha))
          .attr("cx", (d) -> d.x)
          .attr("cy", (d) -> d.y)
    @force.start()
    
    
    title_x = {"Stop and Frisk": @width / 2}
    title_data = d3.keys(title_x)
    
    title_y = {"Stop and Frisk": @height / 2 + 30}
    title_data = d3.keys(title_y)
    
    
    title = @vis.selectAll(".title")
      .data(title_data)

    title.enter().append("text")
      .attr("class", "article_title")
      .attr("x", (d) => title_x[d] )
      .attr("y", (d) => title_y[d])
      .attr("text-anchor", "middle")
      .text((d) -> d)
    

    this.hide_race()
    this.hide_frisked()

#Initial configuration

  # Moves all circles towards the @center
  # of the visualization
  move_towards_center: (alpha) =>
    (d) =>
      d.x = d.x + (@center.x - d.x) * (@damper + 0.02) * alpha
      d.y = d.y + (@center.y - d.y) * (@damper + 0.02) * alpha
 
 
# Not at all generalized title generating and hiding functionality
  
  # Method to hide titles
  
  hide_title: () =>
    article_title = @vis.selectAll(".article_title").remove()
  
  hide_frisked: () =>
    frisked = @vis.selectAll(".frisked").remove()

  hide_race: () =>
    races = @vis.selectAll(".races").remove()
    
  hide_all_titles: () =>
  	this.hide_title()
  	this.hide_frisked()
  	this.hide_race()

  # Not yet generalized methods to display titles
  
  display_race: () =>
  
    this.hide_all_titles()
    
    race_x = {"Black": @width / 5, "Black Hispanic": @width / 2.1, "White Hispanic": 4 * @width / 5.25, "White": @width / 5, "Asian/Pacific Islander": @width / 2.2, "Other/unspecified": 4 * @width / 5.3}
    race_data = d3.keys(race_x)
    
    race_y = {"Black": @height / 12, "Black Hispanic": @height / 12, "White Hispanic": @height / 12, "White": 2 * @height / 3.25, "Asian/Pacific Islander": 2 * @height / 3.25, "Other/unspecified": 2 * @height / 3.25}
    race_data = d3.keys(race_y)
    
    
    races = @vis.selectAll(".races")
      .data(race_data)

    races.enter().append("text")
      .attr("class", "races")
      .attr("x", (d) => race_x[d] )
      .attr("y", (d) => race_y[d])
      .attr("text-anchor", "center")
      .text((d) -> d)

    
  # Method to display frisked titles
  display_frisked: () =>
    
    this.hide_all_titles()
    
    frisked_x = {"Frisked": @width / 4, "Not frisked": 3 * @width / 4}
    frisked_data = d3.keys(frisked_x)
    
    frisked_y = {"Frisked": @height / 4, "Not frisked": @height / 4}
    frisked_data = d3.keys(frisked_y)
    
    
    frisked = @vis.selectAll(".frisked")
      .data(frisked_data)

    frisked.enter().append("text")
      .attr("class", "frisked")
      .attr("x", (d) => frisked_x[d] )
      .attr("y", (d) => frisked_y[d])
      .attr("text-anchor", "middle")
      .text((d) -> d)

  




#Mostly generalized dot moving functionality

  # sets the display of bubbles to be separated
  # into each category. Does this by calling move_towards
  display_by: (filter_name) =>
    @force.gravity(@layout_gravity)
      .charge(this.charge)
      .friction(0.9)
      .on "tick", (e) =>
        @circles.each(this.move_towards(e.alpha, filter_name))
          .attr("cx", (d) -> d.x)
          .attr("cy", (d) -> d.y)
    @force.start()

    if filter_name == "race"
        this.display_race()
    if filter_name is "frisked"
        this.display_frisked()

  # move all circles to their associated target centers
  move_towards: (alpha, filter_name) =>
  	
    if filter_name == "race"
      target_filter_centers = @race_centers
    if filter_name is "frisked"
      target_filter_centers = @frisked_centers

    (d) =>
      target = target_filter_centers[d[filter_name]]
          
      d.x = d.x + (target.x - d.x) * (@damper + 0.02) * alpha * 1.1
      d.y = d.y + (target.y - d.y) * (@damper + 0.02) * alpha * 1.1


root = exports ? this

$ ->
  chart = null

  render_vis = (csv) ->
    chart = new BubbleChart csv
    chart.start()
    root.display_all()
  root.display_all = () =>
    chart.display_group_all()
  root.display_byfilter = (filter_type) =>
    chart.display_by(filter_type)
  root.toggle_view = (view_type) =>
    if view_type == 'all'
      root.display_all()
    else if view_type != ''      
       root.display_byfilter(view_type)
    else
      root.display_all()

  d3.csv "data/sampled_stop_and_frisk_533.csv", render_vis