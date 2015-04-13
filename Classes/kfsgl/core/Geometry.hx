package kfsgl.core;

import kfsgl.utils.gl.GLBufferManager;
import kfsgl.utils.gl.VertexData;
import kfsgl.utils.gl.FloatVertexData;
import kfsgl.utils.gl.InterleavedVertexData;
import kfsgl.utils.gl.IndexData;
import kfsgl.errors.KFException;


class Geometry {

	// Default buffer names - !! NOTE !! identical to attribute names
	public static var bufferNames = {
		position: "position",
		normal: "normal",
		uv: "uv",
		color: "color"
	};

	// Number of elements per vertex
	public static var bufferVertexSizes = {
		position: 3,
		normal: 3,
		uv: 2,
		color: 4
	};

	private static var defaultInterleavedStructure:Map<String, VertexInfo> = [
		bufferNames.position => { name: bufferNames.position, vertexSize: bufferVertexSizes.position, offset: -1}, // not used by default
		bufferNames.normal => { name: bufferNames.normal, vertexSize: bufferVertexSizes.normal, offset: -1}, // not used by default
		bufferNames.uv => { name: bufferNames.uv, vertexSize: bufferVertexSizes.uv, offset: -1}, // not used by default
		bufferNames.color => { name: bufferNames.color, vertexSize: bufferVertexSizes.color, offset: -1} // not used by default
	];


	// properties
	public var indices(get, set):IndexData;
	public var positions(get, set):FloatVertexData;
	public var normals(get, set):FloatVertexData;
	public var uvs(get, set):FloatVertexData;
	public var colors(get, set):FloatVertexData;
	public var allVertexData(get, set):Map<String, FloatVertexData>;
	public var interleavedVertexData(get, set):InterleavedVertexData;
	public var isIndexed(get, null):Bool;
	public var vertexCount(get, set):Int;
	public var indexCount(get, set):Int;

	// members
	private var _vertexData:Map<String, FloatVertexData> = new Map<String, FloatVertexData>(); // attribute name, raw data
	private var _interleavedVertexData:InterleavedVertexData = null;
	private var _indexData:IndexData;
	private var _vertexCount:Int = -1;
	private var _inferredVertexCount:Int = 0;
	private var _indexCount:Int = -1;
	private var _inferredIndexCount:Int = 0;

	public static function create():Geometry {
		var object = new Geometry();

		if (object != null && !(object.init())) {
			object = null;
		}

		return object;
	}

	public function init():Bool {

		return true;
	}

	public function new() {
	}


	/**
	 * Dispose of any opengl objects
	 */
	public function dispose():Void {
		// Dispose of vertex buffers
		for (vertexData in this._vertexData) {
			vertexData.dispose();
		}

		// Dispose of index buffer
		if (this._indexData != null) {
			this._indexData.dispose();
		}

	}

	/* ----------- Properties ----------- */


	public inline function get_indices():IndexData {
		return this.getIndexData();
	}


	public inline function set_indices(value:IndexData):IndexData {
		this.setIndexData(value);
		return value;
	}

	public inline function get_positions():FloatVertexData {
		return this.getPositionData();
	}

	public inline function set_positions(value:FloatVertexData):FloatVertexData {
		this.setPositionData(value);
		return value;
	}

	public inline function get_normals():FloatVertexData {
		return this.getNormalData();
	}


	public inline function set_normals(value:FloatVertexData):FloatVertexData {
		this.setNormalData(value);
		return value;
	}

	public inline function get_uvs():FloatVertexData {
		return this.getUVData();
	}


	public inline function set_uvs(value:FloatVertexData):FloatVertexData {
		this.setUVData(value);
		return value;
	}

	public inline function get_colors():FloatVertexData {
		return this.getColorData();
	}


	public inline function set_colors(value:FloatVertexData):FloatVertexData {
		this.setColorData(value);
		return value;
	}

	public inline function get_allVertexData():Map<String, FloatVertexData> {
		return this._vertexData;
	}

	public inline function set_allVertexData(vertexData:Map<String, FloatVertexData>):Map<String, FloatVertexData> {
		this.setAllVertexData(vertexData);
		return this._vertexData;
	}

	public inline function get_interleavedVertexData():InterleavedVertexData {
		return this._interleavedVertexData;
	}

	public inline function set_interleavedVertexData(interleavedVertexData:InterleavedVertexData):InterleavedVertexData {
		this.setInterleavedVertexData(interleavedVertexData);
		return this._interleavedVertexData;
	}

	public inline function get_isIndexed():Bool {
		return (this._indexData != null);
	}

	public inline function get_vertexCount():Int {
		return getVertexCount();
	}

	public inline function set_vertexCount(value:Int) {
		return this._vertexCount = value;
	}

	public inline function get_indexCount():Int {
		return getIndexCount();
	}

	public inline function set_indexCount(value:Int) {
		return this._indexCount = value;
	}


	/* --------- Implementation --------- */


	public inline function cloneDefaultInterleavedStructure():Map<String, VertexInfo> {
		var clone = new Map<String, VertexInfo>();
		for (vertexInfo in defaultInterleavedStructure) {
			clone.set(vertexInfo.name, vertexInfo);
		}

		return clone;
	}

	public inline function getIndexData():IndexData {
		return this._indexData;
	}

	public inline function setIndexData(data:IndexData):Void {
		this._indexData = data;
	}

