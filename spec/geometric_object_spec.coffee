describe "Geometric Object: ", ->
  it "initiallizes", ->
    g = new GeometricObject
    expect(g.x).toEqual(15)
    expect(g.y).toEqual(15)
    expect(g.height).toEqual(10)
    expect(g.width).toEqual(10)
 
  it "can be created with explicit values", ->
    g = new GeometricObject(1,2,3,4)
    expect(g.x).toEqual(1)
    expect(g.y).toEqual(2)
    expect(g.height).toEqual(3)
    expect(g.width).toEqual(4)

  it "calculates its edges", ->
    g = new GeometricObject(0,0,10,10)
    expect(g.rightEdge()).toEqual(10)
    expect(g.leftEdge()).toEqual(0)
    expect(g.topEdge()).toEqual(0)
    expect(g.bottomEdge()).toEqual(10)
 
  it "calculates its center position", ->
    g = new GeometricObject(0, 0, 10, 20)
    expect(g.centerX()).toEqual(10)
    expect(g.centerY()).toEqual(5)
