describe 'MoveableObject: ', ->
  it "initiallizes", ->
    p = new MoveableObject
    expect(p).toBeDefined()
    expect(p.x).toEqual(0)
    expect(p.y).toEqual(0)
    expect(p.height).toEqual(2)
    expect(p.width).toEqual(1)
    expect(p.speed).toEqual(1)
    expect(p.bounds.x).toEqual(15)
    expect(p.bounds.y).toEqual(15)
    expect(p.bounds.height).toEqual(10)
    expect(p.bounds.width).toEqual(10)
    expect(p.angle).toEqual(0)

  it "has x and y coords", ->
    p = new MoveableObject(1, 1)
    expect(p.x).toEqual 1
    expect(p.y).toEqual 1

  it "has a size", ->
    p = new MoveableObject(1,1,4,1)
    expect(p.height).toEqual 4
    expect(p.width).toEqual 1

  it "has a speed", ->
    p = new MoveableObject(1,1,4,1,2)
    expect(p.speed).toEqual 2

  it "enforces speed", ->
    p = new MoveableObject(0,0,4,1,2)
    p.move(2)
    expect(p.x).toEqual 4
    expect(p.y).toEqual 0

  it "can be created with bounds", ->
    bounds = new GeometricObject(1,2,3,4)
    p = new MoveableObject(0,0,0,0,0,bounds)
    expect(p.bounds.x).toEqual(1)
    expect(p.bounds.y).toEqual(2)
    expect(p.bounds.height).toEqual(3)
    expect(p.bounds.width).toEqual(4)

  it "moves", ->
    o = new MoveableObject()
    o.angle = 0
    o.move(1)
    expect(o.x).toEqual 1
    expect(o.y).toEqual 0

  it "moves up and right", ->
    o = new MoveableObject()
    o.angle = 60
    o.move(1)
    expect(o.x).toEqual 0.5
    expect(o.y).toEqual 0.87

  it "moves left", ->
    o = new MoveableObject()
    o.angle = 180
    o.move(1)
    expect(o.x).toEqual -1
    expect(o.y).toEqual 0

  it "won't move out of bounds", ->
    bounds = new GeometricObject(0,0,20,20)
    p = new MoveableObject(0,0,4,1,1,bounds)
    p.move(30)
    expect(p.x).toEqual 19
    expect(p.y).toEqual 0

  it "moves to center", ->
    bounds = new GeometricObject(0,0,10,20)
    p = new MoveableObject(0,0,4,4,1,bounds)
    p.moveToCenter()
    expect(p.x).toEqual 8
    expect(p.y).toEqual 3