	public inline function getVertexData(bufferName:String):FloatVertexData {
		if (!_vertexData.exists(bufferName)) {
			throw new KFException("VertexBufferDoesNotExist", "The vertex buffer \"" + bufferName + "\" does not exist");
		}
		return _vertexData[bufferName];
	}

	public inline function setVertexData(bufferName:String, data:FloatVertexData):Void {
		this._vertexData[bufferName] = data;
	}

	public inline function setAllVertexData(vertexData:Map<String, FloatVertexData>):Void {
		this._vertexData = vertexData;
	}

	public inline function getAllVertexData():Map<String, FloatVertexData> {
		return this._vertexData;
	}

	public inline function getInterleavedVertexData():InterleavedVertexData {
		return this._interleavedVertexData;
	}

	public inline function setInterleavedVertexData(data:InterleavedVertexData):Void {
		this._interleavedVertexData = data;
	}

	public inline function getPositionData():FloatVertexData {
		return _vertexData[bufferNames.position];
	}

	public inline function setPositionData(data:FloatVertexData):Void {
		this._vertexData[bufferNames.position] = data;
	}

	public inline function getNormalData():FloatVertexData {
		return _vertexData[bufferNames.normal];
	}

	public inline function setNormalData(data:FloatVertexData):Void {
		this._vertexData[bufferNames.normal] = data;
	}

	public inline function getUVData():FloatVertexData {
		return _vertexData[bufferNames.uv];
	}

	public inline function setUVData(data:FloatVertexData):Void {
		this._vertexData[bufferNames.uv] = data;
	}

	public inline function getColorData():FloatVertexData {
		return _vertexData[bufferNames.color];
	}

	public inline function setColorData(data:FloatVertexData):Void {
		this._vertexData[bufferNames.color] = data;
	}

	public inline function createInterleavedVertexData(stride:Int, interleavedDataStructure:Map<String, VertexInfo> = null):InterleavedVertexData {
		if (interleavedDataStructure == null) {
			interleavedDataStructure = this.cloneDefaultInterleavedStructure();
		}
		var vertexData = InterleavedVertexData.create(stride, interleavedDataStructure);
		this.setInterleavedVertexData(vertexData);
		return vertexData;
	}

	public inline function createPositionData():FloatVertexData {
		var vertexData = FloatVertexData.create(bufferNames.position, bufferVertexSizes.position);
		this.setPositionData(vertexData);
		return vertexData;
	}

	public inline function createNormalData():FloatVertexData {
		var vertexData = FloatVertexData.create(bufferNames.normal, bufferVertexSizes.normal);
		this.setNormalData(vertexData);
		return vertexData;
	}

	public inline function createUVData():FloatVertexData {
		var vertexData = FloatVertexData.create(bufferNames.uv, bufferVertexSizes.uv);
		this.setUVData(vertexData);
		return vertexData;
	}

	public inline function createColorData():FloatVertexData {
		var vertexData = FloatVertexData.create(bufferNames.color, bufferVertexSizes.color);
		this.setColorData(vertexData);
		return vertexData;
	}

	public inline function createIndexData():IndexData {
		var indexData = IndexData.create();
		this.setIndexData(indexData);
		return indexData;
	}

	public function getVertexCount():Int {
		if (this._vertexCount >= 0) {
			return this._vertexCount;

		} else {
			return this._inferredVertexCount;
		}
	}

	public function getIndexCount():Int {
		if (this._indexCount >= 0) {
			return this._indexCount;

		} else {
			return this._inferredIndexCount;
		}
	}

	/**
	 * Update any buffers that are dirty
	 */
	public function updateGeometry(bufferManager:GLBufferManager):Void {

		// Update vertex buffer attibutes
		var verticesUpdated:Bool = false;
		var vertexData = null;
		for (vertexDataIterator in this._vertexData) {

			// Write buffer (if needed)
			verticesUpdated = (verticesUpdated || vertexDataIterator.writeBuffer(bufferManager));
			vertexData = vertexDataIterator;
		}

		// Update interleaved vertex buffer data
		if (this._interleavedVertexData != null) {
			verticesUpdated = (verticesUpdated || this._interleavedVertexData.writeBuffer(bufferManager));
		}

		// Get vertex data count from vertex data
		if (verticesUpdated) {
			if (this._interleavedVertexData != null) {
				this._inferredVertexCount = this._interleavedVertexData.getVertexCount();

			} else {
				this._inferredVertexCount = vertexData.getVertexCount();
			}
		}

		// Update indices buffer
		if (this._indexData != null) {
			if (this._indexData.writeBuffer(bufferManager)) {
				this._inferredIndexCount = this._indexData.getIndexCount();
			}
		}
	}


	public function bindVertexBufferToAttribute(attributeName:String, attributeLocation:Int, bufferManager:GLBufferManager):Bool {
		// Check for interleaved attribute first
		if ((this._interleavedVertexData != null) && this._interleavedVertexData.bindToAttribute(attributeName, attributeLocation, bufferManager)) {
			// Interleaved buffer has been bound to program attribute
			return true;
		}

		// Otherwise look for individual buffer
		if (this._vertexData.exists(attributeName)) {
			var vertexData = this._vertexData.get(attributeName);

			// Bind to attribute location for individual buffer
			vertexData.bindToAttribute(attributeLocation, bufferManager);

			return true;
		}

		return false;
	}

}
