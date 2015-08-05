package xt3d.gl.view;

import lime.ui.KeyModifier;
import lime.ui.KeyModifier;
import lime.ui.KeyCode;
import lime.ui.GamepadButton;
import lime.ui.GamepadAxis;
import lime.ui.Gamepad;
import lime.graphics.RenderContext;
import lime.app.IModule;

class LimeGLView implements IModule implements Xt3dView {

	// properties

	// members

	public static function create():LimeGLView {
		var object = new LimeGLView();

		if (object != null && !(object.initView())) {
			object = null;
		}

		return object;
	}

	public function initView():Bool {

		return true;
	}


	public function new() {

	}


	/* ----------- Properties ----------- */

	/* --------- Implementation --------- */

	public function setDirector(director:Director):Void {

	}


	/**
	 * The init() method is called once before the first render()
	 * call. This can be used to do initial set-up for the current
	 * render context
	 * @param	context The current render context
	 */
	public function init (context:RenderContext):Void { }


	public function onGamepadAxisMove (gamepad:Gamepad, axis:GamepadAxis, value:Float):Void { }
	public function onGamepadButtonDown (gamepad:Gamepad, button:GamepadButton):Void { }
	public function onGamepadButtonUp (gamepad:Gamepad, button:GamepadButton):Void { }
	public function onGamepadConnect (gamepad:Gamepad):Void { }
	public function onGamepadDisconnect (gamepad:Gamepad):Void { }


	/**
	 * Called when a key down event is fired
	 * @param	keyCode	The code of the key that was pressed
	 * @param	modifier	The modifier of the key that was pressed
	 */
	public function onKeyDown (keyCode:KeyCode, modifier:KeyModifier):Void { }


	/**
	 * Called when a key up event is fired
	 * @param	keyCode	The code of the key that was released
	 * @param	modifier	The modifier of the key that was released
	 */
	public function onKeyUp (keyCode:KeyCode, modifier:KeyModifier):Void { }


	/**
	 * Called when a mouse down event is fired
	 * @param	x	The current x coordinate of the mouse
	 * @param	y	The current y coordinate of the mouse
	 * @param	button	The ID of the mouse button that was pressed
	 */
	public function onMouseDown (x:Float, y:Float, button:Int):Void { }


	/**
	 * Called when a mouse move event is fired
	 * @param	x	The current x coordinate of the mouse
	 * @param	y	The current y coordinate of the mouse
	 * @param	button	The ID of the mouse button that was pressed
	 */
	public function onMouseMove (x:Float, y:Float):Void { }


	/**
	 * Called when a mouse move relative event is fired
	 * @param	x	The x movement of the mouse
	 * @param	y	The y movement of the mouse
	 * @param	button	The ID of the mouse button that was pressed
	 */
	public function onMouseMoveRelative (x:Float, y:Float):Void { }


	/**
	 * Called when a mouse up event is fired
	 * @param	x	The current x coordinate of the mouse
	 * @param	y	The current y coordinate of the mouse
	 * @param	button	The ID of the button that was released
	 */
	public function onMouseUp (x:Float, y:Float, button:Int):Void { }


	/**
	 * Called when a mouse wheel event is fired
	 * @param	deltaX	The amount of horizontal scrolling (if applicable)
	 * @param	deltaY	The amount of vertical scrolling (if applicable)
	 */
	public function onMouseWheel (deltaX:Float, deltaY:Float):Void { }


	/**
	 * Called when a render context is lost
	 */
	public function onRenderContextLost ():Void { }


	/**
	 * Called when a render context is restored
	 * @param	context	The current render context
	 */
	public function onRenderContextRestored (context:RenderContext):Void { }


	/**
	 * Called when a touch end event is fired
	 * @param	x	The current x coordinate of the touch point
	 * @param	y	The current y coordinate of the touch point
	 * @param	id	The ID of the touch point
	 */
	public function onTouchEnd (x:Float, y:Float, id:Int):Void { }


	/**
	 * Called when a touch move event is fired
	 * @param	x	The current x coordinate of the touch point
	 * @param	y	The current y coordinate of the touch point
	 * @param	id	The ID of the touch point
	 */
	public function onTouchMove (x:Float, y:Float, id:Int):Void { }


	/**
	 * Called when a touch start event is fired
	 * @param	x	The current x coordinate of the touch point
	 * @param	y	The current y coordinate of the touch point
	 * @param	id	The ID of the touch point
	 */
	public function onTouchStart (x:Float, y:Float, id:Int):Void { }


	/**
	 * Called when a window activate event is fired
	 */
	public function onWindowActivate ():Void { }


	/**
	 * Called when a window close event is fired
	 */
	public function onWindowClose ():Void { }


	/**
	 * Called when a window deactivate event is fired
	 */
	public function onWindowDeactivate ():Void { }


	/**
	 * Called when a window focus in event is fired
	 */
	public function onWindowFocusIn ():Void { }


	/**
	 * Called when a window focus out event is fired
	 */
	public function onWindowFocusOut ():Void { }


	public function onWindowFullscreen ():Void { }
	public function onWindowMinimize ():Void { }


	/**
	 * Called when a window move event is fired
	 * @param	x	The x position of the window
	 * @param	y	The y position of the window
	 */
	public function onWindowMove (x:Float, y:Float):Void { }


	/**
	 * Called when a window resize event is fired
	 * @param	width	The width of the window
	 * @param	height	The height of the window
	 */
	public function onWindowResize (width:Int, height:Int):Void { }


	public function onWindowRestore ():Void { }


	/**
	 * Called when a render event is fired
	 * @param	context	The current render context
	 */
	public function render (context:RenderContext):Void { }


	/**
	 * Called when an update event is fired
	 * @param	deltaTime	The amount of time in milliseconds that has elapsed since the last update
	 */
	public function update (deltaTime:Int):Void { }

}