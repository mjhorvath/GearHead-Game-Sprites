var t_blank = ['blank']
var f_heavy = ['Terrain_Forest_Heavy','Terrain_Forest_Heavy_Mask']
var f_light = ['Terrain_Forest_Light','Terrain_Forest_Light_Mask']
var t_ferns_heavy = ['Terrain_Ferns_Heavy','Terrain_Ferns_Heavy_Mask']
var t_ferns_light = ['Terrain_Ferns_Light','Terrain_Ferns_Light_Mask']
var hill_a01 = ['Terrain_Hills_A01'], hill_a02 = ['Terrain_Hills_A02'], hill_a03 = ['Terrain_Hills_A03'], hill_a04 = ['Terrain_Hills_A04']
var hill_a05 = ['Terrain_Hills_A05'], hill_a06 = ['Terrain_Hills_A06'], hill_a07 = ['Terrain_Hills_A07'], hill_a08 = ['Terrain_Hills_A08']
var hill_a09 = ['Terrain_Hills_A09'], hill_a10 = ['Terrain_Hills_A10'], hill_a11 = ['Terrain_Hills_A11'], hill_a12 = ['Terrain_Hills_A12']
var hill_a13 = ['Terrain_Hills_A13'], hill_a14 = ['Terrain_Hills_A14'], hill_a15 = ['Terrain_Hills_A15'], hill_a16 = ['Terrain_Hills_A16']
var hill_b01 = ['Terrain_Hills_B01'], hill_b02 = ['Terrain_Hills_B02'], hill_b03 = ['Terrain_Hills_B03'], hill_b04 = ['Terrain_Hills_B04']
var hill_b05 = ['Terrain_Hills_B05'], hill_b06 = ['Terrain_Hills_B06'], hill_b07 = ['Terrain_Hills_B07'], hill_b08 = ['Terrain_Hills_B08']
var hill_b09 = ['Terrain_Hills_B09'], hill_b10 = ['Terrain_Hills_B10'], hill_b11 = ['Terrain_Hills_B11'], hill_b12 = ['Terrain_Hills_B12']
var hill_b13 = ['Terrain_Hills_B13'], hill_b14 = ['Terrain_Hills_B14'], hill_b15 = ['Terrain_Hills_B15'], hill_b16 = ['Terrain_Hills_B16']
var hill_c01 = ['Terrain_Hills_C01'], hill_c02 = ['Terrain_Hills_C02'], hill_c03 = ['Terrain_Hills_C03'], hill_c04 = ['Terrain_Hills_C04']
var hill_c05 = ['Terrain_Hills_C05'], hill_c06 = ['Terrain_Hills_C06'], hill_c07 = ['Terrain_Hills_C07'], hill_c08 = ['Terrain_Hills_C08']
var hill_c09 = ['Terrain_Hills_C09'], hill_c10 = ['Terrain_Hills_C10'], hill_c11 = ['Terrain_Hills_C11'], hill_c12 = ['Terrain_Hills_C12']
var hill_c13 = ['Terrain_Hills_C13'], hill_c14 = ['Terrain_Hills_C14'], hill_c15 = ['Terrain_Hills_C15'], hill_c16 = ['Terrain_Hills_C16']
var desert = ['Terrain_Desert']
var grass = ['Terrain_Grass']
var wastes = ['Terrain_Wastes']
var marsh = ['Terrain_Marsh']
var water_1 = ['Terrain_Water_Lvl1','Terrain_Water_Mask']
var water_2 = ['Terrain_Water_Lvl2','Terrain_Water_Mask']
var water_3 = ['Terrain_Water_Lvl3','Terrain_Water_Mask']

function init()
{
	write_terrain()
	write_objects()
	setInterval("cycle_animations()", 1000)
}

function cycle_animations()
{
	for (var i = 0, n = objects.length; i < n; i++)
	{
		var newobj = objects[i]
		var newnam = newobj[0]
		var newfrm = newobj[1]
		var newrow = newobj[2]
		var newcol = newobj[3]
		if (newfrm > 1)
		{
			var id = 'y' + newrow + 'x' + newcol + 'n' + newnam
			var thisimg = document.getElementById(id)
			var thisframe = parseInt(thisimg.getAttribute('frame')) + 1
			if (thisframe > newfrm)
				thisframe = 1
			var src = get_src(newnam, newfrm, thisframe)
			thisimg.setAttribute('frame', thisframe)
			thisimg.setAttribute('src', path + src + extn)
		}
	}
}

function write_terrain()
{
	for (var i = 0; i < sizeY; i++)
	{
		var this_Terrain_Row = terrain[i]
		var top = pad_top + i * 16 - 96
		for (var k = 0; k < sizeX; k++)
		{
			var this_Terrain_Col = this_Terrain_Row[k]
			var lft = pad_lft + k * 64
			if (i % 2 == 1)
				lft = lft + 32
			for (var j = 0, o = this_Terrain_Col.length; j < o; j++)
			{
				var src = this_Terrain_Col[j]
				var id = 'y' + i + 'x' + k + 'n' + src
				var newimg = document.createElement('img')
				newimg.style.position = 'absolute'
				newimg.style.left = lft + 'px'
				newimg.style.top = top + 'px'
				newimg.style.width = 64 + 'px'
				newimg.style.height = 128 + 'px'
				// careful: very tall terrain may cause zindex issues with objects
				if (j == 0)
					newimg.style.zIndex = (i + 0/3) * 3
				else if (j == 1)
					newimg.style.zIndex = (i + 2/3) * 3
				newimg.setAttribute('id', id)
				newimg.setAttribute('src', path + src + extn)
				document.getElementById('mockup').appendChild(newimg)
			}
		}
	}
}

function write_objects()
{
	for (var m = 0, r = objects.length; m < r; m++)
	{
		var newobj = objects[m]
		var newnam = newobj[0]
		var newfrm = newobj[1]
		var newrow = newobj[2]
		var newcol = newobj[3]
		var top = pad_top + newrow * 16 - 96
		var lft = pad_lft + newcol * 64
		if (newrow % 2 == 1)
			lft = lft + 32
		var id = 'y' + newrow + 'x' + newcol + 'n' + newnam
		var src = get_src(newnam, newfrm, 1)
		var newimg = document.createElement('img')
		newimg.style.position = 'absolute'
		newimg.style.left = lft + 'px'
		newimg.style.top = top + 'px'
		newimg.style.width = 64 + 'px'
		newimg.style.height = 128 + 'px'
		// careful: very tall terrain may cause zindex issues with objects
		newimg.style.zIndex = (newrow + 1/3) * 3
		newimg.setAttribute('id', id)
		newimg.setAttribute('frame', 1)
		newimg.setAttribute('src', path + src + extn)
		document.getElementById('mockup').appendChild(newimg)
	}
}

function get_src(name, frames, num)
{
	var src = ''
	num = num.toString()
	if (frames == 1)
		src = name
	else
	{
		var lognum = Math.floor(Math.log10(frames)) + 1
		while (num.length < lognum)
			num = '0' + num
		src = name + num
	}
	return src
}

Math.log10 = function(number)
{
	return Math.log(number)/Math.LN10
}
