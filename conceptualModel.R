
library(DiagrammeR)
rpos <- create_nodes(nodes = c("repo1", "repo2", "repo3", "repo4", "repo5", 
								"repo6", "repo7", "repo8", "repo9", "repo10", 
								"repo11", "repo12", "repo13"),
labels = FALSE, style = "filled", color = "#e41a1c", height = .25, width = .75,
tooltip = c("ASG Class Report", "Admin Reports", "Class by RIT", 
			"Class Reports", "Class by Goal", "Class by Projected Proficiency", 
			"District Summary", "Grade Report", "MPG Reports", 
			"Projected Proficiency Summary", "Student Goal Setting Worksheet", 
			"Student Growth Summary", "Student Progress Report"),
type = "upper", shape = "rectangle", fixedsize = FALSE, data = c(rep.int(10, 13)),
fontcolor = "#377eb8", fontsize = 14)

sessions <- create_nodes(nodes = c("session"), labels = FALSE,  width = 1, 
						 color = "#4daf4a", shape = "ellipse", height = .5,
						 tooltip = c("Within User Latent Classes"), 
						 type = "lower", style = "filled", fixedsize = FALSE,
						 fontcolor = "#984ea3", fontsize = 14)

ugroups <- create_nodes(nodes = "ugroups", labels = FALSE,  width = 1, 
						 color = "#ff7f00", shape = "ellipse", height = .5,
						 tooltip = c("Between Users Latent Classes"), 
						 type = "upper", style = "filled", fixedsize = FALSE,
						 fontcolor = "#ffff33", fontsize = 14)

covariates <- create_nodes(nodes = c("totdays", "eseduc", "hseduc", "mseduc"),
							labels = FALSE, style = "filled", color = "#a65628", 
							height = .35, width = .35, type = "upper", 
							tooltip = c("Total # Days Reports Accessed",
							"Elementary School Educator",
							"High School Educator", "Middle School Educator"),
							shape = "rectangle", data = c(rep.int(20, 4)),
							fixedsize = FALSE, fontcolor = "#f781bf", fontsize = 14)
						 

wthin <- create_edges(from = c(rep.int("session", 13)),
					 to = c("repo1", "repo2", "repo3", "repo4", "repo5", 
							"repo6", "repo7", "repo8", "repo9", "repo10", 
							"repo11", "repo12", "repo13"),
					 relationship = "requires", color = "black", labels = FALSE, tooltip = FALSE,
					 data = c(rep.int(10, 13)), penwidth = 1.25)
					 
btween <- create_edges(from = "ugroups", to = "session", labels = FALSE,  tooltip = FALSE,
						penwidth = 1.5, relationship = "requires", color = "black",
						data = 15)
						
btweenCov <- create_edges(from = c("totdays", "eseduc", "hseduc", "mseduc"), tooltip = FALSE,
						  to = c(rep.int("ugroups", 4)), labels = FALSE, penwidth = 1.5,
						  relationship = "requires", color = "black",
						  data = c(15, 15, 15, 15))

						  
nodes <- combine_nodes(rpos, ugroups, sessions, covariates)
edges <- combine_edges(wthin, btween, btweenCov)						  
render_graph(create_graph(nodes_df = nodes, edges_df = edges))

