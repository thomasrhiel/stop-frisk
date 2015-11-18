var StopAndFriskInteractive, root;

StopAndFriskInteractive = (function() {

	function StopAndFriskInteractive(data) {
		this.data = data;
		this.width = window.innerWidth;
		this.height = window.innerWidth <= 1024 ? window.innerHeight - 37 : window.innerHeight - 46;
		this.iPadPortrait = (this.width === 768 && window.screen.height === 1024 && (Math.abs(window.orientation) !== 90)) ? true : false;
		this.center = this.iPadPortrait ? {
			x: this.width / 2,
			y: this.height / 4
		} : {
			x: this.width / 3,
			y: this.height / 1.875
		};
		this.extras_center = {
			x: this.width / 2,
			y: 1.9 * this.height
		};
		this.radius_size = this.width <= 1024 ? 5 : 6;
		this.mappings = {
			reason_for_frisk: {
				centers: {
					"Furtive movements": {
						x: this.width / 6.5,
						y: 11 * this.height / 30
					},
					"Violent crime suspected": {
						x: this.width / 3.25,
						y: 11 * this.height / 30
					},
					"Inappropriate attire for season": {
						x: this.width / 2.1,
						y: 11 * this.height / 30
					},
					"Actions of engaging in a violent crime": {
						x: 2 * this.width / 3.1,
						y: 11 * this.height / 30
					},
					"Refuse to comply with officer directions": {
						x: 5.1 * this.width / 6,
						y: 11 * this.height / 30
					},
					"Verbal threats by suspect": {
						x: this.width / 6.6,
						y: 22 * this.height / 30
					},
					"Knowledge of prior criminal behavior": {
						x: this.width / 3.1,
						y: 23 * this.height / 30
					},
					"Suspicious bulge": {
						x: this.width / 2.03,
						y: 23.5 * this.height / 30
					},
					"Other suspicion of weapons": {
						x: 2 * this.width / 3,
						y: 24 * this.height / 30
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Furtive movements": {
						x: this.width / 6.8,
						y: this.height / 7
					},
					"Violent crime": {
						x: this.width / 3,
						y: this.height / 7
					},
					"suspected": {
						x: this.width / 3,
						y: this.height / 7 + 17
					},
					"Inappropriate attire": {
						x: this.width / 2,
						y: this.height / 7
					},
					"for season": {
						x: this.width / 2,
						y: this.height / 7 + 17
					},
					"Actions of engaging": {
						x: 2 * this.width / 3,
						y: this.height / 7
					},
					"in a violent crime": {
						x:  2 * this.width / 3,
						y: (this.height / 7) + 17
					},
					"Refusal to comply": {
						x: 6 * this.width / 7,
						y: this.height / 7
					},
					"with officer directions": {
						x: 6 * this.width / 7,
						y: this.height / 7 + 17
					},
					"Verbal threats": {
						x: this.width / 6.8,
						y: 2 * this.height / 3
					},
					"by suspect": {
						x: this.width / 6.8,
						y: 2 * this.height / 3 + 17
					},
					"Knowledge of prior": {
						x: this.width / 3,
						y: 2 * this.height / 3
					},
					"criminal behavior": {
						x:  this.width / 3,
						y: 2 * this.height / 3 + 17
					},
					"Suspicious bulge": {
						x: this.width / 2,
						y: 2 * this.height / 3
					},
					"Other suspicion": {
						x:  2.05 * this.width / 3,
						y:  2 * this.height / 3
					},
					"of weapons": {
						x: 2.05 * this.width / 3,
						y: 2 * this.height / 3 + 17
					}
				}
			},
			reason_for_stop: {
				centers: {
					"Furtive movements": {
						x: this.width / 6.5,
						y: 11 * this.height / 30
					},
					"Actions of engaging in a violent crime": {
						x: this.width / 3.25,
						y: 11 * this.height / 30
					},
					"Carrying suspicious object": {
						x: this.width / 2,
						y: 11 * this.height / 30
					},
					"Casing a victim or location": {
						x: 2 * this.width / 3,
						y: 11 * this.height / 30
					},
					"Fits a relevant description": {
						x: 5 * this.width / 6,
						y: 11 * this.height / 30
					},
					"Actions indicative of a drug transaction": {
						x: this.width / 6.5,
						y: 22 * this.height / 30
					},
					"Suspect acting as a lookout": {
						x: this.width / 3,
						y: 23 * this.height / 30
					},
					"Suspicious bulge": {
						x: this.width / 2.06,
						y: 22 * this.height / 30
					},
					"Wearing clothes commonly used in a crime": {
						x: 2 * this.width / 3,
						y: 22 * this.height / 30
					},
					"Other": {
						x: 6 * this.width / 7.05,
						y: 22 * this.height / 30
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Actions indicative": {
						x: this.width / 6.8,
						y: 2 * this.height / 3
					},
					"of a drug transaction": {
						x: this.width / 6.8,
						y: 2 * this.height / 3 + 17
					},
					"Actions of engaging": {
						x:  this.width / 3,
						y: this.height / 7
					},
					"in a violent crime": {
						x: this.width / 3,
						y: this.height / 7 + 17
					},
					"Carrying": {
						x: this.width / 2,
						y: this.height / 7
					},
					"suspicious object": {
						x: this.width / 2,
						y: this.height / 7 + 17
					},
					"Casing a victim": {
						x: 2 * this.width / 3,
						y: this.height / 7
					},
					"or location": {
						x: 2 * this.width / 3,
						y: this.height / 7 + 17
					},
					"Fits a relevant": {
						x: 6 * this.width / 7,
						y: this.height / 7
					},
					"description": {
						x: 6 * this.width / 7,
						y: this.height / 7 + 17
					},
					"Furtive movements": {
						x: this.width / 6.8,
						y: this.height / 7
					},
					"Suspect acting": {
						x: this.width / 3,
						y: 2 * this.height / 3
					},
					"as a lookout": {
						x: this.width / 3,
						y: 2 * this.height / 3 + 17
					},
					"Suspicious bulge": {
						x: this.width / 2,
						y: 2 * this.height / 3
					},
					"Clothes commonly": {
						x: 2.05 * this.width / 3,
						y: 2 * this.height / 3
					},
					"used in a crime": {
						x: 2.05 * this.width / 3,
						y: 2 * this.height / 3 + 17
					},
					"Other": {
						x: 6 * this.width / 7,
						y:2 * this.height / 3
					}
				}
			},
			race: {
				centers: {
					"Black": {
						x: this.width / 5.1,
						y: 12 * this.height / 30
					},
					"Black Hispanic": {
						x: this.width / 2.1,
						y: 11 * this.height / 30
					},
					"White Hispanic": {
						x: 4 * this.width / 5.05,
						y: 11 * this.height / 30
					},
					"White": {
						x: this.width / 5,
						y: 22 * this.height / 30
					},
					"Asian/Pacific Islander": {
						x: this.width / 2.1,
						y: 22 * this.height / 30
					},
					"Other": {
						x: 4 * this.width / 5,
						y: 22 * this.height / 30
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Black": {
						x: this.width / 5,
						y:this.height / 7
					},
					"Black Hispanic": {
						x: this.width / 2,
						y: this.height / 7
					},
					"White Hispanic": {
						x: 4 * this.width / 5,
						y: this.height / 7
					},
					"White": {
						x: this.width / 5,
						y: 2 * this.height / 3.15
					},
					"Asian/Pacific Islander": {
						x: this.width / 2,
						y: 2 * this.height / 3.15
					},
					"Other/unspecified": {
						x: 4 * this.width / 5,
						y: 2 * this.height / 3.15
					}
				}
			},
			age: {
				centers: {
					"Under 16": {
						x: this.width / 5,
						y: 12 * this.height / 30
					},
					"16 to 19": {
						x: 2 * this.width / 5,
						y: 12 * this.height / 30
					},
					"20 to 29": {
						x: 3 * this.width / 5.05,
						y: 12 * this.height / 30
					},
					"30 to 39": {
						x: 4 * this.width / 5,
						y: 12 * this.height / 30
					},
					"40 to 49": {
						x: this.width / 5,
						y: 23 * this.height / 30
					},
					"50 to 59": {
						x: 2 * this.width / 5.1,
						y: 22 * this.height / 30
					},
					"60+": {
						x: 3 * this.width / 5.1,
						y: 22 * this.height / 30
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Under 16": {
						x: this.width / 6,
						y: this.height / 7
					},
					"16 to 19": {
						x: 2 * this.width / 5.3,
						y: this.height / 7
					},
					"20 to 29": {
						x: 3 * this.width / 5,
						y: this.height / 7
					},
					"30 to 39": {
						x: 5 * this.width / 6,
						y: this.height / 7
					},
					"40 to 49": {
						x: this.width / 6,
						y: 2 * this.height / 3.2
					},
					"50 to 59": {
						x: 2 * this.width / 5.3,
						y: 2 * this.height / 3.2
					},
					"60+": {
						x: 3 * this.width / 5,
						y: 2 * this.height / 3.2
					}
				}
			},
			borough: {
				centers: {
					"Manhattan": {
						x: this.width / 5,
						y: 11 * this.height / 30
					},
					"Brooklyn": {
						x: this.width / 2.05,
						y: 12 * this.height / 30
					},
					"Bronx": {
						x: 4 * this.width / 5.05,
						y: 12 * this.height / 30
					},
					"Queens": {
						x: this.width / 5,
						y: 24 * this.height / 30
					},
					"Staten Island": {
						x: this.width / 2.05,
						y: 22 * this.height / 30
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Manhattan": {
						x: this.width / 5.1,
						y: this.height / 7
					},
					"Brooklyn": {
						x: this.width / 2,
						y: this.height / 7
					},
					"The Bronx": {
						x: 4 * this.width / 5,
						y: this.height / 7
					},
					"Queens": {
						x: this.width / 5.1,
						y: 2 * this.height / 3.2
					},
					"Staten Island": {
						x: this.width / 2,
						y: 2 * this.height / 3.2
					}
				}
			},
			frisked: {
				centers: {
					"Frisked": {
						x: 1 * this.width / 4,
						y: this.height / 1.9
					},
					"Not frisked": {
						x: 3 * this.width / 4,
						y: this.height / 1.9
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Frisked": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Not frisked": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			sex: {
				centers: {
					"Male": {
						x: this.width / 4.25,
						y: this.height / 1.725
					},
					"Female": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Men": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Women": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			physical_force_used: {
				centers: {
					"Force not used": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.875
					},
					"Force used": {
						x: 3 * this.width / 4.05,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"Force not used": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Force used": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			arrest_made: {
				centers: {
					"No arrest made": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.725
					},
					"Arrest made": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"No arrest made": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Arrest made": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			summons_issued: {
				centers: {
					"No summons issued": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.725
					},
					"Summons issued": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"No summons issued": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Summons issued": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			contraband_found: {
				centers: {
					"No contraband found": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.725
					},
					"Contraband found": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"No contraband found": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Contraband found": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			weapon_found: {
				centers: {
					"No weapon found": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.725
					},
					"Weapon found": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"No weapon found": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Weapon found": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			gun_found: {
				centers: {
					"No gun found": {
						x: 1 * this.width / 4.25,
						y: this.height / 1.725
					},
					"Gun found": {
						x: 3 * this.width / 4.1,
						y: this.height / 2
					},
					"do_not_include": this.extras_center
				},
				titles: {
					"No gun found": {
						x: this.width / 4,
						y: this.height / 4
					},
					"Gun found": {
						x: 3 * this.width / 4,
						y: this.height / 4
					}
				}
			},
			related: {
				centers: {
					"do_not_include": this.extras_center
				}
			}
		};
		this.layout_gravity = 0.01;
		this.damper = 0.1;
		this.vis = null;
		this.nodes = [];
		this.force = null;
		this.circles = null;
		this.create_nodes();
		this.create_vis();
	}

	StopAndFriskInteractive.prototype.create_nodes = function() {
		this.data.forEach(function(d) {
			var node = {
				id: d.ser_num,
				is_extra: d.is_extra,
				radius: this.radius_size,
				color: "rgba(0,0,0,0.25)",
				race: d.race,
				sex: d.sex,
				age: d.age_bucket,
				borough: d.borough,
				frisked: d.was_frisked,
				reason_for_stop: d.reason_for_stop_2,
				reason_for_frisk: d.reason_for_frisk,
				physical_force_used: d.physical_force_used,
				arrest_made: d.arrest_made,
				summons_issued: d.summons_issued,
				weapon_found: d.weapon_found,
				contraband_found: d.contraband_found,
				gun_found: d.gun_found,
				related: "do_not_include",
				x: (Math.random() * 2 * this.width) - (this.width / 2),
				y: Math.random() * 2 * this.height - (this.height / 2)
			};

			node.x = d.is_extra === "0" ? (Math.random() * 2 * this.width) - (this.width / 2) : Math.random() * this.width;
			node.y = d.is_extra === "0" ? Math.random() * 2 * this.height - (this.height / 2) : 1.5 * this.height;

			this.nodes.push(node);
		}.bind(this));
	};

	StopAndFriskInteractive.prototype.create_vis = function() {
		this.vis = d3.select("#vis").append("svg").attr("width", this.width).attr("height", this.height).attr("id", "svg_vis");
		this.circles = this.vis.selectAll("circle").data(this.nodes);
		this.circles
			.enter()
			.append("circle")
			.attr("r", 0)
			.attr("fill", function(d) {
				return d.color;
			})
			.transition()
			.duration(2000)
			.attr("r", function(d) {
				return d.radius;
			});
	};

	StopAndFriskInteractive.prototype.charge = function(d) {
		return -Math.pow(d.radius, 2.0) / 4;
	};

	StopAndFriskInteractive.prototype.start = function() {
		this.force = d3.layout.force().nodes(this.nodes).size([this.width, this.height]);
	};

	StopAndFriskInteractive.prototype.display_group_all = function() {
		var text, title, title_data, title_x, title_y;
		this.force.gravity(this.layout_gravity).charge(this.charge).friction(0.9).on('tick', function(e) {
			return this.circles.each(this.move_towards_center(e.alpha)).attr("cx", function(d) {
				return d.x;
			}).attr('cy', function(d) {
				return d.y;
			});
		}.bind(this));
		this.force.start();
		if (this.iPadPortrait) {
			title_x = {
				'All the Stops': this.width / 2
			};
			title_data = d3.keys(title_x);
			title_y = {
				'All the Stops': this.height / 4 + 20
			};
			title_data = d3.keys(title_y);
		} else {
			title_x = {
				'All the Stops': this.width / 3
			};
			title_data = d3.keys(title_x);
			title_y = {
				'All the Stops': this.height / 2 + 20
			};
			title_data = d3.keys(title_y);
		}
		this.hide_all_titles();
		title = this.vis.selectAll('.title').data(title_data);
		title.enter().append('text').attr('opacity', 0).attr('class', 'article_title').attr('x', function(d) {
			return title_x[d];
		}).attr('y', function(d) {
			return title_y[d];
		}).attr('text-anchor', 'middle').text(function(d) {
			return d;
		}).transition().duration(400).attr('opacity', 1);
		if (this.iPadPortrait) {
			return text = this.vis.append('foreignObject').attr('x', this.width / 4).attr('y', this.height / 2 - 20).attr('width', this.width / 2).attr('height', this.height).classed('foreignHTMLelement', true).append("xhtml:div").html('<span><p><strong>Introduction</strong></p><p>These days, the NYPD’s “stop, question, and frisk” tactic is under fire. The policing measure, which encourages officers to stop and search people who appear suspicious, and which is used in Brooklyn more than any other borough, has in the last month been ruled unconstitutional, curbed by a pair of City Council bills, and inveighed against by the Democratic field of would-be mayors.</p><p>But with only long-shot candidate John Liu calling for a complete end to stop-and-frisk, some form of the tactic is likely to endure. This visualization, which reflects the more than 530,000 stops that occurred in 2012, reveals who is being stopped, why they’re being stopped, and what, if anything, is being found by the police as a result. The data, originally made available by the NYPD, was <a href="http://www.nyclu.org/content/stop-and-frisk-data" target="_blank">recently compiled</a> by the&nbsp;NYCLU.<p><p class="byline">Visualization by Thomas Rhiel</p></span>');
		} else {
			return text = this.vis.append('foreignObject').attr('x', 1.9 * this.width / 3).attr('y', (this.height - 350) / 2).attr('width', this.width / 4).attr('height', this.height).classed('foreignHTMLelement', true).append("xhtml:div").html('<span><p><strong>Introduction</strong></p><p>These days, the NYPD’s “stop, question, and frisk” tactic is under fire. The policing measure, which encourages officers to stop and search people who appear suspicious, and which is used in Brooklyn more than any other borough, has in the last month been ruled unconstitutional, curbed by a pair of City Council bills, and inveighed against by the Democratic field of would-be mayors.</p><p>But with only long-shot candidate John Liu calling for a complete end to stop-and-frisk, some form of the tactic is likely to endure. This visualization, which reflects the more than 530,000 stops that occurred in 2012, reveals who is being stopped, why they’re being stopped, and what, if anything, is being found by the police as a result. The data, originally made available by the NYPD, was <a href="http://www.nyclu.org/content/stop-and-frisk-data" target="_blank">recently compiled</a> by the&nbsp;NYCLU.<p><p class="byline">Visualization by Thomas Rhiel</p></span>');
		}
	};

	StopAndFriskInteractive.prototype.move_towards_center = function(alpha) {
		return function(d) {
			if (d.is_extra === "0") {
				d.x = d.x + (this.center.x - d.x) * (this.damper + 0.02) * alpha;
				return d.y = d.y + (this.center.y - d.y) * (this.damper + 0.02) * alpha;
			} else if (d.is_extra === "1") {
				d.x = d.x + (this.extras_center.x - d.x) * (this.damper + 0.02) * alpha;
				return d.y = d.y + (this.extras_center.y - d.y) * (this.damper + 0.02) * alpha;
			}
		}.bind(this);
	};

	StopAndFriskInteractive.prototype.hide_all_titles = function() {
		this.vis.selectAll('.article_title, .foreignHTMLelement, .filter_label').transition().duration(200).attr("opacity", 0).remove();
	};

	StopAndFriskInteractive.prototype.display_labels = function(name_of_filter) {
		var label_data, labels, text;
		if (name_of_filter === 'related') {
			this.hide_all_titles();
			return text = this.vis.append('foreignObject').attr('x', 0.1 * this.width).attr('y', this.height / 4).attr('width', 0.8 * this.width).attr('height', this.height).classed('foreignHTMLelement', true).classed('relatedVisualizations', true).append("xhtml:div").html('<span><h2>More visualizations</h2><div><h3><a href="http://bklynr.com/block-by-block-brooklyns-past-and-present/">Block by Block, Brooklyn’s Past and&nbsp;Present</a></h3><p>Exploring the history of the borough through the ages of its more than 320,000 buildings. A map by Thomas&nbsp;Rhiel</p></div><div><h3><a href="http://bklynr.com/mean-streets/">Mean Streets</a></h3><p>A data-driven look at Brooklyn’s most dangerous roads for cyclists. An interactive map by Nilkanth&nbsp;Patel</p></div><div class="last"><h3><a href="http://bklynr.com/brooklyn-beat/">Brooklyn Beat</a></h3><p>How coverage of Brooklyn has changed. An interactive map by Nilkanth&nbsp;Patel</p></div></span>');
		} else {
			this.hide_all_titles();
			title_coordinates = this.mappings[name_of_filter].titles;

			label_data = d3.keys(title_coordinates);
			labels = this.vis.selectAll(name_of_filter).data(label_data);
			return labels.enter().append("text").attr("opacity", "0").attr("class", name_of_filter).classed("filter_label", true).attr("x", function(d) {
				return title_coordinates[d].x;
			}).attr("y", function(d) {
				return title_coordinates[d].y;
			}).attr("text-anchor", "middle").text(function(d) {
				return d;
			}).transition().duration(400).attr("opacity", 1);
		}
	};

	StopAndFriskInteractive.prototype.display_by = function(filter_name) {
		this.force.gravity(this.layout_gravity).charge(this.charge).friction(0.9).on("tick", function(e) {
			return this.circles.each(this.move_towards(e.alpha, filter_name)).attr("cx", function(d) {
					return d.x;
				}).attr("cy", function(d) {
					return d.y;
				});
			}.bind(this));
		this.force.start();
		this.display_labels(filter_name);
	};

	StopAndFriskInteractive.prototype.move_towards = function(alpha, filter_name) {
		var target_filter_centers;
		target_filter_centers = this.mappings[filter_name].centers;
		return function(d) {
			var target;
			target = target_filter_centers[d[filter_name]];
			d.x = d.x + (target.x - d.x) * (this.damper + 0.02) * alpha * 1.1;
			return d.y = d.y + (target.y - d.y) * (this.damper + 0.02) * alpha * 1.1;
		}.bind(this);
	};

	return StopAndFriskInteractive;

})();

root = typeof exports !== "undefined" && exports !== null ? exports : this;

$(function() {
	var chart, render_vis;
	chart = null;
	root.render_vis = function(csv) {
		chart = new StopAndFriskInteractive(csv);
		chart.start();
		return root.display_all();
	};
	root.display_all = function() {
		return chart.display_group_all();
	};
	root.display_byfilter = function(filter_type) {
		return chart.display_by(filter_type);
	};
	root.toggle_view = function(view_type) {
		if (view_type === 'all') {
			return root.display_all();
		} else if (view_type !== '') {
			return root.display_byfilter(view_type);
		} else {
			return root.display_all();
		}
	};
	return d3.csv("data/stop_and_frisk.csv", root.render_vis);
});
