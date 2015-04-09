package kfsgl.utils.gl;

import openfl.utils.ArrayBufferView;
import openfl.gl.GL;
import openfl.gl.GLBuffer;
class GLBufferManager {

	// members
	private static var _instance:GLBufferManager;

	// State
	private var _currentVertexBuffer:GLBuffer;
	private var _currentElementBuffer:GLBuffer;

	private function new() {
	}


	/* --------- Implementation --------- */

	public static inline function instance():GLBufferManager {
		if (_instance == null) {
			// TODO Handle different managers in different contexts.
			_instance = new GLBufferManager();
		}
		return _instance;
	}


	public inline function createVertexBuffer(data:ArrayBufferView):GLBuffer {
		var buffer = GL.createBuffer();

		// Set buffer
		this.setVertexBuffer(buffer);

		// Write data
		GL.bufferData(GL.ARRAY_BUFFER, data, GL.STATIC_DRAW);

		return buffer;
	}

	public inline function createElementBuffer(data:ArrayBufferView):GLBuffer {
		var buffer = GL.createBuffer();

		// Set buffer
		this.setElementBuffer(buffer);

		// Write data
		GL.bufferData(GL.ELEMENT_ARRAY_BUFFER, data, GL.STATIC_DRAW);

		return buffer;
	}

	public inline function updateVertexBuffer(buffer:GLBuffer, data:ArrayBufferView):Void {
		// Set buffer
		this.setVertexBuffer(buffer);

		// Write data
		GL.bufferSubData(GL.ARRAY_BUFFER, 0, data);
	}

	public inline function updateElementBuffer(buffer:GLBuffer, data:ArrayBufferView):Void {
		// Set buffer
		this.setElementBuffer(buffer);

		// Write data
		GL.bufferSubData(GL.ELEMENT_ARRAY_BUFFER, 0, data);
	}


	public inline function setVertexBuffer(vertexBuffer:GLBuffer):Void {
		if (this._currentVertexBuffer != vertexBuffer) {
			this._currentVertexBuffer = vertexBuffer;

			GL.bindBuffer(GL.ARRAY_BUFFER, this._currentVertexBuffer);
		}
	}

	public inline function setElementBuffer(elementBuffer:GLBuffer):Void {
		if (this._currentElementBuffer != elementBuffer) {
			this._currentElementBuffer = elementBuffer;

			GL.bindBuffer(GL.ELEMENT_ARRAY_BUFFER, this._currentElementBuffer);
		}
	}

	public inline function deleteBuffer(buffer:GLBuffer):Void {
		if (buffer != null) {
			GL.deleteBuffer(buffer);
		}
	}



}
