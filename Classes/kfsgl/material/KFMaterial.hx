package kfsgl.material;

import kfsgl.errors.KFException;
import kfsgl.renderer.shaders.KFShaderManager;
import kfsgl.renderer.shaders.KFUniform;
import kfsgl.renderer.shaders.KFGLProgram;

class KFMaterial {

	private var _program:KFGLProgram;
	private var _uniforms:Map<String, KFUniform> = new Map<String, KFUniform>();

	public function new() {

	}

	public function setProgram(programName:String) {
		// cleanup
		this.cleanup();

		// get program for shader manager
		_program = KFShaderManager.instance().programWithName(programName);

		// Get uniforms
		_uniforms = _program.cloneUniforms();
	}

	public function cleanup() {
		if (_program != null) {
			_program = null;
		}

		_uniforms = new Map<String, KFUniform>();
	}

	public function uniform(uniformName:String):KFUniform {
		var uniform = _uniforms.get(uniformName);
		if (uniform == null) {
			throw new KFException("NoUniformExistsForUniformName", "No uniform exists with the name \"" + uniformName + "\"");
		}

		return uniform;
	}

}