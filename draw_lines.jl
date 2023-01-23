# Line algorithm
# Pkg.add("Images")
using Colors, Images

function draw_line(canvas, h, w, degrees, length, x1, y1, color)
    for dl in 1:length
        x = round(Int,cosd(degrees)*dl) + x1
        y = round(Int,sind(degrees)*dl) + y1

        # make sure point is between canvas bounds before plotting
        if !(x < 1 || x > w || y < 1 || y > h)
            canvas[y:y,x] .= color
        end
    end

    return canvas
end

function colorvalue(n)
    HSV(n*360, 1, n==0 ? 0 : 1)
end

h = 500; w = 500;
canvas = zeros(h,w)

for j in collect(0:1:360)
    degrees = j
    color = degrees/360
    length = 200 #*rand()
    x1 = 250
    y1 = 250
    # color = 1*rand()
    # length = Int(round(100*rand()))
    # x1 = Int(round(500*rand()))
    # y1 = Int(round(500*rand()))
    global image = draw_line(canvas, h, w, degrees, length, x1, y1, color)
end
test = map(x -> colorvalue(x),image)
HSV.(test)
