#nlf - teams - city - coaches(head, oc, dc) - star players

NFL = {
	Buffalo_Bills: {
		City: "Buffalo",
		Coaches: {
			head_coach: "buffalo_coach_1",
			oc: "buffalo_coach_2",
			dc: "buffalo_coach_3"
		},
		Star_Players: ["tyrod taylor", "lesean mccoy", "sammy watkins"]
	},
	New_York_Jets: {
		Ciry: "New York",
		Coaches: {
			head_coach: "new_york_coach_1",
			oc: "new_york_coach_2",
			dc: "new_york_coach_3"
		},
		Star_Players: ["brandon marshall", "sheldon richardson", "eric decker"]
	},
	Denver_Broncos: {
		City: "Denver",
		Coaches: {
			head_coach: "denver_coach_1",
			oc: "denver_coach_2",
			dc: "denver_coach_3"
		},
		Star_Players: ["von miller", "demaryius thomas", "cj anderson"]
	}
}

puts NFL[:Buffalo_Bills][:Star_Players][2]
puts NFL[:Denver_Broncos][:City]
puts NFL[:New_York_Jets][:Coaches][:oc]













}