class StopAndFriskInteractive
  win_width = $(window).width()
  win_height = $(window).height() - 46
  if window.screen.width <=1024
    win_height = $(window).height() - 37
  
  iPadPortrait = false
  if window.screen.width == 768 && window.screen.height == 1024
    iPadPortrait = true
  
  constructor: (data) ->
    @data = data

    @width = win_width
    @height = win_height
    
    iPadPortrait = false
    if window.screen.width == 768 && window.screen.height == 1024
      iPadPortrait = true

    # Define center of vizualization
        
    @center = {x: @width / 3, y: @height / 1.875}
		
    if iPadPortrait == true
      @center = {x: @width / 2, y: @height / 3}
	
    @extras_center = {x: (@width / 2), y: 1.9 * @height}
    
    @radius_size = 6
    if @width <= 1024
      @radius_size = 5


    # DEFINE CUSTOM CENTER POINTS OF LAYOUTS

    @mappings =
        reason_for_frisk:
           centers:
              "Furtive movements":
                 x: @width / 6.5
                 y: 11 * @height / 30
              "Violent crime suspected":
                 x: @width / 3.25
                 y: 11 * @height / 30
              "Inappropriate attire for season":
                 x: @width / 2.1
                 y: 11 * @height / 30
              "Actions of engaging in a violent crime":
                 x: 2 * @width / 3.1
                 y: 11 * @height / 30
              "Refuse to comply with officer directions":
                 x: 5.1 * @width / 6
                 y: 11 * @height / 30
              "Verbal threats by suspect":
                 x: @width / 6.6
                 y: 22 * @height / 30
              "Knowledge of prior criminal behavior":
                 x: @width / 3.1
                 y: 23 * @height / 30
              "Suspicious bulge":
                 x: @width / 2.03
                 y: 23.5 * @height / 30
              "Other suspicion of weapons":
                 x: 2 * @width / 3
                 y: 24 * @height / 30               
              "do_not_include": 
                 @extras_center
           titles_x:
              "Furtive movements": @width / 6.8              
              "Violent crime": @width / 3
              "suspected": @width / 3
              "Inappropriate attire": @width / 2
              "for season": @width / 2
              "Actions of engaging": 2 * @width / 3
              "in a violent crime": 2 * @width / 3
              "Refusal to comply": 6 * @width / 7
              "with officer directions": 6 * @width / 7
              "Verbal threats": @width / 6.8  
              "by suspect": @width / 6.8              
              "Knowledge of prior": @width / 3
              "criminal behavior": @width / 3
              "Suspicious bulge": @width / 2
              "Other suspicion": 2.05 * @width / 3
              "of weapons": 2.05 * @width / 3
           titles_y:
              "Furtive movements": @height / 7
              "Violent crime": @height / 7
              "suspected": @height / 7 + 17
              "Inappropriate attire": @height / 7
              "for season": @height / 7 + 17
              "Actions of engaging": @height / 7
              "in a violent crime": (@height / 7) + 17
              "Refusal to comply": @height / 7
              "with officer directions": @height / 7 + 17            
              "Verbal threats": 2 * @height / 3
              "by suspect": 2 * @height / 3 + 17         
              "Knowledge of prior": 2 * @height / 3
              "criminal behavior": 2 * @height / 3 + 17             
              "Suspicious bulge": 2 * @height / 3
              "Other suspicion": 2 * @height / 3
              "of weapons": 2 * @height / 3 + 17
        reason_for_stop:
           centers:
              "Furtive movements":
                 x: @width / 6.5
                 y: 11 * @height / 30
              "Actions of engaging in a violent crime":
                 x: @width / 3.25
                 y: 11 * @height / 30
              "Carrying suspicious object":
                 x: @width / 2
                 y: 11 * @height / 30
              "Casing a victim or location":
                 x: 2 * @width / 3
                 y: 11 * @height / 30
              "Fits a relevant description":
                 x: 5 * @width / 6
                 y: 11 * @height / 30
              "Actions indicative of a drug transaction":
                 x: @width / 6.5
                 y: 22 * @height / 30
              "Suspect acting as a lookout":
                 x: @width / 3
                 y: 23 * @height / 30
              "Suspicious bulge":
                 x: @width / 2.06
                 y: 22 * @height / 30
              "Wearing clothes commonly used in a crime":
                 x: 2 * @width / 3
                 y: 22 * @height / 30
              "Other":
                 x: 6 * @width / 7.05
                 y: 22 * @height / 30                 
              "do_not_include": 
                 @extras_center
           titles_x:
              "Actions indicative": @width / 6.8
              "of a drug transaction": @width / 6.8              
              "Actions of engaging": @width / 3
              "in a violent crime": @width / 3              
              "Carrying": @width / 2
              "suspicious object": @width / 2
              "Casing a victim": 2 * @width / 3
              "or location": 2 * @width / 3
              "Fits a relevant": 6 * @width / 7
              "description": 6 * @width / 7
              "Furtive movements": @width / 6.8
              "Suspect acting": @width / 3
              "as a lookout": @width / 3
              "Suspicious bulge": @width / 2
              "Clothes commonly": 2.05 * @width / 3
              "used in a crime": 2.05 * @width / 3              
              "Other": 6 * @width / 7
           titles_y:
              "Furtive movements": @height / 7
              "Actions of engaging": @height / 7
              "in a violent crime": @height / 7 + 17             
              "Carrying": @height / 7
              "suspicious object": @height / 7 + 17
              "Casing a victim": @height / 7
              "or location": @height / 7 + 17
              "Fits a relevant": @height / 7
              "description": @height / 7 + 17
              "Actions indicative": 2 * @height / 3
              "of a drug transaction": 2 * @height / 3 + 17            
              "Suspect acting": 2 * @height / 3
              "as a lookout": 2 * @height / 3 + 17
              "Suspicious bulge": 2 * @height / 3
              "Clothes commonly": 2 * @height / 3
              "used in a crime": 2 * @height / 3 + 17             
              "Other": 2 * @height / 3              
        race:
           centers:
              "Black":
                 x: @width / 5.1
                 y: 12 * @height / 30
              "Black Hispanic":
                 x: @width / 2.1
                 y: 11 * @height / 30
              "White Hispanic":
                 x: 4 * @width / 5.05
                 y: 11 * @height / 30
              "White":
                 x: @width / 5
                 y: 22 * @height / 30
              "Asian/Pacific Islander":
                 x: @width / 2.1
                 y: 22 * @height / 30
              "Other":
                 x: 4 * @width / 5
                 y: 22 * @height / 30
              "do_not_include": 
                 @extras_center
           titles_x:
              "Black": @width / 5
              "Black Hispanic": @width / 2
              "White Hispanic": 4 * @width / 5
              "White": @width / 5
              "Asian/Pacific Islander": @width / 2
              "Other/unspecified": 4 * @width / 5
           titles_y:
              "Black": @height / 7
              "Black Hispanic": @height / 7
              "White Hispanic": @height / 7
              "White": 2 * @height / 3.15
              "Asian/Pacific Islander": 2 * @height / 3.15
              "Other/unspecified": 2 * @height / 3.15
        age:
           centers:
              "Under 16":
                 x: @width / 5
                 y: 12 * @height / 30
              "16 to 19":
                 x: 2 * @width / 5
                 y: 12 * @height / 30
              "20 to 29":
                 x: 3 * @width / 5.05
                 y: 12 * @height / 30
              "30 to 39":
                 x: 4* @width / 5
                 y: 12 * @height / 30
              "40 to 49":
                 x: @width / 5
                 y: 23 * @height / 30
              "50 to 59":
                 x: 2 * @width / 5.1
                 y: 22 * @height / 30
              "60+":
                 x: 3 * @width / 5.1
                 y: 22 * @height / 30                 
              "do_not_include": 
                 @extras_center                 
           titles_x:
              "Under 16": @width / 6
              "16 to 19": 2 * @width / 5.3
              "20 to 29": 3 * @width / 5
              "30 to 39": 5 * @width / 6
              "40 to 49": @width / 6
              "50 to 59": 2 * @width / 5.3
              "60+": 3 * @width / 5              
           titles_y:
              "Under 16": @height / 7
              "16 to 19": @height / 7
              "20 to 29": @height / 7
              "30 to 39": @height / 7
              "40 to 49": 2 * @height / 3.2
              "50 to 59": 2 * @height / 3.2
              "60+": 2 * @height / 3.2              
        borough:
           centers:
              "Manhattan":
                 x: @width / 5
                 y: 11 * @height / 30
              "Brooklyn":
                 x: @width / 2.05
                 y: 12 * @height / 30
              "Bronx":
                 x: 4 * @width / 5.05
                 y: 12 * @height / 30
              "Queens":
                 x: @width / 5
                 y: 24 * @height / 30
              "Staten Island":
                 x: @width / 2.05
                 y: 22 * @height / 30
              "do_not_include": 
                 @extras_center                 
           titles_x:
              "Manhattan": @width / 5.1
              "Brooklyn": @width / 2
              "Bronx": 4 * @width / 5
              "Queens": @width / 5.1
              "Staten Island": @width / 2
           titles_y:
              "Manhattan": @height / 7
              "Brooklyn": @height / 7
              "Bronx": @height / 7
              "Queens": 2 * @height / 3.2
              "Staten Island": 2 * @height / 3.2
        frisked:
           centers:
              "Frisked":
                 x: 1 * @width / 4
                 y: @height / 1.9
              "Not frisked":
                 x: 3 * @width / 4
                 y: @height / 1.9
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "Frisked": @width / 4
              "Not frisked": 3 * @width / 4
           titles_y:
              "Frisked": @height / 4
              "Not frisked": @height / 4
        sex:
           centers:
              "Male":
                 x: @width / 4.25
                 y: @height / 1.725
              "Female":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "Men": @width / 4
              "Women": 3 * @width / 4
           titles_y:
              "Men": @height / 4
              "Women": @height / 4
        physical_force_used:
           centers:
              "Force not used":
                 x: 1 * @width / 4.25
                 y: @height / 1.875
              "Force used":
                 x: 3 * @width / 4.05
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "Force not used": @width / 4
              "Force used": 3 * @width / 4
           titles_y:
              "Force not used": @height / 4
              "Force used": @height / 4
        arrest_made:
           centers:
              "No arrest made":
                 x: 1 * @width / 4.25
                 y: @height / 1.725
              "Arrest made":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "No arrest made": @width / 4
              "Arrest made": 3 * @width / 4
           titles_y:
              "No arrest made": @height / 4
              "Arrest made": @height / 4 
        summons_issued:
           centers:
              "No summons issued":
                 x: 1 * @width / 4.25
                 y: @height / 1.725
              "Summons issued":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "No summons issued": @width / 4
              "Summons issued": 3 * @width / 4
           titles_y:
              "No summons issued": @height / 4
              "Summons issued": @height / 4 
        contraband_found:
           centers:
              "No contraband found":
                 x: 1 * @width / 4.25
                 y: @height / 1.725
              "Contraband found":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "No contraband found": @width / 4
              "Contraband found": 3 * @width / 4
           titles_y:
              "No contraband found": @height / 4
              "Contraband found": @height / 4 
        weapon_found:
           centers:
              "No weapon found":
                 x: 1 * @width / 4.25
                 y: @height / 1.725
              "Weapon found":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "No weapon found": @width / 4
              "Weapon found": 3 * @width / 4
           titles_y:
              "No weapon found": @height / 4
              "Weapon found": @height / 4 
        gun_found:
           centers:
              "No gun found":
                 x: 1 * @width / 4.25
                 y: @height / 1.725
              "Gun found":
                 x: 3 * @width / 4.1
                 y: @height / 2
              "do_not_include": 
                 @extras_center                   
           titles_x:
              "No gun found": @width / 4
              "Gun found": 3 * @width / 4
           titles_y:
              "No gun found": @height / 4
              "Gun found": @height / 4 
        related:
           centers:
              "do_not_include": 
                 @extras_center                                 


    # Define gravity and damper
    @layout_gravity = 0.01
    @damper = 0.1

    @vis = null
    @nodes = []
    @force = null
    @circles = null

    this.create_nodes()
    this.create_vis()

  # create nodes from data
  create_nodes: () =>
    @data.forEach (d) =>
      if d.is_extra == "0"
	      node = {
	        id: d.ser_num
	        is_extra: d.is_extra
	        radius: @radius_size
	        color: "rgba(0,0,0,0.25)"
	        race: d.race
	        sex: d.sex
	        age: d.age_bucket	        
	        borough: d.borough
	        frisked: d.was_frisked
	        reason_for_stop: d.reason_for_stop_2
	        reason_for_frisk: d.reason_for_frisk
	        physical_force_used: d.physical_force_used
	        arrest_made: d.arrest_made
	        summons_issued: d.summons_issued
	        weapon_found: d.weapon_found
	        contraband_found: d.contraband_found
	        gun_found: d.gun_found
	        related: "do_not_include"
	        x: (Math.random() * 2 * @width) - (@width / 2)
	        y: Math.random() * 2 * @height - (@height / 2)
	        }
      else if d.is_extra == "1"
	      node = {
	        id: d.ser_num
	        is_extra: d.is_extra
	        radius: @radius_size
	        color: "rgba(0,0,0,0.25)"
	        race: d.race
	        sex: d.sex
	        age: d.age_bucket	        
	        borough: d.borough
	        frisked: d.was_frisked
	        reason_for_stop: d.reason_for_stop_2
	        reason_for_frisk: d.reason_for_frisk
	        physical_force_used: d.physical_force_used
	        arrest_made: d.arrest_made
	        summons_issued: d.summons_issued
	        weapon_found: d.weapon_found
	        contraband_found: d.contraband_found
	        gun_found: d.gun_found
	        related: "do_not_include"
	        x: (Math.random() * @width)
	        y: 1.5 * @height
	        }
      @nodes.push node

    @nodes.sort (a,b) -> b.value - a.value


  # create svg, then create dots
  create_vis: () =>
    
    @vis_height = d3.select("#vis")
      .style("height", @height)

    @vis = d3.select("#vis").append("svg")
      .attr("width", @width)
      .attr("height", @height)
      .attr("id", "svg_vis")

    @circles = @vis.selectAll("circle")
      .data(@nodes, (d) -> d.id)

    # used because we need 'this' in the mouse callbacks
    that = this

    # radius will be set to 0 initially.
    @circles.enter().append("circle")
      .attr("r", 0)
      .attr("fill", (d) -> d.color)
      .attr("id", (d) -> "bubble_#{d.id}")

    # Transition to make dots appear
    @circles.transition().duration(2000).attr("r", (d) -> d.radius)



  # Charge is negative because we want nodes to repel
  charge: (d) ->
    -Math.pow(d.radius, 2.0) / 4

  # Starts up the force layout with the default values
  start: () =>
    @force = d3.layout.force()
      .nodes(@nodes)
      .size([@width, @height])

  # Sets up force layout to display all nodes in one circle.
  display_group_all: () =>
    @force.gravity(@layout_gravity)
      .charge(this.charge)
      .friction(0.9)
      .on "tick", (e) =>
        @circles.each(this.move_towards_center(e.alpha))
          .attr("cx", (d) -> d.x)
          .attr("cy", (d) -> d.y)
    @force.start()

    if iPadPortrait == true
      title_x = {"Stop and Frisk": @width / 2}
      title_data = d3.keys(title_x)
      title_y = {"Stop and Frisk": @height / 3 + 20}
      title_data = d3.keys(title_y)
    else
      title_x = {"Stop and Frisk": @width / 3}
      title_data = d3.keys(title_x)
      title_y = {"Stop and Frisk": @height / 2 + 20}
      title_data = d3.keys(title_y)
      
    this.hide_all_titles()

    title = @vis.selectAll(".title")
      .data(title_data)
    
      
    title.enter().append("text")
      .attr("opacity", 0)
      .attr("class", "article_title")
      .attr("x", (d) => title_x[d] )
      .attr("y", (d) => title_y[d])
      .attr("text-anchor", "middle")
      .text((d) -> d)
      .transition().duration(400).attr("opacity", 1)

    if iPadPortrait == true        
        text = @vis.append('foreignObject')
          .attr('x', @width / 4)
          .attr('y', 2* @height / 3)
          .attr('width', @width / 2)
          .attr('height', @height)
          .classed('foreignHTMLelement', true)
          .append("xhtml:div")
          .html('<span><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></span>')
    else
        text = @vis.append('foreignObject')
          .attr('x', 1.9 * @width / 3)
          .attr('y', @height / 4)
          .attr('width', @width / 4)
          .attr('height', @height)
          .classed('foreignHTMLelement', true)
          .append("xhtml:div")
          .html('<span><p><strong>Introduction</strong></p><p>These days, the NYPD’s “stop, question, and frisk” tactic appears to be up against the wall. (Incidentally, so were 1,819 of those stopped last year.) The policing measure, which encourages officers to stop and search people who appear suspicious, and which is used in Brooklyn more than any other borough, has in the last month been ruled unconstitutional, curbed by a pair of City Council bills, and inveighed against by the Democratic field of would-be mayors.</p>
		    <p>But with only long-shot candidate John Liu calling for a complete end to stop-and-frisk, some form of the tactic is likely to endure. This visualization, which reflects the more than 530,000 stops that occurred in 2012, reveals who is being stopped, why they’re being stopped, and what, if anything, is being found by the police as a result. The data, originally made available by the NYPD, was <a href="http://www.nyclu.org/content/stop-and-frisk-data" target="_blank">recently compiled</a> by the&nbsp;NYCLU.<p>
		    <p class="byline">Visualization by Thomas Rhiel</p></span>')          

#Initial configuration

  # Moves all circles towards the @center
  # of the visualization
  move_towards_center: (alpha) =>
    (d) =>
      if d.is_extra == "0"
	      d.x = d.x + (@center.x - d.x) * (@damper + 0.02) * alpha
	      d.y = d.y + (@center.y - d.y) * (@damper + 0.02) * alpha
      else if d.is_extra == "1"
	      d.x = d.x + (@extras_center.x - d.x) * (@damper + 0.02) * alpha
	      d.y = d.y + (@extras_center.y - d.y) * (@damper + 0.02) * alpha

# Generalized title generating and hiding functionality

  # Method to hide all labels

  hide_all_titles: () ->
    hide_titles = @vis.selectAll(".article_title, .foreignHTMLelement, .filter_label")
        .transition().duration(200).attr("opacity", 0)
        .remove()

# Generalized method to display labels

  display_labels: (name_of_filter) ->
  	
  	if name_of_filter == "related"
  	  this.hide_all_titles()
  	  
  	  text = @vis.append('foreignObject')
          .attr('x', 0.1 * @width)
          .attr('y', @height / 3.75)
          .attr('width', 0.8 * @width)
          .attr('height', @height)
          .classed('foreignHTMLelement', true)
          .classed('relatedVisualizations', true)
          .append("xhtml:div")
          .html('<span><h2>More visualizations</h2><div><h3><a href="http://bklynr.com/block-by-block-brooklyns-past-and-present/">Block by Block, Brooklyn’s Past and Present</a></h3><p>Exploring the history of the borough through the ages of its more than 320,000 buildings. A map by Thomas&nbsp;Rhiel
</p></div><div><h3><a href="http://bklynr.com/mean-streets/">Mean Streets</a></h3><p>A data-driven look at Brooklyn’s most dangerous roads for cyclists. Interactive map by Nilkanth&nbsp;Patel</p></div><div class="last"><h3><a href="http://bklynr.com/brooklyn-beat/">Brooklyn Beat</a></h3><p>How coverage of Brooklyn has changed. An interactive map by Nilkanth&nbsp;Patel</p></div></span>')          

    else
	    this.hide_all_titles()
	    title_x_coordinates = @mappings[name_of_filter].titles_x
	    title_y_coordinates = @mappings[name_of_filter].titles_y
	    label_data = d3.keys(title_x_coordinates)
	    label_data = d3.keys(title_y_coordinates)
	    labels = @vis.selectAll(name_of_filter)
	      .data(label_data)
	    labels.enter().append("text")
	      .attr("opacity", "0")
	      .attr("class", name_of_filter)
	      .classed("filter_label", true)
	      .attr("x", (d) => title_x_coordinates[d])
	      .attr("y", (d) => title_y_coordinates[d])
	      .attr("text-anchor", "middle")
	      .text((d) -> d)
	      .transition().duration(400).attr("opacity", 1)


# Generalized dot moving functionality

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
	
    this.display_labels(filter_name)

  # move all circles to their associated target centers
  move_towards: (alpha, filter_name) =>

    target_filter_centers = @mappings[filter_name].centers

    (d) =>

      target = target_filter_centers[d[filter_name]]

      d.x = d.x + (target.x - d.x) * (@damper + 0.02) * alpha * 1.1
      d.y = d.y + (target.y - d.y) * (@damper + 0.02) * alpha * 1.1


root = exports ? this

$ ->
  chart = null

  render_vis = (csv) ->
    chart = new StopAndFriskInteractive csv
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

  d3.csv "wp/wp-content/themes/bklynr/stopfrisk/data/sampled_stop_and_frisk_533_with_extras_pared.csv", render_vis