local S = minetest.get_translator("testnodes")

-- Nodebox examples and tests.

-- An simple example nodebox with one centered box
minetest.register_node("testnodes:nodebox_fixed", {
	description = S("Fixed Nodebox Test Node"),
	tiles = {"testnodes_nodebox.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
	},

	groups = {dig_immediate=3},
})

-- 50% higher than a regular node
minetest.register_node("testnodes:nodebox_overhigh", {
	description = S("+50% high Nodebox Test Node"),
	tiles = {"testnodes_nodebox.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 1, 0.5},
	},

	groups = {dig_immediate=3},
})

-- 95% higher than a regular node
minetest.register_node("testnodes:nodebox_overhigh2", {
	description = S("+95% high Nodebox Test Node"),
	tiles = {"testnodes_nodebox.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		-- Y max: more is possible, but glitchy
		fixed = {-0.5, -0.5, -0.5, 0.5, 1.45, 0.5},
	},

	groups = {dig_immediate=3},
})

-- Height of nodebox changes with its param2 value
minetest.register_node("testnodes:nodebox_leveled", {
	description = S("Leveled Nodebox Test Node"),
	tiles = {"testnodes_nodebox.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "leveled",
	node_box = {
		type = "leveled",
		fixed = {-0.5, 0.0, -0.5, 0.5, -0.499, 0.5},
	},

	groups = {dig_immediate=3},
})

-- Wall-like nodebox that connects to neighbors
minetest.register_node("testnodes:nodebox_connected", {
	description = S("Connected Nodebox Test Node"),
	tiles = {"testnodes_nodebox.png"},
	groups = {connected_nodebox=1, dig_immediate=3},
	drawtype = "nodebox",
	paramtype = "light",
	connects_to = {"group:connected_nodebox"},
	connect_sides = {"front", "back", "left", "right"},
	node_box = {
		type = "connected",
		fixed = {-0.125, -0.500, -0.125, 0.125, 0.500, 0.125},
		connect_front = {-0.125, -0.500, -0.500, 0.125, 0.400, -0.125},
		connect_back = {-0.125, -0.500, 0.125, 0.125, 0.400, 0.500},
		connect_left = {-0.500, -0.500, -0.125, -0.125, 0.400, 0.125},
		connect_right = {0.125, -0.500, -0.125, 0.500, 0.400, 0.125},
	},
})

-- Sign
minetest.register_node("testnodes:sign3d", {
	description = S("Nodebox Sign, Nodebox Type \"fixed\""),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	tiles = {
		"testnodes_sign3d.png",
	},
	groups = { dig_immediate = 3 },
	node_box = {
		type = "fixed",
		fixed = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
	},
})

minetest.register_node("testnodes:sign3d_wallmounted", {
	description = S("Nodebox Sign, Nodebox Type \"wallmounted\""),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	tiles = {
		"testnodes_sign3d.png^[colorize:#ff0000:127",
	},
	groups = { dig_immediate = 3 },
	node_box = {
		type = "wallmounted",
		wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
		wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
		wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
	},
})

minetest.register_node("testnodes:button", {
	description = S("Button Nodebox Test Node"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	tiles = {
		"testnodes_nodebox.png",
	},
	groups = { dig_immediate = 3 },
	node_box = {
		type = "fixed",
		fixed = { -4/16, -8/16, -2/16, 4/16, -6/16, 2/16 },
	},
})

