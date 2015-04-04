package kfsgl.material;

import kfsgl.errors.KFException;
import kfsgl.renderer.shaders.ShaderManager;
import kfsgl.renderer.shaders.Uniform;
import kfsgl.renderer.shaders.ShaderProgram;
import kfsgl.utils.gl.KFGL;

class Material {

	// properties
	public var programName(get, set):String;
	public var program(get, set):ShaderProgram;
	public var blending(get, set):Int;
	public var blendEquation(get, set):Int;
	public var blendSrc(get, set):Int;
	public var blendDst(get, set):Int;
	public var depthTest(get, set):Bool;
	public var depthWrite(get, set):Bool;
	public var polygonOffset(get, set):Bool;
	public var polygonOffsetFactor(get, set):Float;
	public var polygonOffsetUnits(get, set):Float;
	public var side(get, set):Int;



	// members
	private var _programName:String;
	private var _program:ShaderProgram;

	private var _uniforms:Map<String, Uniform> = new Map<String, Uniform>();
	private var _commonUniforms:Map<String, Uniform> = new Map<String, Uniform>();

	private var _opacity:Float = 1;
	private var _transparent:Bool = false;

	private var _blending:Int;
	private var _blendSrc:Int;
	private var _blendDst:Int;
	private var _blendEquation:Int;

	private var _depthTest:Bool;
	private var _depthWrite:Bool;

	private var _polygonOffset:Bool;
	private var _polygonOffsetFactor:Float;
	private var _polygonOffsetUnits:Float;
	private var _side:Int = KFGL.FrontSide;

	public static function create(programName:String):Material {
		var object = new Material();

		if (object != null && !(object.init(programName))) {
			object = null;
		}

		return object;
	}

	public function init(programName:String):Bool {
		this.setProgramName(programName);

		return true;
	}


	public function new() {
	}

	/* ----------- Properties ----------- */

	public inline function get_programName():String {
		return this._programName;
	}

	public inline function set_programName(value:String):String {
		this.setProgramName(value);
		return this._programName;
	}

	public inline function get_program():ShaderProgram {
		return this._program;
	}

	public inline function set_program(value:ShaderProgram):ShaderProgram {
		this.setProgram(value);
		return this._program;
	}

	public inline function get_blending():Int {
		return _blending;
	}

	public inline function set_blending(value:Int) {
		return this._blending = value;
	}

	public inline function get_blendSrc():Int {
		return _blendSrc;
	}

	public inline function set_blendSrc(value:Int) {
		return this._blendSrc = value;
	}

	public inline function get_blendDst():Int {
		return _blendDst;
	}

	public inline function set_blendDst(value:Int) {
		return this._blendDst = value;
	}

	public inline function get_blendEquation():Int {
		return _blendEquation;
	}

	public inline function set_blendEquation(value:Int) {
		return this._blendEquation = value;
	}

	public inline function get_depthTest():Bool {
		return _depthTest;
	}

	public inline function set_depthTest(value:Bool) {
		return this._depthTest = value;
	}

	public inline function get_depthWrite():Bool {
		return _depthWrite;
	}

	public inline function set_depthWrite(value:Bool) {
		return this._depthWrite = value;
	}

	public inline function get_polygonOffset():Bool {
		return _polygonOffset;
	}

	public inline function set_polygonOffset(value:Bool) {
		return this._polygonOffset = value;
	}

	public inline function get_polygonOffsetFactor():Float {
		return _polygonOffsetFactor;
	}

	public inline function set_polygonOffsetFactor(value:Float) {
		return this._polygonOffsetFactor = value;
	}

	public inline function get_polygonOffsetUnits():Float {
		return _polygonOffsetUnits;
	}

	public inline function set_polygonOffsetUnits(value:Float) {
		return this._polygonOffsetUnits = value;
	}

	public inline function get_side():Int {
		return _side;
	}

	public inline function set_side(value:Int) {
		return this._side = value;
	}


/* --------- Implementation --------- */


	public inline function getProgramName():String {
		return this._programName;
	}

	public inline function setProgramName(programName:String):Void {
		if (programName != this._programName) {
			// get program for shader manager
			this._program = ShaderManager.instance().programWithName(programName);
			this._programName = programName;
		}
	}

	public inline function getProgram():ShaderProgram {
		return this._program;
	}

	public function setProgram(program:ShaderProgram):Void {
		if (this._program != program) {
			// cleanup
			this.cleanup();

			this._program = program;
			this._programName = program.name;

			// Get common uniforms
			this._commonUniforms = this.program.cloneCommonUniforms();

			// Get uniforms
			this._uniforms = this.program.cloneUniforms();
		}
	}



	public function cleanup() {
		this._program = null;
		this._programName = null;

		_uniforms = new Map<String, Uniform>();
		_commonUniforms = new Map<String, Uniform>();
	}

	public function uniform(uniformName:String):Uniform {
		// Get uniform from uniforms
		var uniform = _uniforms.get(uniformName);

		if (uniform == null) {
			// Get from common uniforms
			uniform = _commonUniforms.get(uniformName);

			if (uniform == null) {
				throw new KFException("NoUniformExistsForUniformName", "No uniform exists with the name \"" + uniformName + "\"");
			}
		}

		return uniform;
	}

}