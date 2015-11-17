package;

import xt3d.utils.application.BasicApplication;
import xt3d.primitives.Cube;
import xt3d.material.TextureMaterial;
import xt3d.math.Vector4;
import xt3d.extras.CameraController;
import xt3d.core.Director;
import xt3d.node.Light;
import xt3d.node.MeshNode;
import xt3d.core.View;
import xt3d.utils.color.Color;

class SimpleCube extends BasicApplication {

	private override function onApplicationReady():Void {
		// Set the director background color
		this.director.backgroundColor = Color.createWithComponents(0.2, 0.2, 0.2);

		// Create a view
		var view = SimpleCubeView.create();

		// Add the view to the director
		this.director.addView(view);
	}
}


class SimpleCubeView extends View {

	private var _cube:MeshNode;
	private var _angle:Float = 0.0;

	/**
	 * Helper method to create and initialise the View object
	 **/
	public static function create():SimpleCubeView {
		var object = new SimpleCubeView();

		if (object != null && !(object.init())) {
			object = null;
		}

		return object;
	}

	/**
	 * Initialise the View object
	 **/
	public function init():Bool {
		var retval;
		// Initialise the BasicView properties first (creates scene, camera and initialises viewport)
		if ((retval = super.initBasic3D())) {

			// Create a cube geometry
			var cubeGeometry = Cube.create(20.0, 20.0, 20.0, 2, 2, 2);

			// Create a texture material and enable lighting on it
			var textureMaterial = TextureMaterial.createWithImageAsset("assets/box.jpg");
			textureMaterial.lightingEnabled = true;

			// Create a mesh node and add it to the scene
			this._cube = MeshNode.create(cubeGeometry, textureMaterial);
			this.scene.addChild(this._cube);

			// Create a positionnable light, position it and add it to the scene
			var light = Light.createPointLight();
			light.position = new Vector4(-10.0, 40.0, 80.0);
			this.scene.addChild(light);

			// Set the scene ambient color
			this.scene.ambientLight = Color.createWithRGBHex(0x444444);

			// Create a camera controller with a position and add it to the scene
			var cameraController = CameraController.createWithPosition(this.camera, new Vector4(0.0, 35.0, 50.0));
			this.scene.addChild(cameraController);

			// Schedule updates
			this.scheduleUpdate();
		}

		return retval;
	}

	/**
	 * Update the scene: called at every frame with time the frame delta time
	 **/
	override public function update(dt:Float):Void {
		// Set the rotation of the cube
		this._cube.rotationY = this._angle;

		// Update the cube angle
		this._angle += dt * (360.0 / 16.0);
	}
}
