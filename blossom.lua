blooms = {}

--0 to 100
bloomlength = 5
bloom_color_difference = 30
bloom_from_center_dis = 30
blossom_sides = 10
bloom_duration = 10

function blossom(xx,yy, leaves, sides, scale)
	for i = 0, leaves do
		local pointss = {}
		pointss[1] = {fixed = true, x = xx.mid-7, y = xx.y+floRan(bloom_from_center_dis-(scale*bloom_from_center_dis),bloom_from_center_dis)}
		pointss[2] = {fixed = true, x = xx.mid+7, y = xx.feet
		-- -xx.im.extra_height
		-floRan(bloom_from_center_dis-(scale*bloom_from_center_dis),bloom_from_center_dis)}
		for k=3, sides do
			if xx.g and xx.j < 0 then
				pointss[k] = {
					x = pointss[1].x,
					y = (pointss[1].y + pointss[2].y)/2,
					v = (xx.v/3)+(xx.v/math.abs(xx.v+floRan(-1,1)))*floRan(0,10)*
					((math.abs((k-2)-((sides-2)/2)))
						/((sides-2)/2))+floRan(-5,5), 
					j = floRan(-5,5)
				}

			else
				pointss[k] = {
					x = pointss[1].x,
					y = (pointss[1].y + pointss[2].y)/2,
					v = (xx.v/3)+(xx.v/math.abs(xx.v+floRan(-1,1)))*floRan(0,10)*
					((math.abs((k-2)-((sides-2)/2)))
						/((sides-2)/2))+floRan(-5,5), 
					j = (xx.j)*2+floRan(0,7)*(((k-2)-((sides-2)/2))
						/((sides-2)/2))+floRan(-3,3)
				}
			end
		end
		pointss[100] = {
			fixed = true,
			x = pointss[1].x-xx.v,
			y = (xx.y + xx.feet)/2-xx.j,
			v = -xx.v/2, 
			j = -xx.j/2
		}
		local colordif = floRan((100-bloom_color_difference),100)/(100)
		table.insert(blooms,
		{
			points = clone(pointss),
			colors = {r = hof(0, lof(255, yy.color.c.r*colordif)),
			g = hof(0, lof(255, yy.color.c.g*colordif)),
			b = hof(0, lof(255, yy.color.c.b*colordif))
			},
			t = 1

		}
		)
	end
end

function pPolygon(points, color, a)
	local vals = {}
	for i,v in ipairs(points) do
		table.insert(vals, v.x)
		table.insert(vals, v.y)
	end
	lg.setColor(color.r, color.g, color.b, a)
	lg.polygon("fill", vals)
end


function blooms:update(self)
	for i,v in ipairs(blooms) do
		local tick = false
		for j,p in ipairs(v.points) do
			if p.fixed == nil then
				p.x = p.x + p.v*(bloomlength/(v.t^2))
				p.y = p.y - p.j*(bloomlength/(v.t^2))
				tick = true
			end
		end
		if tick then
			v.t = v.t + 1
		end
	end
	for i,v in ipairs(blooms) do
		for j = #v.points, 3, -1 do
			p = v.points[j]
			if v.t >= bloom_duration then
				table.remove(blooms, i)
			end
		end
	end
end


function blooms:draw(self)
	for i,v in ipairs(blooms) do
		pPolygon(v.points, v.colors, 200-200*(v.t/bloom_duration))
	end

end