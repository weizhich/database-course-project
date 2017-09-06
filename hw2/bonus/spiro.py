"""
This is the python code to generate only points, with 
only <Placemark>, <styleUrl>, <Point>, <coordinates> tags.
For the generated kml file, we need also add head:
-------------------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
-------------------------------------------------
and style to decorate the points
-------------------------------------------------
and we also need to add tail, to be a whole completed kml file:
-------------------------------------------------
</Document></kml>
-------------------------------------------------
"""
import math
R, r, a = 5.0, 1.0, 4.0
t = 0.0
x0, y0 = -118.2892056, 34.02111944
writefile = 'spiro.kml'
f = open(writefile, 'w')
while (t < 10 * math.pi):
	f.write('<Placemark>\n')
	f.write('<styleUrl>#default</styleUrl>\n')
	f.write('<Point>\n')
	x = (R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t)
	y = (R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t)
	pointx = x0 + 0.0001 * x
	pointy = y0 + 0.0001 * y
	f.write('<coordinates>' + str(pointx) + ',' + str(pointy) + ',0' + '</coordinates>\n')
	f.write('</Point>\n')
	f.write('</Placemark>\n')
	t += 0.01
f.close()