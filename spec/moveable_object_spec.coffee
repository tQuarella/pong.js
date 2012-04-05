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

  it "reflects up-right to up-left", ->
    p = new MoveableObject()
    p.angle = 45
    p.reflect()
    expect(p.angle).toEqual 135

  it "reflects up-left to up-right", ->
    p = new MoveableObject()
    p.angle = 135
    p.reflect()
    expect(p.angle).toEqual 45

  it "reflects down-right to down-left", ->
    p = new MoveableObject()
    p.angle = 315
    p.reflect()
    expect(p.angle).toEqual 225

  it "reflects down-left to down-right", ->
    p = new MoveableObject()
    p.angle = 225
    p.reflect()
    expect(p.angle).toEqual 315
 
  it "deflects up-right to down-right", ->
    p = new MoveableObject()
    p.angle = 45
    p.deflect()
    expect(p.angle).toEqual 315

  it "deflects up-left to down-left", ->
    p = new MoveableObject()
    p.angle = 135
    p.deflect()
    expect(p.angle).toEqual 225

  it "deflects down-left to up-left", ->
    p = new MoveableObject()
    p.angle = 135
    p.deflect()
    expect(p.angle).toEqual 225

  it "deflects down-left to up-left", ->
    p = new MoveableObject()
    p.angle = 315
    p.deflect()
    expect(p.angle).toEqual 45

  it "reflects shallow", ->
    p = new MoveableObject()
    p.angle = 1
    p.reflect()
    expect(p.angle).toEqual 179
