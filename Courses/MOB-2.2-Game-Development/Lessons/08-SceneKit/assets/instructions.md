## Bouncing Shapes - An exercise using a blank SceneKit project.

Let's start by adding an asset catalog (New->File->Asset Catalog) and call it Resources. The SceneKit asset catalog lets you manage game assets separately from the code. This is useful when game artists need to easily add or modify assets from the game.

To keep things organized make a subfolder and call it `Textures`. Then add your first asset. This background:

![background](background.jpg)

Add the background to the scene.

```swift
 scene.background.contents = "Assets.scnassets/Textures/background.jpg"
```

Build and run, you should see the background now.

Now we need a camera. The position of the node that contains the camera will determine the point of view from which we view the scene.

```swift
var camera: SCNNode!
...
func setupCamera() {
  camera = SCNNode()
  camera.camera = SCNCamera()
  camera.position = SCNVector3(x: 0, y: 0, z: 10)
  scene.rootNode.addChildNode(camera)
}
```

Call the `setupCamera` method in viewDidLoad.

To have elements appear on screen we need to add a geometry object to a node. A geometry object is a 3D shape created out of many vertices.

A geometry object can contain material objects that modify the appearance of a geometry’s surface. With materials we can specify a color, texture, how the geometry responds to light, etc.

SceneKit has some built in geometric shapes that we will use for this activity.

Create a new Swift file and call it Shape. Then add the following enum and see what it does.

```swift
enum ShapeType:Int {
    case box = 0
    case sphere
    case pyramid
    case torus
    case capsule
    case cylinder
    case cone
    case tube

    static func random() -> ShapeType {
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }
}
```

Now we need to add a new node using the Shape enum you just created.

```swift
func spawnShape() {
  var geometry:SCNGeometry
  switch ShapeType.random() {
  default:
    geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
  }
  let geometryNode = SCNNode(geometry: geometry)
  scene.rootNode.addChildNode(geometryNode)
}
```

Call the method and see what you get now. You should see the box in the center of the screen. But it doesn't even look 3D. We can make use of the built in features of the `SCNView`.

```swift
scnView.showsStatistics = true
scnView.allowsCameraControl = true
scnView.autoenablesDefaultLighting = true
```

`showStatistics` enables a real-time statistics panel at the bottom of the scene<br>
`allowsCameraControl` lets you manually control the camera with gestures<br>
`autoenablesDefaultLighting` creates a light in the scene so you we don't have to worry about adding light sources

Build and run now. Try the following:
- Single finger swipe
- Two finger swipe
- Two finger pinch
- Double-tap
